import 'package:chocobuy/screens/your_order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chocobuy/screens/drink_menu.dart';

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
    Center(child: Text("Favorites")),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8E3B6),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF834D1E),
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.brown[300],
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.coffee_outlined), label: 'Drink Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt_rounded), label: 'Your Order'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Favorites')
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
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
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
                            position: RelativeRect.fromLTRB(100, 100, 0, 0),
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
            SizedBox(height: 20),
            // Best Seller Container
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF834D1E),
                borderRadius: BorderRadius.circular(30),
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
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Iced Coffee\nSweet Heaven",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30),
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
                    height: 122,
                    width: 81,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      image: DecorationImage(
                        image: AssetImage("assets/images/iced_coffee.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 40),
            // Recommendations Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "This week's recommendations",
                  style: TextStyle(
                    fontSize: 18,
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
            SizedBox(height: 20),
            // Horizontal ListView with proper height
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: CoffeeCard(
                      imagePath: "assets/images/iced_americano.png",
                      title: index == 0 ? "Iced Americano" : "Hot cappucino ${index + 1}",
                      price: "Rp ${20000 + (index * 5000)}",
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "What's in the shop ?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF834D1E),
                  ),
                )
              ],
            ),
            SizedBox(height: 30,),
            Container(
              height: 321,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                    image: AssetImage("assets/images/new.jpg"), fit: BoxFit.fitHeight),
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
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
                    Padding(padding: EdgeInsets.all(40),
                      child:Text("Introducing\nour new lemonade\nmenu", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: -1),)
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
      height: 280,
      width: 162,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Color(0xFF834D1E).withOpacity(1),
            ],
            stops: const [0.5, 1.0],
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8),
            Text(
              price,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}