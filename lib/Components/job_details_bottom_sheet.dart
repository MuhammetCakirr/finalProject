import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JobDetailsBottomSheet<T extends ChangeNotifier> extends StatelessWidget {
  final String title;
  final String details;
  final Widget Function(BuildContext, T, Widget?) consumerBuilder;
  final void Function(T provider)? onActionButtonPressed;

  const JobDetailsBottomSheet({
    Key? key,
    required this.title,
    required this.details,
    required this.consumerBuilder,
    this.onActionButtonPressed,
  }) : super(key: key);

  static void show<T extends ChangeNotifier>(
      BuildContext context, {
        required String title,
        required String details,
        required Widget Function(BuildContext, T, Widget?) consumerBuilder,
        void Function(T provider)? onActionButtonPressed,
      }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => JobDetailsBottomSheet<T>(
        title: title,
        details: details,
        consumerBuilder: consumerBuilder,
        onActionButtonPressed: onActionButtonPressed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height * 0.75;

    return Consumer<T>(
      builder: (context, provider, child) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            constraints: BoxConstraints(maxHeight: maxHeight),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Drag indicator
                    Center(
                      child: Container(
                        width: 40,
                        height: 6,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                    // Title and details
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            details,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Custom content via consumerBuilder
                          consumerBuilder(context, provider, child),
                          const SizedBox(height: 20),
                          // Optional Action Button
                          if (onActionButtonPressed != null)
                            ElevatedButton(
                              onPressed: () => onActionButtonPressed!(provider),
                              child: const Text("Action Button"),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
