import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../Components/app_bar.dart';
import '../../Components/navigation_bar.dart';
import '../Home/home.dart';

class UserSkills extends StatefulWidget {
  const UserSkills({super.key});

  @override
  State<UserSkills> createState() => _UserSkillsState();
}

class _UserSkillsState extends State<UserSkills> {
  int _currentIndex = 5;

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  final List<String> skills = [
    "Çağrı Merkezi Operatörlüğü (Müşteri hizmetleri ve telefon desteği)",
    "Veri Girişi ve Yönetimi (Excel, CRM sistemleri)",
    "Online Satış (E-ticaret platformları, ürün yönetimi)",
    "İçerik Yönetimi ve Yazımı (Blog yazıları, SEO uyumlu içerik)",
    "Müşteri Destek (E-posta, canlı destek hizmetleri)",
    "Sosyal Medya Yönetimi (İçerik planlama, reklam yönetimi)",
    "Çeviri ve Dil Hizmetleri (Farklı dillerde içerik üretimi ve çeviri)",
    "Dijital Grafik ve Tasarım (Logo, afiş, sosyal medya tasarımları)",
    "Web Tasarımı (HTML, CSS, kullanıcı deneyimi tasarımı)",
    "Seslendirme ve Dublaj (Reklam, eğitim videoları, animasyon)",
    "Muhasebe ve Finans Yönetimi (Fatura takibi, bütçe planlama)",
    "Proje Koordinasyonu (Planlama, ekip yönetimi, süreç takibi)",
    "Yazılım Test Uzmanlığı (Manuel ve otomasyon testleri)",
    "Erişilebilirlik Danışmanlığı (Web ve mobil uygulama erişilebilirliği)",
    "Hafif Montaj İşleri (Küçük ölçekli el işleri, ürün montajı)",
    "Sanatsal Üretim ve El İşleri (El yapımı ürünler, resim, takı)",
    "Online Danışmanlık ve Koçluk (Kariyer, yaşam, iş geliştirme koçluğu)",
  ];


  final Set<String> selectedSkills = {};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor:Colors.blueGrey,
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              controller: scrollController,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Yetkinlik Bilgileri",
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
                                  const Text(
                                    "Mevcut yetkinlik bilgilerinizi düzenleyebilir veya sağ üstteki 'Ekle' butonuyla yeni bilgiler ekleyebilirsiniz.",
                                    style: TextStyle(
                                      color: Color(0xFF707070),
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "MR",
                                    ),
                                  ),
                                  const  SizedBox(height: 15,),

                                  Wrap(
                                    spacing: 8.0,
                                    runSpacing: 8.0,
                                    children: skills.map((skill) {
                                      final isSelected = selectedSkills.contains(skill);

                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (isSelected) {
                                              selectedSkills.remove(skill);
                                            } else {
                                              selectedSkills.add(skill);
                                            }
                                          });
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
                                            scrollDirection: Axis.horizontal, // Yatay kaydırma
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
                                                  skill,
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
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => Home()),
                                      );
                                    },
                                    child: Container(
                                      height: 55,
                                      decoration: BoxDecoration(
                                        color:  const  Color(0xFF5A6073),
                                        borderRadius: BorderRadius.circular(12),
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
                                  const SizedBox(height: 10,),
                                ],
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
    isScrollControlled: true,
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
          bottom: MediaQuery.of(context).viewInsets.bottom,
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
                "Yetkinlik Ekle",
                style: TextStyle(
                  color: Color(0xFF707070),
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  fontFamily: "MBold",
                ),
              ),
              const SizedBox(height:20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Yetkinlik Adı',
                  hintText: "Müşteri Çağrı Hizmetleri",
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
