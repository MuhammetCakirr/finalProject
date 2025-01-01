import 'package:finalprojectapp/Views/Settings/user_info.dart';
import 'package:finalprojectapp/Views/Settings/user_skills.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../Components/app_bar.dart';
import '../../Components/navigation_bar.dart';
import '../Home/home.dart';

class UserDisability extends StatefulWidget  {
  const UserDisability({super.key});

  @override
  State<UserDisability> createState() => _UserDisabilityState();
}

class _UserDisabilityState extends State<UserDisability> {
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
                initialChildSize: (MediaQuery.of(context).size.height -10) /
                    MediaQuery.of(context).size.height,
                minChildSize: (MediaQuery.of(context).size.height -10) /
                    MediaQuery.of(context).size.height,
                maxChildSize: (MediaQuery.of(context).size.height -10) /
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
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Engel Bilgileri",
                                      style: TextStyle(
                                        color: Color(0xFF707070),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "MBold",
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFEBEBEB) ,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: TextButton.icon(
                                        onPressed: () {
                                          _showJobDetails(context);
                                        },
                                        icon:const Icon(
                                          Icons.add,
                                          size: 16,
                                          color: Color(0xFF707070),
                                        ),
                                        label:const Text(
                                          "Ekle",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF707070),
                                            fontFamily: "MRBold",
                                          ),
                                        ),
                                        style: TextButton.styleFrom(
                                          padding:const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                                          minimumSize: const Size(0, 0),
                                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              const Padding(
                                padding:   EdgeInsets.symmetric(horizontal: 20),
                                child:  Text(
                                  "Mevcut engel bilgilerinizi düzenleyebilir, sağ üstteki 'Ekle' butonuyla yeni bilgiler ekleyebilir veya sola kaydırarak silebilirsiniz.",
                                  style: TextStyle(
                                    color: Color(0xFF707070),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "MR",
                                  ),
                                ),
                              ),

                              Expanded(
                                child: ListView.builder(
                                  controller: scrollController,
                                  itemCount: 4,
                                  itemBuilder: (context, index) {

                                    return  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      child: Slidable (
                                        endActionPane: ActionPane(
                                          motion: const StretchMotion(
                                          ),
                                          children: [

                                            SlidableAction(
                                              backgroundColor: Colors.red,
                                              icon: Icons.delete_forever_rounded,
                                              label: "Sil",
                                              onPressed: (BuildContext context) {
                                              },
                                            ),

                                          ],
                                        ),

                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: const Color(0xFFFFF1F0E8),
                                              width: 1,
                                            ),

                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                DropdownButtonFormField<String>(
                                                  decoration: const InputDecoration(
                                                    labelText: 'Engel Türü',
                                                    labelStyle: TextStyle(
                                                      color: Color(0xFF707070),
                                                      fontSize: 17,
                                                      fontFamily: "MR",
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
                                                  value: null,
                                                  onChanged: (String? newValue) {

                                                    print("Seçilen engel türü: $newValue");
                                                  },
                                                  items: [
                                                    const  DropdownMenuItem(value: 'Görme Engeli', child: Text('Görme Engeli',style: TextStyle(fontFamily: "MR",color: Color(0xFF707070)),)),
                                                    const  DropdownMenuItem(value: 'İşitme Engeli', child: Text('İşitme Engeli',style: TextStyle(fontFamily: "MR",color: Color(0xFF707070)),)),
                                                    const DropdownMenuItem(value: 'Fiziksel Engeli', child: Text('Fiziksel Engeli',style: TextStyle(fontFamily: "MR",color: Color(0xFF707070)),)),
                                                    const  DropdownMenuItem(value: 'Zihinsel/Öğrenme Güçlüğü', child: Text('Zihinsel/Öğrenme Güçlüğü',style: TextStyle(fontFamily: "MR",color: Color(0xFF707070)),)),
                                                    const  DropdownMenuItem(value: 'Kronik Hastalık', child: Text('Kronik Hastalık',style: TextStyle(fontFamily: "MR",color: Color(0xFF707070)),)),
                                                    const  DropdownMenuItem(value: 'Psikososyal Engeli', child: Text('Psikososyal Engeli',style: TextStyle(fontFamily: "MR",color: Color(0xFF707070)),)),
                                                    const  DropdownMenuItem(value: 'Dil ve Konuşma Bozukluğu', child: Text('Dil ve Konuşma Bozukluğu',style: TextStyle(fontFamily: "MR",color: Color(0xFF707070)),)),
                                                    const  DropdownMenuItem(value: 'Diğer', child: Text('Diğer',style: TextStyle(fontFamily: "MR",color: Color(0xFF707070)),)),
                                                  ],
                                                ),
                                                const SizedBox(height: 15,),
                                                TextFormField(
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
                                                  cursorColor: Color(0xFF707070),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),

                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
          bottomNavigationBar: CustomBottomNavigationBar(
            currentIndex: _currentIndex,
            onTabSelected: _onTabSelected,
          ),
        ));
  }
}

void _showJobDetails(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Klavye açıldığında içerik yukarı çıkması için
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom, // Klavye yüksekliği kadar boşluk
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              const Text(
                "Engel Bilgisi Ekle",
                style: TextStyle(
                  color: Color(0xFF707070),
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  fontFamily: "MBold",
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Engel Türü',
                  labelStyle: TextStyle(
                    color: Color(0xFF707070),
                    fontSize: 17,
                    fontFamily: "MR",
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
                value: null,
                onChanged: (String? newValue) {
                  print("Seçilen engel türü: $newValue");
                },
                items: const [
                  DropdownMenuItem(value: 'Görme Engeli', child: Text('Görme Engeli')),
                  DropdownMenuItem(value: 'İşitme Engeli', child: Text('İşitme Engeli')),
                  DropdownMenuItem(value: 'Fiziksel Engeli', child: Text('Fiziksel Engeli')),
                  DropdownMenuItem(value: 'Zihinsel/Öğrenme Güçlüğü', child: Text('Zihinsel/Öğrenme Güçlüğü')),
                  DropdownMenuItem(value: 'Kronik Hastalık', child: Text('Kronik Hastalık')),
                  DropdownMenuItem(value: 'Psikososyal Engeli', child: Text('Psikososyal Engeli')),
                  DropdownMenuItem(value: 'Dil ve Konuşma Bozukluğu', child: Text('Dil ve Konuşma Bozukluğu')),
                  DropdownMenuItem(value: 'Diğer', child: Text('Diğer')),
                ],
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Engel Seviyesi',
                  hintText: "örnek:%40",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                    fontFamily: "NormalNunito",
                  ),
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
                cursorColor: const Color(0xFF707070),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: const Color(0xFF5A6073),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Ekle',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: "MBold",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      );
    },
  );
}
