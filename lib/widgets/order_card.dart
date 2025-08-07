import 'package:chocobuy/constants/colors.dart';
import 'package:flutter/material.dart';

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
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: chocolate),
                        color: beigeWhite
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.all(13), 
                          child: Container(
                            height: 90,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)
                            ),
                          ),),
                          Padding(padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(quantity.toString() + "x", style: TextStyle(fontSize: 15, color: chocolate),),
                                  SizedBox(width: 10,),
                                  Text(orderName, style: TextStyle(color: chocolate, fontSize: 18, fontWeight: FontWeight.bold),)
                                ],
                              ),
                              TextButton(onPressed: (){}, 
                              child: Text("Details", style: TextStyle(color: chocolate, fontSize: 15, fontWeight: FontWeight.bold),))
                            ],
                          ),),
                          Padding(
                            padding: EdgeInsets.all(12),
                          child: Text(orderDate, style: TextStyle(color: chocolate),
                          ),)
                        ],
                      ),
                    );
  }

}