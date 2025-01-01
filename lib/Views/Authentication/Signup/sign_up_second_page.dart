import 'package:finalprojectapp/Controllers/sign_up_controller.dart';
import 'package:finalprojectapp/Views/Authentication/Signup/sign_up_third_page.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpSecondPage extends StatefulWidget  {
  const SignUpSecondPage({super.key});

  @override
  State<SignUpSecondPage> createState() => _SignUpSecondPageState();
}

class _SignUpSecondPageState extends State<SignUpSecondPage> {
  final GlobalKey _formkey=GlobalKey();
  late TextEditingController _disabiltyRageController=TextEditingController() ;
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
                    child: Consumer<SignUpController>(
                      builder: (BuildContext context, provider, Widget? child) {
                        return Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              Container(
                                width: 40,
                                height: 6,
                                margin: const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),

                              Expanded(
                                child: SingleChildScrollView(
                                  controller: scrollController,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Engel Bilgisi",
                                          style: TextStyle(
                                            color: Color(0xFF707070),
                                            fontSize: 25,
                                            fontFamily: "MBOLD",
                                          ),
                                        ),
                                        const Text(
                                          "Size özel iş ilanları sunabilmemiz için engel durumunuzu belirtin.",
                                          style: TextStyle(
                                            color: Color(0xFF707070),
                                            fontSize: 15,
                                            fontFamily: "MR",
                                          ),
                                        ),
                                        const  SizedBox(height: 15,),

                                        DropdownButtonFormField<String>(
                                          decoration: const InputDecoration(
                                            labelText: 'Engel Türü',
                                            labelStyle: TextStyle(
                                              color: Color(0xFF707070),
                                              fontSize: 17,
                                              fontFamily: "NormalNunito",
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Color(0xFF707070)),
                                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Color(0xFF707070)),
                                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(color: Color(0xFF707070)),
                                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                            ),
                                          ),
                                          style: const TextStyle(
                                            color: Color(0xFF707070), // Seçilen değerin rengi
                                            fontSize: 17, // Yazı boyutu label ile aynı
                                            fontFamily: "NormalNunito", // Font ailesi label ile aynı
                                          ),
                                          value: provider.selectedDisablity,
                                          onChanged: (String? newValue) {
                                            context.read<SignUpController>().setSelectedDisablity(newValue!);
                                          },
                                          items: provider.disabilityList.map<DropdownMenuItem<String>>((disability) {
                                            return DropdownMenuItem<String>(
                                              value: disability['id'],
                                              child: Text(disability['name']),
                                            );
                                          }).toList(),
                                        ),


                                        const SizedBox(height: 15,),
                                        TextFormField(
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Lütfen Engel Seviyesini Girin';
                                            }
                                            final intValue = int.tryParse(value);
                                            if (intValue == null) {
                                              return 'Sadece sayı giriniz';
                                            }
                                            if (intValue < 1 || intValue > 100) {
                                              return 'Değer 1 ile 100 arasında olmalıdır';
                                            }
                                            return null;
                                          },
                                          onChanged:(value) {
                                            context
                                                .read<SignUpController>()
                                                .setDisabilityRage(value);
                                          },
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          decoration: const InputDecoration(
                                            labelText: 'Engel Seviyesi',
                                            hintText: "örnek:%40",
                                            labelStyle: TextStyle(
                                              color: Color(0xFF707070),
                                              fontSize: 17,
                                              fontFamily: "NormalNunito",
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Color(0xFF707070)),
                                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Color(0xFF707070)),
                                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(color: Color(0xFF707070)),
                                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                            ),
                                          ),
                                          style: const TextStyle(
                                            fontSize: 17,
                                            color: Color(0xFF707070),
                                          ),
                                          cursorColor: const  Color(0xFF707070),
                                        ),

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
                                            const  SizedBox(width: 10,),
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: (provider.isSecondPageButtonEnabled)
                                                    ? () async {
                                                  await provider.NextButtonClick();

                                                  if (provider.disabilityRage.isNotEmpty ) {

                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => const SignUpThirdPage()),
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
                                                    color: (provider.isSecondPageButtonEnabled)
                                                        ? const  Color(0xFF5A6073)
                                                        : Colors.grey.withOpacity(0.4),
                                                    borderRadius:
                                                    BorderRadius.circular(8),
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: provider.isLoading
                                                      ? const Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: const [
                                                      Text(
                                                        'İlerleniyor...',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          fontFamily: "MR",
                                                        ),
                                                      ),
                                                      SizedBox(width: 10),
                                                      CircularProgressIndicator(
                                                        strokeAlign: 1,
                                                        valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                            Colors.white),
                                                        strokeWidth: 0.5,
                                                      ),
                                                    ],
                                                  )
                                                      : const Text(
                                                    'İlerle',
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
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },

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
