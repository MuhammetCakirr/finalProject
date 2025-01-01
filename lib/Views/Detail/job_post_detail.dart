import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../Components/app_bar.dart';
import '../../Components/navigation_bar.dart';
import '../Home/home.dart';

class JobPostDetail extends StatefulWidget  {
  const JobPostDetail({super.key});

  @override
  State<JobPostDetail> createState() => _JobPostDetailState();
}

class _JobPostDetailState extends State<JobPostDetail> {
  int _currentIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFF5A6073),
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
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                                child:
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            ClipOval(
                                              child: Image.network(
                                                "https://media.licdn.com/dms/image/v2/C4D0BAQErSVTEjR_uFg/company-logo_100_100/company-logo_100_100/0/1678256491081/anadoluefes_logo?e=2147483647&v=beta&t=qZ_ZlxbTbwyu3y8k3SJDXoWIlF_AiqS1IgG9L9GeCjE",
                                                width: MediaQuery.of(context).size.width * 0.12,
                                                height: MediaQuery.of(context).size.width * 0.12, // Yükseklik eklenerek daire formu korunur
                                                fit: BoxFit.cover, // Görselin tam olarak sığmasını sağlar
                                              ),
                                            ),
                                            const SizedBox(width: 10,),
                                            const Text(
                                              "Anadolu Efes ",
                                              style: TextStyle(
                                                color: Color(0xFF707070),
                                                fontSize: 15,

                                                fontFamily: "MBold",
                                              ),
                                            ),

                                          ],
                                        ),
                                        const SizedBox(height: 10,),
                                        const Text(
                                          "Genel Başvuru (Engelli Kadro)",
                                          style: TextStyle(
                                            color: Color(0xFF707070),
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "MBold",
                                          ),
                                        ),
                                       const SizedBox(height: 10,),
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
                                        const SizedBox(height: 10,),
                                         Row(
                                          children: [
                                            Image.asset(
                                              'assets/images/canta5.png',
                                              width: 20,
                                              height: 20,
                                            ),
                                            SizedBox(width: 5,),
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
                                        const SizedBox(height: 10,),


                                        const Text(
                                          "Aranılan Özellikler",
                                          style: TextStyle(
                                            color: Color(0xFF707070),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "MBold",
                                          ),
                                        ),
                                        const SizedBox(height: 5,),
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
                                                const SizedBox(width: 10,),
                                                Image.asset(
                                                  "assets/images/icon_git.png",
                                                  height: 20,
                                                  width: 20,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
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
                                    return  Padding(
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
                                              color: Color(0xFFFFF1F0E8),
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
                                                  const  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        const Text(
                                                          'Genel Başvuru (Engelli)',
                                                          style: TextStyle(fontSize: 18, fontFamily: "MRIt",color: Color(0xFF707070)),
                                                        ),
                                                        const SizedBox(height: 4),
                                                        const Text(
                                                          'İstanbul, Türkiye ',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontFamily: "MR",
                                                            color: Color(0xFF707070) ,
                                                          ),
                                                          softWrap: true,
                                                        ),
                                                        const SizedBox(height: 4),
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
                                                              '2 Gün Önce',
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
                                                  Center(
                                                    child: Align(
                                                      alignment: Alignment.center,
                                                      child: Image.asset("assets/images/green_battery.png"), // Simgeyi alt satıra alıyoruz
                                                    ),
                                                  ),
                                                ],
                                              ),


                                            ],
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

    );;
  }
}
