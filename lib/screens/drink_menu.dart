import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chocobuy/widgets/input_field.dart';


class DrinkMenu extends StatefulWidget {
  @override
  _DrinkMenuState createState() => _DrinkMenuState();
}

class _DrinkMenuState extends State<DrinkMenu> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8E3B6),
      body: Padding(
        padding: EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 50),
        child: Column(
          children: [
            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    "What would you\nlike to drink today?",
                    style: TextStyle(
                      fontSize: 18,
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
                            PopupMenuItem(
                              child: Icon(CupertinoIcons.profile_circled, color: Color(0xFF834D1E)),
                              value: "Profile",
                            ),
                            PopupMenuItem(
                              child: Icon(CupertinoIcons.settings, color: Color(0xFF834D1E)),
                              value: "Settings",
                            ),
                            PopupMenuItem(
                              child: Icon(Icons.help_outline_rounded, color: Color(0xFF834D1E)),
                              value: "Helps",
                            ),
                            PopupMenuItem(
                              child: Icon(Icons.logout, color: Color(0xFF834D1E)),
                              value: "Logout",
                            )
                          ],
                        );
                      },
                      icon: Icon(Icons.menu, color: Color(0xFF834D1E)),
                    ),
                  ],
                )
              ],
            ),

            SizedBox(height: 20),

            // Search Field
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.brown),
                color: Color(0xFFFCF2D9),
                borderRadius: BorderRadius.circular(23),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(23),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Tab Controller
            Expanded(
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.brown, width: 2),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: TabBar(
                        labelColor: Colors.white,
                        unselectedLabelColor: Color(0xFF834D1E),
                        indicatorPadding: EdgeInsets.only(top: -0.4, left: -39, right: -40, bottom: -2),
                        indicator: BoxDecoration(
                          color: Color(0xFF834D1E),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        tabs: [
                          Tab(child: Text("Coffee", style: TextStyle(fontWeight: FontWeight.bold))),
                          Tab(child: Text("Chocolate", style: TextStyle(fontWeight: FontWeight.bold))),
                          Tab(child: Text("Others", style: TextStyle(fontWeight: FontWeight.bold))),
                        ],
                      ),
                    ),

                    SizedBox(height: 10),

                    // Tab Content
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFCF2D9),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: TabBarView(
                          children: [
                            // Coffee Tab
                            SingleChildScrollView(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  DrinkCard(
                                    title: "Iced Americano",
                                    desc: "Double espresso and water,\nserved cold",
                                    price: "20000",
                                    image: "assets/images/iced_americano.png",
                                  ),
                                  SizedBox(height: 16),
                                  DrinkCard(
                                    title: "Iced Coffee\nSweet Heaven",
                                    desc: "Double espresso with\ncondensed milk, served cold",
                                    price: "25000",
                                    image: "assets/images/iced_coffee.png",
                                  ),
                                  SizedBox(height: 16,),
                                  DrinkCard(
                                    title: "Hot Capuccino",
                                    desc: "Double espresso with\ncondensed milk, served hot",
                                    price: "25000",
                                    image: "assets/images/hot_cappucino.jpg",
                                  ),
                                  SizedBox(height: 16,),
                                  DrinkCard(
                                    title: "Iced Cappucino",
                                    desc: "Double espresso with\ncondensed milk, served cold",
                                    price: "25000",
                                    image: "assets/images/iced_cappucino.png",
                                  ),
                                ],
                              ),
                            ),

                            // Chocolate Tab
                            SingleChildScrollView(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  DrinkCard(
                                    title: "Hot Chocolate",
                                    desc: "Sweetened dark chocolate\nserved hot",
                                    price: "20000",
                                    image: "assets/images/hot_chocolate.png",
                                  ),
                                  SizedBox(height: 16,),
                                  DrinkCard(
                                    title: "Iced Chocolate",
                                    desc: "Sweetened dark chocolate,\nserved cold with whipped\ncream and stick wafer",
                                    price: "22000",
                                    image: "assets/images/iced_chocolate.jpg",
                                  ),
                                  SizedBox(height: 16,),
                                  DrinkCard(
                                    title: "Iced Yin & Yang",
                                    desc: "Dark chocolate and\nevaporated milk, served cold",
                                    price: "23000",
                                    image: "assets/images/iced_yingyang.jpg",
                                  ),
                                ],
                              ),
                            ),

                            // Others Tab
                            SingleChildScrollView(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  DrinkCard(
                                    title: "Green Tea",
                                    desc: "Fresh brewed green tea\nwith natural flavor",
                                    price: "15000",
                                    image: "assets/images/green_tea.jpg",
                                  ),
                                  SizedBox(height: 16,),
                                  DrinkCard(
                                    title: "Iced Americano",
                                    desc: "Double espresso and water,\nserved cold",
                                    price: "18000",
                                    image: "assets/images/iced_lemonade.jpg",
                                  ),
                                  SizedBox(height: 16,),
                                  DrinkCard(
                                    title: "Iced Strawberry\nLemonade",
                                    desc: "Iced lemonade with fresh\nstrawberry juice, served cold",
                                    price: "18500",
                                    image: "assets/images/iced_stawberry.jpg",
                                  ),
                                  SizedBox(height: 16,),
                                  DrinkCard(
                                    title: "Iced Orange\nLemonade",
                                    desc: "Iced lemonade with fresh\norange juice, served cold",
                                    price: "18500",
                                    image: "assets/images/iced_orange_lemonade.png",
                                  )
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
          ],
        ),
      ),
    );
  }
}
