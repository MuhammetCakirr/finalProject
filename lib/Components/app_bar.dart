import 'package:finalprojectapp/Views/Settings/settings.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  bool isSettingsPage;

  CustomAppBar({required this.userName, required this.isSettingsPage});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueGrey,
      foregroundColor: Colors.blueGrey,
      elevation: 0,
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 40),
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hoşgeldin, ',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "MR",
                      color: Color(0xFFFBFBFB)),
                ),
                Text(
                  userName,
                  style: const TextStyle(
                      fontSize: 18,
                      fontFamily: "MR",
                      color: Color(0xFFFBFBFB)),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0, top: 10),
          child: isSettingsPage
              ? Stack(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Settings()),
                  );
                },
              ),
              Positioned(
                top: 6,
                right: 6,
                child: Container(
                  width: 11,
                  height: 11,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          )
              : IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const Settings()),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}

