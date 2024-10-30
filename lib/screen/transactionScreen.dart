import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lenden/config/StorageService.dart';
import 'package:lenden/config/colors.dart';
import 'package:lenden/screen/homeScreen.dart';
import 'package:lenden/widget/bottom_navigation.dart';
import 'package:lenden/widget/sidemenu.dart';
import 'package:lenden/widget/transactions.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {

  final StorageService _storageService = StorageService();
  List<dynamic> transactions = [];
  bool menuOpen = false;

  void hideMenu() {
    setState(() {
      menuOpen = false;
    });
  }



  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextEditingController _controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        surfaceTintColor: MyColor.darkColor,
        backgroundColor: MyColor.darkColor,
      ),
      backgroundColor: MyColor.pageBg,
      body: Stack(
        children: [
          Column(
            children: [
              // TODO: Header
              Container(
                width: MediaQuery.of(context).size.width * 1.0,
                color: MyColor.darkColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ));
                            },
                            child: SvgPicture.asset(
                                'assets/icons/arrow_left.svg'
                            ),
                          ),
                          const Text(
                            'Transaction History',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                            ),
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
                      ),
                      const SizedBox(height: 16,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: size.width * 1.0 - 100,
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child:   TextFormField(
                              controller: _controller,
                              decoration: InputDecoration(
                                hintText: 'Search transaction here',
                                hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.3),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                                contentPadding: const EdgeInsets.all(17),
                                border: InputBorder.none,
                                prefixIcon: Container(
                                  padding: const EdgeInsets.all(10),
                                  child: SvgPicture.asset(
                                    'assets/icons/search_line.svg',
                                  ),
                                )
                              ),
                            ),
                          ),
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: SvgPicture.asset(
                                'assets/icons/filter_line.svg'
                              ),
                            )
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //TODO: Body
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // TODO: Transactions
                        Transactions(
                          title: 'All Transactions',
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          // TODO: Bottom Navigation
          const BottomNavigation(passIndex: 2,),
          Visibility(
            visible: menuOpen,
            child: SideMenu(voidCallback: hideMenu,),
          )
        ],
      ),
    );
  }
}
