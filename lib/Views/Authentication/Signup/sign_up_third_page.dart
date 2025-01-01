import 'package:finalprojectapp/Controllers/sign_up_controller.dart';
import 'package:finalprojectapp/Views/Home/home.dart';
import 'package:finalprojectapp/Views/Settings/user_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpThirdPage extends StatefulWidget  {
  const SignUpThirdPage({super.key});

  @override
  State<SignUpThirdPage> createState() => _SignUpThirdPageState();
}

class _SignUpThirdPageState extends State<SignUpThirdPage> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blueGrey,
          resizeToAvoidBottomInset: true,
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                    vertical: 50
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Center(
                            child: Image.asset(
                              'assets/images/logo6.png',
                              height: MediaQuery.of(context).size.height * 0.18,
                              fit: BoxFit.cover,

                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Engelleri birlikte aşıyoruz! Kişiselleştirilmiş iş ilanları ve şeffaf bir kariyer süreciyle, hayalleriniz için güçlü bir adım atın.",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: "MR"),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              DraggableScrollableSheet(
                initialChildSize: 0.59,
                minChildSize: 0.59,
                maxChildSize: 0.59,
                builder: (context, scrollController) {
                  return Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              controller: scrollController,
                              child: Consumer<SignUpController>(
                                builder: (BuildContext context,  provider, Widget? child) {
                                  return  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Yetkinliklerinizi Seçin",
                                        style: TextStyle(
                                          color: Color(0xFF707070),
                                          fontSize: 25,
                                          fontFamily: "MBOLD",
                                        ),
                                      ),
                                      const Text(
                                        "Hangi alanlarda yetkin olduğunuzu belirtin, size uygun iş ilanlarını daha iyi önerelim.",
                                        style: TextStyle(
                                          color: Color(0xFF707070),
                                          fontSize: 15,
                                          fontFamily: "MR",
                                        ),
                                      ),
                                      const  SizedBox(height: 15,),

                                      Wrap(
                                        spacing: 8.0, // Yatay boşluk
                                        runSpacing: 8.0, // Dikey boşluk
                                        children: provider.skillList.map((skill) {
                                          final String skillId = skill['id']!; // 'id' değerini alın
                                          final bool isSelected = provider.selectedSkillList.contains(skillId);
                                          return GestureDetector(
                                            onTap: () {
                                              provider.toggleSkill(skillId);
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                                              decoration: BoxDecoration(
                                                color: isSelected ? Colors.blue.withOpacity(0.2) : Colors.grey.withOpacity(0.1),
                                                borderRadius: BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: isSelected ? Colors.blue : const Color(0xFF5A6073),
                                                  width: 1.5,
                                                ),
                                              ),
                                              child: SingleChildScrollView(
                                                scrollDirection: Axis.horizontal,
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [

                                                    if (isSelected)
                                                      const Icon(
                                                        Icons.check_circle,
                                                        color: Colors.blue,
                                                        size: 20,
                                                      ),
                                                    if (isSelected)
                                                      const SizedBox(width: 8.0),
                                                    Text(
                                                      skill['name']!,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: isSelected ? Colors.blue : const Color(0xFF5A6073),
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),

                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      )
                                      ,

                                      const SizedBox(height: 25,),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Container(
                                                height: 55,
                                                decoration: BoxDecoration(
                                                  color:  Colors.grey,
                                                  borderRadius: BorderRadius.circular(12),
                                                ),
                                                alignment: Alignment.center,
                                                child: const Text(
                                                  'Geri',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "MR",
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10,),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: (provider.isThirdPageButtonEnabled)
                                                  ? () async {
                                                await provider.signUp();
                                                if (provider.isThirdPageButtonEnabled) {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => const Home()),
                                                  );
                                                } else {
                                                  print('Hatalar var');
                                                }
                                              }
                                                  : null,
                                              child: Container(
                                                height: 55,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: (provider.isThirdPageButtonEnabled)
                                                      ? const Color(0xFF5A6073)
                                                      : Colors.grey.withOpacity(0.4),
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                                alignment: Alignment.center,
                                                child: provider.isLoading
                                                    ? const Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Lütfen Bekleyiniz..',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold,
                                                        fontFamily: "MR",
                                                      ),
                                                    ),
                                                    SizedBox(width: 10),
                                                    CircularProgressIndicator(
                                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                                      strokeWidth: 0.5,
                                                    ),
                                                  ],
                                                )
                                                    : const Text(
                                                  'Kayıt Ol',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "MR",
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),

                                        ],
                                      )

                                    ],
                                  );
                                },

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),

        )

    );
  }
}
