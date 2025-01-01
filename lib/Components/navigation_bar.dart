import 'package:finalprojectapp/Views/Settings/user_info.dart';
import 'package:finalprojectapp/Views/Special/special_splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Views/Home/home.dart';
import '../Views/Special/special_splash2.dart';



class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        BottomAppBar(
          color: Colors.white,
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.add_chart, "Tüm İlanlar", 0),
              const  SizedBox(width: 48),
              _buildNavItem(Icons.person, "Hesabım", 2),
            ],
          ),
        ),


        Positioned(
          top: -35,
          left: MediaQuery.of(context).size.width / 2 - 35,
          child: GestureDetector(
            onTap: () {
              widget.onTabSelected(1);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SpecialSplash2()),
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                Container(
                  width: 68,
                  height: 68,
                  decoration: BoxDecoration(
                    color: widget.currentIndex == 1 ? Colors.blueGrey : Colors.grey,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 4,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/canta3.png',
                      width: 35,
                      height: 35,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Bana Özel",
                    style: TextStyle(
                      color: widget.currentIndex == 1 ? Colors.blueGrey : Colors.grey,
                        fontFamily: "MR"
                    ),
                  ),
                ),
              ],
            ),
          ),
        )

      ],
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {
        widget.onTabSelected(index);
        _navigateToPage(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: widget.currentIndex == index ? Colors.blueGrey : Colors.grey,
            size: 35,
          ),
          Text(
            label,
            style: TextStyle(
              color: widget.currentIndex == index ? Colors.blueGrey : Colors.grey, fontFamily: "MR"
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToPage(int index) {
    switch (index) {
      case 0:

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
        break;
      case 2:

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>const UserInfo()),
        );
        break;
      default:
        break;
    }
  }
}


