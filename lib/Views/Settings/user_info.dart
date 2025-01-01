import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Components/app_bar.dart';
import '../../Components/navigation_bar.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  final GlobalKey _formKey = GlobalKey();
  late TextEditingController _nameController = TextEditingController();
  late TextEditingController _surnameController = TextEditingController();
  late TextEditingController _phoneController = TextEditingController();
  late TextEditingController _emailController = TextEditingController();

  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController.text = "Muhammet İkbal";
    _surnameController.text = "Çakır";
    _phoneController.text = "05454462969";
    _emailController.text = "mamicakir30@gmail.com";
  }

  int _currentIndex = 2;

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
      appBar: CustomAppBar(
        userName: "Muhammet İkbal",
        isSettingsPage: true,
      ),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: Text(
                              "Hesap Bilgileri",
                              style: TextStyle(
                                color: Color(0xFF707070),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: "MBold",
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Hesap bilgilerinizi bu sayfada düzenleyebilirsiniz.",
                              style: TextStyle(
                                color: Color(0xFF707070),
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                fontFamily: "MR",
                              ),
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              controller: scrollController,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 10),
                                      _buildTextField(
                                        _nameController,
                                        'İsim',
                                        (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Lütfen İsminizi girin';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 15),
                                      _buildTextField(
                                        _surnameController,
                                        'Soyisim',
                                        (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Lütfen Soyisminizi girin';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 15),
                                      _buildTextField(
                                          _phoneController, 'Telefon Numarası',
                                          (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Lütfen Telefon numaranızı girin';
                                        }
                                        if (!RegExp(r"^\+?[0-9]{10,15}$")
                                            .hasMatch(value)) {
                                          return 'Lütfen Geçerli bir telefon numarası girin';
                                        }
                                        return null;
                                      }, keyboardType: TextInputType.phone),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 5),
                                        child: Text(
                                          'Lütfen telefon numaranızı başında +90 olacak şekilde giriniz.',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF707070),
                                            fontFamily: "NormalNunito",
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      _buildTextField(
                                          _emailController, 'E-posta', (value) {
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
                                          keyboardType:
                                              TextInputType.emailAddress),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      DropdownButtonFormField<int>(
                                        decoration: const InputDecoration(
                                          labelText: 'Şehir',
                                          labelStyle: TextStyle(
                                            color: Color(0xFF707070),
                                            fontSize: 17,
                                            fontFamily: "NormalNunito",
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xFF707070)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xFF707070)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xFF707070)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
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
                                        value: 1,
                                        // Varsayılan değer
                                        onChanged: (int? newValue) {
                                          // Seçilen şehirle ilgili işlemler
                                          print(
                                              "Seçilen şehir ID'si: $newValue");
                                        },
                                        items: [
                                          DropdownMenuItem(
                                            value: 1,
                                            child: Text("İstanbul"),
                                          ),
                                          DropdownMenuItem(
                                            value: 2,
                                            child: Text("Ankara"),
                                          ),
                                          DropdownMenuItem(
                                            value: 3,
                                            child: Text("İzmir"),
                                          ),
                                          DropdownMenuItem(
                                            value: 4,
                                            child: Text("Antalya"),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      DropdownButtonFormField<int>(
                                        decoration: const InputDecoration(
                                          labelText: 'Cinsiyet',
                                          labelStyle: TextStyle(
                                            color: Color(0xFF707070),
                                            fontSize: 17,
                                            fontFamily: "NormalNunito",
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xFF707070)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xFF707070)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xFF707070)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
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
                                        value: 1,
                                        // Varsayılan değer
                                        onChanged: (int? newValue) {
                                          // Seçilen şehirle ilgili işlemler
                                          print(
                                              "Seçilen şehir ID'si: $newValue");
                                        },
                                        items: [
                                          DropdownMenuItem(
                                            value: 1,
                                            child: Text("Erkek"),
                                          ),
                                          DropdownMenuItem(
                                            value: 2,
                                            child: Text("Kadın"),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          height: 55,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF5A6073),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          alignment: Alignment.center,
                                          child: const Text(
                                            'Kaydet',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "MRBold",
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
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

Widget _buildTextField(TextEditingController controller, String labelText,
    FormFieldValidator<String>? validator,
    {TextInputType keyboardType = TextInputType.text}) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: validator,
    controller: controller,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(
        color: Color(0xFF707070),
        fontSize: 17,
        fontFamily: "NormalNunito",
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF707070)),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF707070)),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF707070)),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
    ),
    style: const TextStyle(
      fontSize: 19,
      color: Color(0xFF707070),
    ),
    cursorColor: const Color(0xFF707070),
  );
}
