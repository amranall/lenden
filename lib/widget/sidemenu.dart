import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lenden/config/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatefulWidget {
  final VoidCallback voidCallback;
  const SideMenu({super.key, required this.voidCallback});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

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

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return
      // TODO: Side Menu
      Positioned(
        top: 0,
        left: 0,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
          child: Container(
            color: Colors.black.withOpacity(0.2),
            width: size.width * 1.0,
            height: size.height * 1.0,
            alignment: Alignment.topRight,
            child: Container(
              width: size.width * 0.6,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(16))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // TODO: Menu Header
                  Container(
                    padding: const EdgeInsets.only(left: 24, right: 24, top: 20, bottom: 16),
                    decoration: BoxDecoration(
                        color: MyColor.darkColor,
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(16))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: widget.voidCallback,
                          child: Container(
                            alignment: Alignment.topRight,
                            child: SvgPicture.asset(
                              'assets/icons/close_line.svg',
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Text(
                          'My Account',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        const SizedBox(height: 8,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/profile.png',
                                  height: 40,
                                  width: 40,
                                ),
                                const SizedBox(width: 8,),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Joni Nath',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    Text(
                                      '01851395120',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SvgPicture.asset(
                                'assets/icons/edit_square.svg'
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'General',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                                fontWeight: FontWeight.w500
                            ),
                          ),

                          Column(
                            children: generalMenu.asMap().entries.map((entry){
                              int index = entry.key;
                              return Column(
                                children: [
                                  const SizedBox(height: 16,),
                                  SizedBox(
                                    width: size.width * 1.0 - 100,
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/${generalMenu[entry.key]['icon']}.svg'
                                        ),
                                        const SizedBox(width: 8,),
                                        Text(
                                          generalMenu[entry.key]['title'],
                                          style: TextStyle(
                                              color: MyColor.textNormal,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 8),
                                    height: generalMenu.length-1 != index ? 0.5 : 0,
                                    width: size.width * 1.0 - 100,
                                    color: Colors.black.withOpacity(0.3),
                                  )
                                ],
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 16,),
                          const Text(
                            'More Information',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          Column(
                            children: moreMenu.asMap().entries.map((entry){
                              int index = entry.key;
                              return Column(
                                children: [
                                  const SizedBox(height: 16,),
                                  SizedBox(
                                    width: size.width * 1.0 - 100,
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/${moreMenu[entry.key]['icon']}.svg'
                                        ),
                                        const SizedBox(width: 8,),
                                        Text(
                                          moreMenu[entry.key]['title'],
                                          style: TextStyle(
                                              color: MyColor.textNormal,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 8,),
                                  Container(
                                    margin: const EdgeInsets.only(top: 8),
                                    height: moreMenu.length-1 != index ? 0.5 : 0,
                                    width: size.width * 1.0 - 100,
                                    color: Colors.black.withOpacity(0.3),
                                  )
                                ],
                              );
                            }).toList(),
                          ),
                        ],
                      )
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}
