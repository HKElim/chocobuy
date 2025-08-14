import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputField extends StatelessWidget {
  const InputField({super.key, required this.label, });
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: null,
        fillColor: Color(0xFFFCF2D9),
        filled: false,
        hintText: label,
        contentPadding: EdgeInsets.only(left: 20.w),
      ),
    );
  }
}


class PassWordField extends StatelessWidget {
  const PassWordField({super.key, required this.label, });
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        suffixIcon: Icon(CupertinoIcons.eye_slash_fill),
        border: null,
        fillColor: Color(0xFFFCF2D9),
        filled: false,
        hintText: label,
        contentPadding: EdgeInsets.only(left: 20.w),
      ),
    );
  }
}

class DrinkCard extends StatelessWidget {
  final String title;
  final String desc;
  final String price;
  final String image;


  const DrinkCard ({required this.title, required this.desc, required this.price, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 130.h,
            width: 81.w,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(13.r)
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),),
              SizedBox(height: 10.h,),
              Text(desc, style: TextStyle(letterSpacing: -0.5, color: Colors.brown),),
              SizedBox(height: 10.h,),
              Text("Rp " + price, style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),),
            ],
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.add_box_rounded, color: Colors.brown, size: 36.r,))
        ],
      ),
    );
  }

}
