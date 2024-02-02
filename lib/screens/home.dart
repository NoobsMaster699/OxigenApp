import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffee_app/screens/widgets/banner.dart';
import 'package:coffee_app/screens/widgets/bottom_navigation.dart';
import 'package:coffee_app/screens/widgets/carousel_image.dart';
import 'package:coffee_app/screens/widgets/dashboard_icons.dart';
import 'package:coffee_app/screens/widgets/kupon.dart';
import 'package:coffee_app/screens/widgets/mission_container.dart';
import 'package:coffee_app/utils/colors.dart';
import 'package:coffee_app/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activePageIndex = 0;
  int _selectedIndex = 0;
  BottomNavigationBarType _bottomNavType = BottomNavigationBarType.shifting;

static const List<Map<String, dynamic>> missions = [
    {
      'title': 'Misi 1',
      'endDate': '31/01/2024',
      'imagePath': 'https://picsum.photos/seed/500/600',
      'itemText': 'Free Mouse Logitech \nG502x ',
    },
    {
      'title': 'Misi 2',
      'endDate': '31/01/2024',
      'imagePath': 'https://picsum.photos/seed/501/600',
      'itemText': 'Free Keyboard \nMechanical X',
    },
    // Tambahkan data misi lainnya jika diperlukan
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSmoke,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 45),
                          child: CarouselSlider(
                            options: CarouselOptions(
                              height: 250,
                              viewportFraction: 1.0,
                              enlargeCenterPage: false,
                              autoPlayCurve: Curves.easeOutBack,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  activePageIndex = index;
                                });
                              },
                            ),
                            items: [
                              buildCarouselImage(ImageConstant.topDetailDecoration),
                              buildCarouselImage(ImageConstant.topHomeDecoration),
                              buildCarouselImage(ImageConstant.topDetailDecoration),
                              // Add more carousel items as needed
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 77,
                          right: 10,
                          child: AnimatedSmoothIndicator(
                            activeIndex: activePageIndex,
                            count: 4,
                            effect: WormEffect(
                              activeDotColor: Colors.blue,
                              dotColor: Colors.white,
                              dotHeight: 6.0,
                              dotWidth: 6.0,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: TextButton(
                            onPressed: () {
                              _showQRCodeDialog(context);
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(200),
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.qr_code, color: primaryColor),
                                const SizedBox(width: 11),
                                Text(
                                  "QR".toUpperCase(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Joss",
                                    fontSize: 17,
                                    color: scaffoldColorDark,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                       
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.300, // 22.5% of the screen height
                          left: 0,
                          right: 0,
                          child: CustomUserInfoWidget(
                            username: 'Sumbul',
                            voucherIconPath: 'assets/images/kupon.svg',
                            pointsIconPath: 'assets/images/points.svg',
                            voucherCount: '1',
                            pointsCount: '10',
                          ),
                        ),
                      ],
                      
                    ),
                  Positioned(
                left: 10,
                right: 10,
                bottom: 10,
                child: Container(
                  width: MediaQuery.of(context).size.width * 18,
                  height: 250,
                  decoration: BoxDecoration(
                    color: whiteSmoke,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(18),
                          bottomRight: Radius.circular(18),
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              DashboardItem(imageUrl: 'https://picsum.photos/seed/36/600',title: 'Pickup',
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        DashboardItem(imageUrl: 'https://latest.12tkj2gay.workers.dev/1:/Data/deliver.png',title: 'Delivery',
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 5, 2, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: 48,
                                            height: 48,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              'https://picsum.photos/seed/219/600',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 2, 0, 0),
                                            child: Text(
                                              'Free Coffe',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: "Joss",
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              'https://picsum.photos/seed/219/600',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 2, 0, 0),
                                            child: Text(
                                              'Free Coffe',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: "Joss",
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              'https://picsum.photos/seed/219/600',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 2, 0, 0),
                                            child: Text(
                                              'Mission',
                                              style: TextStyle(
                                                fontFamily: "Joss",
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              'https://picsum.photos/seed/124/600',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 2, 0, 0),
                                            child: Text(
                                              'Voucher Packs',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: "Joss",
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

                SizedBox(
                height: 150,
                child: Swiper(
                  itemCount: missions.length,
                  itemBuilder: (context, index) {
                    // Ambil data misi dari list
                    Map<String, dynamic> mission = missions[index];

                    return buildMissionContainer(
                      context,
                      mission['title'],
                      mission['endDate'],
                      mission['imagePath'],
                      mission['itemText'],
                      () {
                        print('Button pressed for ${mission['title']}...');
                      },
                    );
                  },
                ),
              ),
          SizedBox(
            height: 20,
          ),
          BannerCard()
              
                

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
            bottomNavigationBar: SimpleBottomNavigation(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff6200ee),
        unselectedItemColor: const Color(0xff757575),
        type: _bottomNavType,
        onTap: (index) {
          setState(() {
            _selectedIndex = 0;
          });
        },
      ),
      
    );
  }

  void _showQRCodeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("QR Code"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
