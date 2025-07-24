import 'package:chocobuy/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:chocobuy/widgets/input_field.dart';
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
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('./assets/images/background.jpg'), fit: BoxFit.cover, colorFilter: ColorFilter.mode(
                  Colors.brown.withOpacity(0.3), // adjust opacity and color
                  BlendMode.darken, // can also use overlay, multiply, etc.
                ),),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100), bottomRight: Radius.circular(100),)
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Co / Choc',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'A way to enjoy bitter and sweet of life',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xFFFCF2D9).withOpacity(0.9),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Color(0xFF834D1E), width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
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
                                          border: Border.all(color: Colors.brown, width: 2,),
                                          borderRadius: BorderRadius.circular(24)
                                      )
                                      ,
                                      child: TabBar(
                                        labelColor: Colors.white,
                                        unselectedLabelColor: Color(0xFF834D1E),
                                        indicator: BoxDecoration(
                                            color: Color(0xFF834D1E),
                                            border: Border.all(color: Color(0xFF834D1E)),
                                            borderRadius: BorderRadius.all(Radius.circular(24))
                                        ),
                                        indicatorPadding: EdgeInsets.only(top: -2, bottom: -2, left: -60, right: -60),
                                        tabs: [
                                          Tab(text: 'Login',
                                          ),
                                          Tab(text: 'Sign Up',)
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 30,),
                                    SizedBox(height: 350,
                                      child: TabBarView(children: [
                                        //1st Tab view (login)
                                        Column(
                                          children: [
                                            InputField(label: 'Username' ),
                                            SizedBox(height: 12,),
                                            PassWordField(label: 'Password'),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: TextButton(onPressed: () {},
                                                child: Text("Forgot password ?"),
                                              ),
                                            ),
                                            SizedBox(height: 40,),
                                            ElevatedButton(onPressed: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
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
                                            SizedBox(height: 12,),
                                            PassWordField(label: 'Password'),
                                            SizedBox(height: 12,),
                                            PassWordField(label: 'Confirm password'),
                                            SizedBox(height: 40,),
                                            ElevatedButton(onPressed: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
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
          SizedBox(height: 40,),
          Positioned(
            bottom: -80,
            left: -45,
            child: Image.asset(
              'assets/images/coffee.png',
              height: 300,
            ),
          ),
          Positioned(
            bottom: -80,
            right: 0,
            child: Image.asset(
              'assets/images/chocolate.png',
              height: 300,
            ),
          ),
        ],

      ),
    );
  }
}
