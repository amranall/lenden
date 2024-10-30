import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lenden/screen/homeScreen.dart';
import 'package:lenden/screen/transactionScreen.dart';
import 'package:lenden/widget/scanner_page.dart';

class BottomNavigation extends StatefulWidget {
  final int passIndex;
  const BottomNavigation({super.key, this.passIndex = 1});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    setBottomBarIndex(widget.passIndex);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Positioned(
          bottom: 12,
          left: 0,
          child: SizedBox(
            width: size.width * 1.0,
            child: Center(
              child: GestureDetector(
                child: Container(
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(100)),
                  child: Image.asset(
                    'assets/icons/scan.png',
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: SizedBox(
            width: size.width,
            height: 60,
            child: Stack(
              children: [

                SizedBox(
                  width: size.width,
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setBottomBarIndex(1);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              currentIndex == 1
                                  ? 'assets/icons/home_fill.svg'
                                  : 'assets/icons/home_line.svg',
                              width: 24,
                              height: 24,
                            ),
                            Text(
                              'Home',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: currentIndex == 1
                                      ? Colors.black
                                      : Colors.black54),
                            )
                          ],
                        ),
                      ),
                      //===========//
                      Container(
                        width: size.width * 0.20,
                      ),
                      GestureDetector(
                        onTap: () {
                          setBottomBarIndex(3);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScannerPage(), // Navigate to ProfileScreen
                            ),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text(
                              '    Scanner',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: currentIndex == 3
                                      ? Colors.black
                                      : Colors.black),
                            )
                          ],
                        ),
                      ),
                      //=========//
                      Container(
                        width: size.width * 0.20,
                      ),
                      GestureDetector(
                        onTap: () {
                          setBottomBarIndex(2);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TransactionScreen(),
                            ),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              currentIndex == 2
                                  ? 'assets/icons/activity_fill.svg'
                                  : 'assets/icons/activity_line.svg',
                              width: 24,
                              height: 24,
                            ),
                            Text(
                              'Transactions',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: currentIndex == 2
                                      ? Colors.black
                                      : Colors.black54),
                            )
                          ],
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
    );
  }
}

