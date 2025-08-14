import 'package:chocobuy/constants/colors.dart';
import 'package:chocobuy/screens/favorite_screen.dart';
import 'package:chocobuy/screens/your_order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chocobuy/screens/drink_menu.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeContent(),
    DrinkMenu(),
    YourOrder(),
    FavoriteScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Helper method to create SVG navigation items
  Widget _buildSvgIcon(String assetPath, int index) {
    return SvgPicture.asset(
      assetPath,
      height: 27.h,
      width: 27.w,
      colorFilter: ColorFilter.mode(
        _selectedIndex == index ? Colors.white : Colors.brown[300]!,
        BlendMode.srcIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8E3B6),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: textColor,
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.brown[300],
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: _buildSvgIcon("assets/icons/home.svg", 0),
            label: 'Home'),
          BottomNavigationBarItem(icon: _buildSvgIcon("assets/icons/drink_menu.svg", 1), 
          label: 'Drink Menu'),
          BottomNavigationBarItem(icon: _buildSvgIcon("assets/icons/order.svg", 2), 
          label: 'Your Order'),
          BottomNavigationBarItem(icon: _selectedIndex == 3? Icon(Icons.favorite_sharp) : Icon(Icons.favorite_border), label: 'Favorites')
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(30.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    "Hi, nice to see you again Mrs/Ms 🥰",
                    style: TextStyle(
                      color: Color(0xFF834D1E),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
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
            ),
            SizedBox(height: 20.h),
            // Best Seller Container
            Container(
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                color: Color(0xFF834D1E),
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Best seller of the week",
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          "Iced Coffee\nSweet Heaven",
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Row(
                          children: [
                            Text(
                              "More info",
                              style: TextStyle(color: Colors.white),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(CupertinoIcons.arrow_right, color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 122.h,
                    width: 81.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0.r),
                      image: DecorationImage(
                        image: AssetImage("assets/images/iced_coffee.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 40.h),
            // Recommendations Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "This week's recommendations",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF834D1E),
                  ),
                ),
                Text(
                  "see all",
                  style: TextStyle(color: Color(0xFF834D1E)),
                )
              ],
            ),
            SizedBox(height: 20.h),
            // Horizontal ListView with proper height
            Container(
              height: 200.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: CoffeeCard(
                      imagePath: "assets/images/iced_americano.png",
                      title: index == 0 ? "Iced Americano" : "Hot cappucino ${index + 1}",
                      price: "Rp ${20000 + (index * 5000)}",
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "What's in the shop ?",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF834D1E),
                  ),
                )
              ],
            ),
            SizedBox(height: 30.h,),
            Container(
              height: 321.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                image: DecorationImage(
                    image: AssetImage("assets/images/new.jpg"), fit: BoxFit.fitHeight),
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    gradient: LinearGradient(colors: [
                      Colors.yellowAccent.withOpacity(0.3),
                      Colors.greenAccent.withOpacity(0.4),
                      Colors.transparent.withOpacity(0.4),
                    ],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                      stops: [0.0, 0.5, 0.8],
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.all(40.r),
                      child:Text("Introducing\nour new lemonade\nmenu", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.sp, letterSpacing: -1),)
                      ,)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Reusable Coffee Card Widget
class CoffeeCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;

  const CoffeeCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280.h,
      width: 162.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Color(0xFF834D1E).withOpacity(1),
            ],
            stops:  [0.5.r, 1.0.r],
          ),
        ),
        padding:  EdgeInsets.all(16.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              price,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}