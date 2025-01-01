import 'package:finalprojectapp/Controllers/sign_up_controller.dart';
import 'package:finalprojectapp/Views/Authentication/Signup/sign_up_second_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class SignUpFirstPage extends StatefulWidget  {
  const SignUpFirstPage({super.key});

  @override
  State<SignUpFirstPage> createState() => _SignUpFirstPageState();
}

class _SignUpFirstPageState extends State<SignUpFirstPage> {

  final GlobalKey _formkey=GlobalKey();
  late TextEditingController _nameController=TextEditingController() ;
  late TextEditingController _surnameController=TextEditingController();
  late TextEditingController _phoneController=TextEditingController();
  late TextEditingController _emailController=TextEditingController();

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
                              child: Consumer<SignUpController>(
                                builder: (BuildContext context, provider, Widget? child) {
                                  return Form(
                                    key: _formkey,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Kişiselleştirilmiş iş ilanları için",
                                          style: TextStyle(
                                            color: Color(0xFF707070),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "MBOLD",
                                          ),
                                        ),
                                        const Text(
                                          "Kayıt Olun",
                                          style: TextStyle(
                                            color: Color(0xFF707070),
                                            fontSize: 25,

                                            fontFamily: "MBOLD",
                                          ),
                                        ),
                                        const SizedBox(height: 15,),

                                        TextFormField(
                                          validator:(value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Lütfen İsmizi girin';
                                            }
                                            return null;
                                          },
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          onChanged:(value) {
                                            context
                                                .read<SignUpController>()
                                                .setName(value);
                                          },
                                          controller: _nameController,
                                          decoration: const InputDecoration(
                                            labelText: 'İsim',
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
                                            fontSize: 19,
                                            color: Color(0xFF707070),
                                          ),
                                          cursorColor: Color(0xFF707070),
                                        ),
                                        const  SizedBox(height: 15,),
                                        TextFormField(
                                          validator:(value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Lütfen Soyisminizi girin';
                                            }
                                            return null;
                                          },
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          onChanged:(value) {
                                            context
                                                .read<SignUpController>()
                                                .setSurname(value);
                                          },
                                          controller: _surnameController,
                                          decoration: const InputDecoration(
                                            labelText: 'Soyisim',
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
                                            fontSize: 19,
                                            color: Color(0xFF707070),
                                          ),
                                          cursorColor: Color(0xFF707070),
                                        ),

                                        const SizedBox(height: 15,),
                                        TextFormField(
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Lütfen Telefon numaranızı girin';
                                            }
                                            if (!RegExp(r"^\+?[0-9]{10,15}$")
                                                .hasMatch(value)) {
                                              return 'Lütfen Geçerli bir telefon numarası girin';
                                            }
                                            return null;
                                          },
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          onChanged:(value) {
                                            context
                                                .read<SignUpController>()
                                                .setPhone(value);
                                          },
                                          controller: _phoneController,
                                          decoration: const InputDecoration(
                                            labelText: 'Telefon Numarası',
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
                                            fontSize: 19,
                                            color: Color(0xFF707070),
                                          ),
                                          cursorColor: Color(0xFF707070),
                                        ),
                                        const   SizedBox(height: 15,),
                                        TextFormField(
                                              validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Lütfen E-mail adresinizi girin';
                                            }
                                            if (!RegExp(
                                                r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+")
                                                .hasMatch(value)) {
                                              return 'Lütfen Geçerli bir e-mail adresi girin';
                                            }
                                            return null;
                                          },
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          onChanged:(value) {
                                            context
                                                .read<SignUpController>()
                                                .setEmail(value);
                                          },
                                          controller: _emailController,
                                          decoration: const InputDecoration(
                                            labelText: 'E-posta',
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
                                            fontSize: 19,
                                            color: Color(0xFF707070),
                                          ),
                                          cursorColor: Color(0xFF707070),
                                        ),

                                        const  SizedBox(height: 15,),
                                        DropdownButtonFormField<String>(
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          decoration: const InputDecoration(
                                            labelText: 'Şehir',
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
                                            fontSize: 16,
                                            color: Color(0xFF707070),
                                          ),
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Color(0xFF707070),
                                          ),
                                          value: provider.cityList.first['id'],
                                          onChanged: (String? newValue) {
                                            context.read<SignUpController>().setSelectedCity(newValue!);
                                          },
                                          items: provider.cityList.map<DropdownMenuItem<String>>((city) {
                                            return DropdownMenuItem<String>(
                                              value: city['id'], // Ensure this is a String
                                              child: Text(city['name']),
                                            );
                                          }).toList(),
                                        ),

                                        const   SizedBox(height: 15,),
                                        DropdownButtonFormField<String>(
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          decoration: const InputDecoration(
                                            labelText: 'Cinsiyet',
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
                                            fontSize: 16,
                                            color: Color(0xFF707070),
                                          ),
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Color(0xFF707070),
                                          ),
                                          value: "Erkek", // Default gender
                                          onChanged: (String? newValue) {
                                            provider.setSelectedGender(newValue!);
                                          },
                                          items: ['Erkek', 'Kadın'].map<DropdownMenuItem<String>>((gender) {
                                            return DropdownMenuItem<String>(
                                              value: gender,
                                              child: Text(gender),
                                            );
                                          }).toList(),
                                        ),

                                        const  SizedBox(height: 25,),

                                      GestureDetector(
                                        onTap: (provider.isFirstPageButtonEnabled)
                                            ? () async {
                                          await provider.NextButtonClick();
                                          final email = provider.email;
                                          final name = provider.name;
                                          final phone = provider.phone;
                                          final surname = provider.surname;
                                          final city = provider.selectedCity;
                                          final gender = provider.selectedGender;

                                          if (email.isNotEmpty && name.isNotEmpty && surname.isNotEmpty && city.isNotEmpty&& gender.isNotEmpty&& phone.isNotEmpty) {
                                            print('Kayıt başarılı: $email, $name, $surname,$phone,$city,$gender');
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => const SignUpSecondPage()),
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
                                            color: (provider.isFirstPageButtonEnabled)
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
                                            ),
                                          ),
                                        ),
                                      ),


                                        const  SizedBox(height: 25,),
                                      ],
                                    ),
                                  );
                                },

                              ),

                            ),
                          ),
                        ),
                      ],
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
