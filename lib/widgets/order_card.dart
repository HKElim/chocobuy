import 'package:chocobuy/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderCard extends StatelessWidget {

  final orderName;
  final String image;
  final int quantity;
  final String orderDate;

  const OrderCard({
    Key? key,
    required this.orderName,
    required this.image,
    required this.quantity,
    required this.orderDate,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                      height: 120.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: textColor),
                        color: beigeWhite
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.all(13.r), 
                          child: Container(
                            height: 90.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)
                            ),
                          ),),
                          Padding(padding: EdgeInsets.all(15.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(quantity.toString() + "x", style: TextStyle(fontSize: 15.sp, color: textColor),),
                                  SizedBox(width: 10.w,),
                                  Text(orderName, style: TextStyle(color: textColor, fontSize: 18.sp, fontWeight: FontWeight.bold),)
                                ],
                              ),
                              TextButton(onPressed: (){}, 
                              child: Text("Details", style: TextStyle(color: textColor, fontSize: 15.sp, fontWeight: FontWeight.bold),))
                            ],
                          ),),
                          Padding(
                            padding: EdgeInsets.all(12.r),
                          child: Text(orderDate, style: TextStyle(color: chocolate),
                          ),)
                        ],
                      ),
                    );
  }

}