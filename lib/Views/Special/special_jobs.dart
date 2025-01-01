import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../../Components/app_bar.dart';
import '../../Components/filter_bottom_sheet.dart';
import '../../Components/navigation_bar.dart';
import '../../Controllers/home_controller.dart';
import '../Home/home.dart';

class SpecialJobs extends StatefulWidget  {
  const SpecialJobs({super.key});

  @override
  State<SpecialJobs> createState() => _SpecialJobsState();
}

class _SpecialJobsState extends State<SpecialJobs> {
  final List<String> selectedDates = [];

  final List<String> dateOptions = [
    "Son 1 Gün",
    "Son 4 Gün",
    "Son 1 Hafta",
    "Son 2 Hafta",
    "Son 1 Ay"
  ];


  int _currentIndex = 1;

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
          appBar: CustomAppBar(userName: "Muhammet İkbal", isSettingsPage: false,),
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
                                      "Size Özel İş İlanları",
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
                                          _showFilter(context,dateOptions,selectedDates);
                                        },
                                        icon:const Icon(
                                          Icons.filter_list,
                                          size: 16,
                                          color: Color(0xFF707070),
                                        ),
                                        label:const Text(
                                          "Filtrele",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF707070),
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "MR",
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
                                padding:  EdgeInsets.only(left: 20,right: 20,bottom: 5),
                                child:  Text(
                                  "Engellilik türünüz, başvurularınız, lokasyonunuz ve yetkinliklerinize göre size özel iş ilanlarını burada bulabilirsiniz.",
                                  style: TextStyle(
                                    color: Color(0xFF707070),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "MR",
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  controller: scrollController,
                                  itemCount: 20,
                                  itemBuilder: (context, index) {
                                    List<String> imageUrls = [
                                      "https://media.licdn.com/dms/image/v2/C4D0BAQErSVTEjR_uFg/company-logo_100_100/company-logo_100_100/0/1678256491081/anadoluefes_logo?e=2147483647&v=beta&t=qZ_ZlxbTbwyu3y8k3SJDXoWIlF_AiqS1IgG9L9GeCjE",
                                      "https://media.licdn.com/dms/image/v2/C4E0BAQHq33akTF76eA/company-logo_100_100/company-logo_100_100/0/1679061166847/hm_logo?e=2147483647&v=beta&t=EJEWNoFmNEh77Ma_WEkty8xBK6yX37uTMl7HVNRiP0U",
                                      "https://media.licdn.com/dms/image/v2/C560BAQGAjVTnzEmlYQ/company-logo_100_100/company-logo_100_100/0/1630668724567/vodafone_logo?e=2147483647&v=beta&t=yGFOzh3ufnpJOCRIIzBzcpYAjjfr9bFDqUMDk4cop7Y",
                                      "https://media.licdn.com/dms/image/v2/D4D0BAQFqM5IpY4dKrg/company-logo_100_100/company-logo_100_100/0/1721890755899/nesine_com_logo?e=2147483647&v=beta&t=4ONNNpblwRXpMlWnrRNdRr8comPCjocGvxn6uyjSV0M",
                                      "https://media.licdn.com/dms/image/v2/D4D0BAQEvJdVts4smrA/company-logo_100_100/company-logo_100_100/0/1699953278271/turknet_logo?e=2147483647&v=beta&t=VRop2ypTJsBU8sSORqGI5RQhzG0QzwViVFjk6TCmclk"
                                    ];
                                    String imageUrl = imageUrls[index % imageUrls.length];
                                    return  GestureDetector(
                                      onTap: (){
                                        _showJobDetails(context,"Genel Başvuru (Engelli)","Detaylar");
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        child: Slidable (
                                          endActionPane: ActionPane(
                                            motion: const StretchMotion(
                                            ),
                                            children: [

                                              SlidableAction(
                                                backgroundColor:const Color(0xFF5A6073),
                                                icon: Icons.location_on,
                                                label: "Gör",
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
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Image.network(
                                                      imageUrl,
                                                      width: MediaQuery.of(context).size.width * 0.15,
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [

                                                          const Text(
                                                            'Genel Başvuru (Engelli)',
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              fontFamily: "MRIt",
                                                              color: Color(0xFF707070),
                                                            ),
                                                          ),
                                                          const SizedBox(height: 4),
                                                          // Lokasyon
                                                          const Text(
                                                            'İstanbul, Türkiye',
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily: "MR",
                                                              color: Color(0xFF707070),
                                                            ),
                                                            softWrap: true,
                                                          ),
                                                          const SizedBox(height: 4),

                                                          // Çalışma Türü ve Kaynak
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              const Text(
                                                                'Tam Zamanlı',
                                                                style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontFamily: "MR",
                                                                  color: Color(0xFF707070),
                                                                ),
                                                              ),
                                                              const Text(
                                                                'Eleman.net',
                                                                style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontFamily: "MR",
                                                                  color: Color(0xFF707070),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )
                                                ,
                                                const SizedBox(height: 4),

                                                Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                  decoration: BoxDecoration(
                                                    color: Colors.blue.shade100,
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  child: const Text(
                                                    'Engelinize uygun olarak önerildi',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: "MR",
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
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
        )

    );
  }
}
void _showJobDetails(BuildContext context, String title, String details) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape:   RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      double maxHeight = MediaQuery.of(context).size.height * 0.75;
      return Consumer<HomeController>(
        builder: (context, provider, child) {
          return Padding(
            padding:  EdgeInsets.only( bottom: MediaQuery.of(context).viewInsets.bottom,),
            child: Container(
              constraints: BoxConstraints(
                maxHeight: maxHeight,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 40,
                          height: 6,
                          margin:const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ClipOval(
                                      child: Image.network(
                                        "https://media.licdn.com/dms/image/v2/C4D0BAQErSVTEjR_uFg/company-logo_100_100/company-logo_100_100/0/1678256491081/anadoluefes_logo?e=2147483647&v=beta&t=qZ_ZlxbTbwyu3y8k3SJDXoWIlF_AiqS1IgG9L9GeCjE",
                                        width: MediaQuery.of(context).size.width * 0.12,
                                        height: MediaQuery.of(context).size.width * 0.12,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    const Text(
                                      "Anadolu Efes",
                                      style: TextStyle(
                                        color: Color(0xFF707070),
                                        fontSize: 15,
                                        fontFamily: "MBold",
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Text(
                                    "İlan Şu anda Aktif",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontFamily: "MRBold",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Genel Başvuru (Engelli Kadro)",
                              style: TextStyle(
                                color: Color(0xFF707070),
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                fontFamily: "MBold",
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "İstanbul, Türkiye",
                                  style: TextStyle(
                                    color: Color(0xFF707070),
                                    fontSize: 15,
                                    fontFamily: "MR",
                                  ),
                                ),
                                Text(
                                  "2 gün önce",
                                  style: TextStyle(
                                    color: Color(0xFF707070),
                                    fontSize: 15,
                                    fontFamily: "MR",
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/canta5.png',
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(width: 5),
                                const Text(
                                  "Tam Zamanlı, Hybrid",
                                  style: TextStyle(
                                    color: Color(0xFF707070),
                                    fontSize: 15,
                                    fontFamily: "MR",
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Aranılan Özellikler",
                              style: TextStyle(
                                color: Color(0xFF707070),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: "MBold",
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "• Tercihen daha önce iş deneyimi edinmiş",
                              style: TextStyle(
                                color: Color(0xFF707070),
                                fontSize: 14,
                                fontFamily: "MR",
                              ),
                            ),
                            const SizedBox(height: 3),
                            const Text(
                              "• Engelli personel kadrosunda istihdam edilmeye uygun olan(engellilik derecesi %40 ve üzeri olup, bunu belgelendirebilen",
                              style: TextStyle(
                                color: Color(0xFF707070),
                                fontSize: 14,
                                fontFamily: "MR",
                              ),
                            ),
                            const SizedBox(height: 3),
                            const Text(
                              "• İstanbul'da ikamet eden",
                              style: TextStyle(
                                color: Color(0xFF707070),
                                fontSize: 14,
                                fontFamily: "MR",
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Engellilik Durumu",
                              style: TextStyle(
                                color: Color(0xFF707070),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: "MBold",
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "• Ortopedik Engelli Birey (% 41-60)",
                              style: TextStyle(
                                color: Color(0xFF707070),
                                fontSize: 14,
                                fontFamily: "MR",
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Elemanlar arasında boşluk bırakır
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Yan Haklar",
                                      style: TextStyle(
                                        color: Color(0xFF707070),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "MBold",
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "• Yemek, SGK",
                                      style: TextStyle(
                                        color: Color(0xFF707070),
                                        fontSize: 14,
                                        fontFamily: "MR",
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Yaş Aralığı",
                                      style: TextStyle(
                                        color: Color(0xFF707070),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "MBold",
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "• 20 - 50",
                                      style: TextStyle(
                                        color: Color(0xFF707070),
                                        fontSize: 14,
                                        fontFamily: "MR",
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Öneri Açıklamaları",
                              style: TextStyle(
                                color: Color(0xFF707070),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: "MBold",
                              ),
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: List.generate(5, (index) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade100,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Text(
                                    'Engel Türü ',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "MR",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ),
                                );
                              }),
                            ),
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 55,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF5A6073),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'İlan Sayfasına Git',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "MBold",
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Image.asset(
                                      "assets/images/icon_git.png",
                                      height: 20,
                                      width: 20,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Sağa yaslanma
                              children: [
                                const Text(
                                  "Yorumlar",
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
                                    onPressed: () async {
                                      provider.commentButtonClick();
                                    },
                                    icon:const Icon(
                                      Icons.add,
                                      size: 16,
                                      color: Color(0xFF707070),
                                    ),
                                    label:const Text(
                                      "Yorum Ekle",
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
                            const SizedBox(height: 10),

                            provider.isCommentButtonClick? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const  Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "12/03/2024",
                                      style: const TextStyle(
                                        color: Color(0xFF707070),
                                        fontSize: 14,
                                        fontFamily: "NormalNunito",
                                      ),
                                    ),
                                    Text(
                                      "Muhammet İkbal Çakır",
                                      style: const TextStyle(
                                        color: Color(0xFF707070),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "NormalNunito",
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                        decoration: const InputDecoration(
                                          labelText: "Yorumu Girebilirsiniz...",
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
                                        cursorColor: const Color(0xFF707070),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    ElevatedButton(
                                      onPressed: () {
                                        print("Gönderildi");
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        backgroundColor: const Color(0xFF707070), // Buton rengi
                                      ),
                                      child: const Icon(Icons.send, color: Colors.white, size: 20),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),

                                const Divider(
                                  color: Color(0xFFEBEBEB),
                                  thickness: 1,
                                  height: 20,
                                ),
                              ],
                            )  : SizedBox(),

                            _buildComment(
                              "Kullanıcı 1",
                              "12/03/2023",
                              "Bu bir kullanıcı yorumudur. Bu yorum, örnek veri olarak gösterilmektedir.",
                              onReply: () {
                                print("Cevapla tıklandı");
                              },
                              onEdit: () {
                                print("Düzenle tıklandı");
                              },
                              onDelete: () {
                                print("Sil tıklandı");
                              },
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
    },
  );
}



Widget _buildComment(String userName, String date, String comment, {required VoidCallback onReply, required VoidCallback onEdit, required VoidCallback onDelete}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            date,
            style: const TextStyle(
              color: Color(0xFF707070),
              fontSize: 14,
              fontFamily: "NormalNunito",
            ),
          ),
          Text(
            userName,
            style: const TextStyle(
              color: Color(0xFF707070),
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: "NormalNunito",
            ),
          ),
        ],
      ),
      const SizedBox(height: 5),
      Text(
        comment,
        style: const TextStyle(
          color: Color(0xFF707070),
          fontSize: 16,
          fontFamily: "NormalNunito",
        ),
      ),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          TextButton(
            onPressed: onEdit,
            child: const Text(
              "Düzenle",
              style: TextStyle(color: Color(0xFF5A6073)),
            ),
          ),
          TextButton(
            onPressed: onDelete,
            child: const Text(
              "Sil",
              style: TextStyle(color: Color(0xFF5A6073)),
            ),
          ),
        ],
      ),
      const Divider(
        color: Color(0xFFEBEBEB),
        thickness: 1,
        height: 20,
      ),
    ],
  );
}


class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const FilterBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: 16,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Drag Indicator
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
                "Filtreleme",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Lokasyon Seçimi
              const Text(
                "Lokasyon",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Bir lokasyon seçin",
                ),
                items: [
                  DropdownMenuItem(value: "İstanbul", child: Text("İstanbul")),
                  DropdownMenuItem(value: "Ankara", child: Text("Ankara")),
                  DropdownMenuItem(value: "İzmir", child: Text("İzmir")),
                  DropdownMenuItem(value: "Diğer", child: Text("Diğer")),
                ],
                onChanged: (value) {
                  print("Lokasyon seçildi: $value");
                },
              ),
              const SizedBox(height: 20),

              // Çalışma Türü
              const Text(
                "Çalışma Türü",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Çalışma türü seçin",
                ),
                items: [
                  DropdownMenuItem(value: "Tam Zamanlı", child: Text("Tam Zamanlı")),
                  DropdownMenuItem(value: "Yarı Zamanlı", child: Text("Yarı Zamanlı")),
                  DropdownMenuItem(value: "Uzaktan", child: Text("Uzaktan")),
                  DropdownMenuItem(value: "Hybrid", child: Text("Hybrid")),
                ],
                onChanged: (value) {
                  print("Çalışma türü seçildi: $value");
                },
              ),
              const SizedBox(height: 20),

              // Tarih Filtresi
              const Text(
                "Tarih",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  RadioListTile(
                    title: const Text("Tüm Günler"),
                    value: "Tüm Günler",
                    groupValue: "Tüm Günler",
                    onChanged: (value) {
                      print("Tarih filtresi seçildi: $value");
                    },
                  ),
                  RadioListTile(
                    title: const Text("Son 1 Gün"),
                    value: "Son 1 Gün",
                    groupValue: "Son 1 Gün",
                    onChanged: (value) {
                      print("Tarih filtresi seçildi: $value");
                    },
                  ),
                  RadioListTile(
                    title: const Text("Son 4 Gün"),
                    value: "Son 4 Gün",
                    groupValue: "Son 4 Gün",
                    onChanged: (value) {
                      print("Tarih filtresi seçildi: $value");
                    },
                  ),
                  RadioListTile(
                    title: const Text("Son 1 Hafta"),
                    value: "Son 1 Hafta",
                    groupValue: "Son 1 Hafta",
                    onChanged: (value) {
                      print("Tarih filtresi seçildi: $value");
                    },
                  ),
                  RadioListTile(
                    title: const Text("Son 2 Hafta"),
                    value: "Son 2 Hafta",
                    groupValue: "Son 2 Hafta",
                    onChanged: (value) {
                      print("Tarih filtresi seçildi: $value");
                    },
                  ),
                  RadioListTile(
                    title: const Text("Son 1 Ay"),
                    value: "Son 1 Ay",
                    groupValue: "Son 1 Ay",
                    onChanged: (value) {
                      print("Tarih filtresi seçildi: $value");
                    },
                  ),
                ],
              ),

              // Filtreleme Butonu
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  print("Filtreler uygulandı");
                  Navigator.pop(context);
                },
                child: const Text("Filtreleri Uygula"),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

void _showFilter(BuildContext context, List<String> dateOptions, List<String> selectedDates) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      double maxHeight = MediaQuery.of(context).size.height * 0.75;
      return Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          constraints: BoxConstraints(
            maxHeight: maxHeight,
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
                  "Filtreleme Seçenekleri",
                  style: TextStyle(
                    color: Color(0xFF707070),
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    fontFamily: "MBold",
                  ),
                ),
                const SizedBox(height:20),

                const Text(
                  "İş Aradığın Yer",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: "MR",
                    color: Color(0xFF707070),
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Seçiniz',
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
                  items: [
                    DropdownMenuItem(value: "İstanbul", child: Text("İstanbul")),
                    DropdownMenuItem(value: "Ankara", child: Text("Ankara")),
                    DropdownMenuItem(value: "İzmir", child: Text("İzmir")),
                    DropdownMenuItem(value: "Diğer", child: Text("Diğer")),
                  ],
                  onChanged: (value) {
                    print("Lokasyon seçildi: $value");
                  },
                ),
                const SizedBox(height: 20),

                const Text(
                  "Çalışma Türü",
                  style: TextStyle(
                    color: Color(0xFF707070),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: "MR",
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Seçiniz',
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
                  items: [
                    DropdownMenuItem(value: "Tam Zamanlı", child: Text("Tam Zamanlı")),
                    DropdownMenuItem(value: "Yarı Zamanlı", child: Text("Yarı Zamanlı")),
                    DropdownMenuItem(value: "Uzaktan", child: Text("Uzaktan")),
                    DropdownMenuItem(value: "Hybrid", child: Text("Hybrid")),
                  ],
                  onChanged: (value) {
                    print("Çalışma türü seçildi: $value");
                  },
                ),
                const SizedBox(height: 20),

                const Text(
                  "Tarih",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF707070),
                      fontFamily: "MR"
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8.0, // Yatay boşluk
                  runSpacing: 8.0, // Dikey boşluk
                  children: dateOptions.map((date) {
                    final isSelected = selectedDates.contains(date);
                    return ChoiceChip(
                      label: Row(
                        mainAxisSize: MainAxisSize.min, // İçerik genişliğini küçült
                        children: [
                          Text(
                            date,
                            style: TextStyle(
                              color: isSelected ? Colors.white : const Color(0xFF707070),
                              fontFamily: "MR",
                            ),
                          ),
                          if (isSelected)
                            const Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                        ],
                      ),
                      selected: isSelected,
                      onSelected: (selected) {

                      },
                      selectedColor: const Color(0xFF5A6073),
                      backgroundColor: Colors.grey[200],
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Sıfırla',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: "MBold",
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 55,
                          decoration: BoxDecoration(
                            color: const Color(0xFF5A6073),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Uygula',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: "MBold",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      );
    },
  );
}