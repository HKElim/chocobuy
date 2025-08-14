import 'package:chocobuy/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:chocobuy/widgets/input_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration( color: Color(0xFFE8C88B), //custom color for the box background (biege in this case)
              /*gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFF5E8C7), Color(0xFFF0E0B0)], // Light beige gradient
              ),*/
            ),
          ),
          Container(
            height: 300.h,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('./assets/images/background.jpg'), fit: BoxFit.cover, colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), // adjust opacity and color
                  BlendMode.darken, // can also use overlay, multiply, etc.
                ),),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100.r), bottomRight: Radius.circular(100.r),)
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(40.0.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Co / Choc',
                    style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'A way to enjoy bitter and sweet of life',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Container(
                    padding: EdgeInsets.all(20.r),
                    decoration: BoxDecoration(
                      color: Color(0xFFFCF2D9).withOpacity(0.9),
                      borderRadius: BorderRadius.circular(30.r),
                      border: Border.all(color: Color(0xFF834D1E), width: 2.w),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10.r,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Center(

                        child: Column(
                          children: [
                            DefaultTabController(length: 2,
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.brown, width: 2.w,),
                                          borderRadius: BorderRadius.circular(24.r)
                                      )
                                      ,
                                      child: TabBar(
                                        labelColor: Colors.white,
                                        unselectedLabelColor: Color(0xFF834D1E),
                                        indicator: BoxDecoration(
                                            color: Color(0xFF834D1E),
                                            border: Border.all(color: Color(0xFF834D1E)),
                                            borderRadius: BorderRadius.all(Radius.circular(24.r))
                                        ),
                                        indicatorPadding: EdgeInsets.only(top: -2.h, bottom: -2.h, left: -60.w, right: -60.w),
                                        tabs: [
                                          Tab(text: 'Login',
                                          ),
                                          Tab(text: 'Sign Up',)
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 30.h,),
                                    SizedBox(height: 350.h,
                                      child: TabBarView(children: [
                                        //1st Tab view (login)
                                        Column(
                                          children: [
                                            InputField(label: 'Username' ),
                                            SizedBox(height: 12.h,),
                                            PassWordField(label: 'Password'),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: TextButton(onPressed: () {},
                                                child: Text("Forgot password ?"),
                                              ),
                                            ),
                                            SizedBox(height: 40.h,),
                                            ElevatedButton(onPressed: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context) =>HomeScreen()));
                                            },
                                                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF834D1E)),
                                                child: Center(
                                                  child:
                                                  Text('Login', style:
                                                  TextStyle(color: Colors.white),
                                                  )
                                                  ,))

                                          ],
                                        ),
                                        //2nd Tab view (sign in)
                                        Column(
                                          children: [
                                            InputField(label: 'Email'),
                                            SizedBox(height: 12.h,),
                                            PassWordField(label: 'Password'),
                                            SizedBox(height: 12.h,),
                                            PassWordField(label: 'Confirm password'),
                                            SizedBox(height: 40.h,),
                                            ElevatedButton(onPressed: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context) =>HomeScreen()));
                                            },
                                                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF834D1E)),
                                                child: Center(child: Text('Sign Up', style: TextStyle(color: Colors.white),),))

                                          ],

                                        ),
                                      ]),),
                                  ],
                                )
                            ),
                          ],
                        )
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 40.h,),
          Positioned(
            bottom: -80.h,
            left: -45.w,
            child: Image.asset(
              'assets/images/coffee.png',
              height: 300.h,
            ),
          ),
          Positioned(
            bottom: -80.h,
            right: 0.w,
            child: Image.asset(
              'assets/images/chocolate.png',
              height: 300.h,
            ),
          ),
        ],

      ),
    );
  }
}
