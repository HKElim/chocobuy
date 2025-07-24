import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class YourOrder extends StatefulWidget {
  const YourOrder({Key? key}) : super(key: key);

  @override
  _YourOrderState createState() => _YourOrderState();
}

class _YourOrderState extends State<YourOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8E3B6),
     appBar: AppBar(
      backgroundColor: Color(0xFFF8E3B6),
      leading: Text("Your Order", style: TextStyle(color: Colors.brown, fontSize: 18, fontWeight: FontWeight.bold),),
      actions: [
        IconButton(
          icon: Icon(CupertinoIcons.bell_solid, color: Colors.brown),
          onPressed: () {
            // Action for shopping cart
          },
        ),
         IconButton(
          icon: Icon(Icons.menu, color: Colors.brown),
          onPressed: () {
            // Action for shopping cart
          },
        ), 
      ],
     ),
     body: Padding(
      padding: EdgeInsets.all(13),
      child: Column(
        children: [
          DefaultTabController(length: 2, child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 0, bottom: 0) ,
                margin: EdgeInsets.only(right: 7),
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  color: Color(0xffFCF2D9),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Color(0xFF834D1E),
                  indicatorColor: Colors.brown,
                  indicatorPadding: EdgeInsets.only(top: 15, left: -15, right: -13, bottom: 15),
                  indicator: BoxDecoration(
                    color: Color(0xFF834D1E),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  tabs: [
                    Tab(child: FittedBox(child: Text("Recently", style: TextStyle(fontWeight: FontWeight.bold),),),),
                    Tab(child: FittedBox(child: Text("Past Orders", style: TextStyle(fontWeight: FontWeight.bold),),),),
                  ],
                ),
              ),
            ],
          ),),
        ],
     ),)
     );
  }
}