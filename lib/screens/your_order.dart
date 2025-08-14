import 'package:chocobuy/constants/colors.dart';
import 'package:chocobuy/widgets/order_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class YourOrder extends StatefulWidget {


  @override
  _YourOrderState createState() => _YourOrderState();


  List <OrderCard> _pastOrder = [
    OrderCard(orderName: "Iced Strawberry", image: "assets/images/iced_stawberry.jpg", quantity: 6, orderDate: "01/08"),
    OrderCard(orderName: "Hot cappucino", image: "assets/images/hot_cappucino.jpg", quantity: 1, orderDate: "05/08"),
    OrderCard(orderName: "Hot chocolate", image: "assets/images/hot_chocolate.png", quantity: 4, orderDate: "08/12"),
    OrderCard(orderName: "Iced americano", image: "assets/images/iced_americano copy.png", quantity: 1, orderDate: "05/06"),
    OrderCard(orderName: "Iced orange", image: "assets/images/iced_orange_lemonade.png", quantity: 6, orderDate: "26/08"),
  ];

  List <OrderCard> _recentOrder = [
    OrderCard(orderName: "Iced YingYang", image: "assets/images/iced_yingyang.jpg", quantity: 3, orderDate: "31/06"),
    OrderCard(orderName: "Iced coffee", image: "assets/images/iced_coffee copy.png", quantity: 2, orderDate: "27/06"),
    OrderCard(orderName: "Iced americano", image: "assets/images/iced_americano.png", quantity: 1, orderDate: "24/07"),
    OrderCard(orderName: "Iced chocolate", image: "assets/images/iced_chocolate.jpg", quantity: 9, orderDate: "29/07"),
    OrderCard(orderName: "Green tea", image: "assets/images/green_tea.jpg", quantity: 5, orderDate: "31/06")
  ];
}

class _YourOrderState extends State<YourOrder> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: beige,
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        children: [
          SafeArea(child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Your orders", style: TextStyle(color: textColor, fontSize: 20.sp, fontWeight: FontWeight.w500),),
              Row(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.notifications, color: textColor, size: 30.r,)),
                  IconButton(onPressed: () async {
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
                      }, icon: Icon(Icons.menu, color: textColor, size: 30.r,)),
                ],
              )
            ],
          )),
          SizedBox(height: 10.h,),
          DefaultTabController(
            length: 2, 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 33.h, width: 230.w, 
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r)
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: beigeWhite
                  ),
                  child: TabBar(
                  indicatorColor: textColor,
                  unselectedLabelColor: textColor,
                  labelColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: textColor,
                    borderRadius: BorderRadius.circular(15.r)
                  ),
                  tabs: [
                  Tab(child: Text("Recently"),),
                  Tab(child: Text("Past Orders"),)

                ]),
                )
              ),),
               SizedBox(height: 20.h,),
               SizedBox(
                height: 640.h,
                child: TabBarView(
                  children: [

                    // recently TABview
                  SizedBox(
                    height: 400.h,
                    child: ListView.builder(
                      itemCount : widget._recentOrder.length,
                      itemBuilder: (context, int index){
                        _currentIndex = index;
                        return Container(
                          child: widget._recentOrder[_currentIndex],
                          margin: EdgeInsets.only(bottom: 20.h),

                        );
                          })),
                          
                    // Past Order TABview      
                  SizedBox(
                    height: 400.h,
                    child: ListView.builder(
                      itemCount : widget._pastOrder.length,
                      itemBuilder: (context, int index){
                        _currentIndex = index;
                        return Container(
                          child: widget._pastOrder[_currentIndex],
                          margin: EdgeInsets.only(bottom: 20.h),
                        );
                          })),
                ]),
               )
            ],
          ))
        ],
      ),
      ),
    );
  }
}