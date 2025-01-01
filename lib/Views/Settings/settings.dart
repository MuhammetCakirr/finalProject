import 'package:finalprojectapp/Views/Authentication/Signup/sign_up_first_page.dart';
import 'package:finalprojectapp/Views/Settings/my_applications.dart';
import 'package:finalprojectapp/Views/Settings/user_disability.dart';
import 'package:finalprojectapp/Views/Settings/user_info.dart';
import 'package:finalprojectapp/Views/Settings/user_skills.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../Components/app_bar.dart';
import '../../Components/navigation_bar.dart';


class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int _currentIndex = 5;

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.blueGrey,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(userName: "Muhammet İkbal", isSettingsPage: true,),
      body: Stack(
        children: [
          DraggableScrollableSheet(
            initialChildSize: (MediaQuery.of(context).size.height - 10) /
                MediaQuery.of(context).size.height,
            minChildSize: (MediaQuery.of(context).size.height - 10) /
                MediaQuery.of(context).size.height,
            maxChildSize: (MediaQuery.of(context).size.height - 10) /
                MediaQuery.of(context).size.height,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Padding(
                      padding:  EdgeInsets.symmetric(
                          horizontal: 20, vertical: 25),
                      child:  Text(
                        "Ayarlar",
                        style: TextStyle(
                          color: Color(0xFF707070),
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          fontFamily: "MBold",
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSettingOption(context, "Hesap Bilgilerim",const UserInfo(),subtitle: "Kişisel bilgilerinizi düzenleyebilirsiniz",),
                          _buildSettingOption(context, "Engel Bilgilerim",const UserDisability(),subtitle: "Engel bilgilerinizi düzenleyebilirsiniz",),
                          _buildSettingOption(context, "Yetkinlik Bilgilerim",const UserSkills(),subtitle: "Yetkinlik bilgilerinizi düzenleyebilirsiniz."),
                          _buildSettingOption(context, "Başvurularım",const MyApplications(),subtitle: "Daha önce yaptığınız başvurularınızı görüntüleyebilirsiniz."),
                          _buildSettingOption(context, "Çıkış",const SignUpFirstPage()),

                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTabSelected: _onTabSelected,
      ),
    ));
  }
}

Widget _buildSettingOption(BuildContext context, String title, Widget view, {String? subtitle}) {
  return GestureDetector(
    onTap: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => view),
      );
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade300,
              width: 1,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF707070),
                    fontSize: 18,
                    fontFamily: "MR",
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF707070),
                  size: 16,
                ),
              ],
            ),
            if (subtitle != null && subtitle.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFFB0B0B0),
                    fontSize: 14,
                    fontFamily: "MR",
                  ),
                ),
              ),
          ],
        ),
      ),
    ),
  );
}

