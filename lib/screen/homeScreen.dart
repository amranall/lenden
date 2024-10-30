import 'package:flutter/material.dart';
import 'package:lenden/config/StorageService.dart';
import 'package:lenden/config/colors.dart';
import 'package:lenden/widget/bottom_navigation.dart';
import 'package:lenden/widget/more_service.dart';
import 'package:lenden/widget/offers.dart';
import 'package:lenden/widget/service.dart';
import 'package:lenden/widget/sidemenu.dart';
import 'package:lenden/widget/slider.dart';
import 'package:lenden/widget/suggestions.dart';
import 'package:lenden/widget/transactions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final StorageService _storageService = StorageService();
  String _balance = '0';

  bool menuOpen = false;

  final List<dynamic> generalMenu = [
    {
      'title' : 'Account Type',
      'icon' : 'profile_line'
    },
    {
      'title' : 'Change PIN',
      'icon' : 'key-square'
    },
    {
      'title' : 'I Want Profit',
      'icon' : 'share'
    },
    {
      'title' : 'Trusted Merchants',
      'icon' : 'star'
    }
  ];

  final List<dynamic> moreMenu = [
    {
      'title' : 'Privacy Policy',
      'icon' : 'shield-tick'
    },
    {
      'title' : 'FAQ',
      'icon' : 'task-square'
    },
    {
      'title' : 'Store Locator',
      'icon' : 'location'
    },
    {
      'title' : 'Settings',
      'icon' : 'setting-2'
    },
    {
      'title' : 'Support',
      'icon' : '24-support'
    },
    {
      'title' : 'Log Out',
      'icon' : 'logout'
    }
  ];

  void hideMenu() {
    setState(() {
      menuOpen = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getBalance();
  }

  void _getBalance() async {
    String? data = await _storageService.getData('balance');

    setState(() {
      _balance = data ?? '0';
      if(double.parse(_balance) < 10){
        _adjustBalance('5000');
      }
    });
  }

  void _adjustBalance(String amount) async {
    await _storageService.saveData('balance', amount);
    _getBalance();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        surfaceTintColor: MyColor.darkColor,
        backgroundColor: MyColor.darkColor,
      ),
      backgroundColor: MyColor.pageBg,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(bottom: 100),
              width: MediaQuery.of(context).size.width * 1.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/header_bg.png'),
                  fit: BoxFit.contain,
                  alignment: Alignment.topCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/profile.png',
                              height: 48,
                              width: 48,
                            ),
                            const SizedBox(width: 8,),
                            const Text(
                              'Joni Nath',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/icons/notification_icon.png',
                              height: 24,
                              width: 24,
                            ),
                            const SizedBox(width: 16,),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  menuOpen = true;
                                });
                              },
                              child: Image.asset(
                                'assets/icons/menu_icon.png',
                                height: 24,
                                width: 24,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 16,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Balance',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                '৳ $_balance',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8,),
                            GestureDetector(
                              child: Container(
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)
                                ),
                                child: Image.asset(
                                  'assets/icons/eye_slash.png',
                                  height: 48,
                                  width: 48,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 16,),
                    // TODO: Service Card
                    const Service(),
                    const SizedBox(height: 16,),
                    // TODO: Slider
                    const Sliders(),
                    const SizedBox(height: 16,),
                    // TODO: Suggestions
                    const Suggestions(),
                    const SizedBox(height: 16,),
                    // TODO: Offers
                    const Offers(),
                    const SizedBox(height: 16,),
                    // TODO: More Services
                    const MoreService(),
                    const SizedBox(height: 16,),
                    // TODO: Transactions
                    Transactions(),
                  ],
                ),
              ),
            ),
          ),
          // TODO: Bottom Navigation
          const BottomNavigation(passIndex: 1,),
          Visibility(
            visible: menuOpen,
            child: SideMenu(voidCallback: hideMenu,),
          )
        ],
      ),
    );
  }
}
