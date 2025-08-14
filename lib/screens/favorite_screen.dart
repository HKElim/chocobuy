import 'package:chocobuy/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});


  @override
  Widget build(BuildContext context) {
      final media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: beige,
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 20.w,),
      child: Column(
        children: [
          SafeArea(child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Your favorite drinks to\n lighten up your day", style: TextStyle(color: textColor, fontSize: 20.sp, fontWeight: FontWeight.w600),),
              Row(
                children: [

                    IconButton(
                      onPressed: () {},
                      icon: Icon(CupertinoIcons.bell_solid, color: Color(0xFF834D1E)),
                    ),
                    IconButton(
                      onPressed: () async {
                        final selected = await showMenu<String>(
                            context: context,
                            color: Color(0xFFF8E3B6),
                            shadowColor: Colors.black,
                            position: RelativeRect.fromLTRB(100.r, 100.r, 0.r, 0.r),
                            items: [
                              PopupMenuItem(child: Icon(CupertinoIcons.profile_circled, color: Color(0xFF834D1E), ), value: "Profile",),
                              PopupMenuItem(child: Icon(CupertinoIcons.settings, color: Color(0xFF834D1E),), value: "Settings",),
                              PopupMenuItem(child: Icon(Icons.help_outline_rounded, color: Color(0xFF834D1E),), value: "Helps",),
                              PopupMenuItem(child: Icon(Icons.logout, color: Color(0xFF834D1E),), value: "Logout",)

                            ]
                        );
                      },
                      icon: Icon(Icons.menu, color: Color(0xFF834D1E)),
                    ),
                ],
              )
            ],
          )),
          SizedBox(height: 30.h,),
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 250.h,
                      width: media.width / 2.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: chocolate,
                        image: DecorationImage(image: AssetImage("assets/images/iced_coffee.png"), fit: BoxFit.cover),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                            Colors.transparent,
                            textColor,
                          ])
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w,),
                    Container(
                      height: 250.h,
                      width: media.width / 2.4,
                      decoration: BoxDecoration(
                        color: chocolate
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),),
    );
  }
}