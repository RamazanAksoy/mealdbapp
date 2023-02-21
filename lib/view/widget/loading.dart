import 'package:flutter/material.dart';
import 'package:mealdbapp/utils/text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          const CircularProgressIndicator(),
          SizedBox(height: 1.h,),
          Text("Loading...",style: Styles.largeBoldFontStyle(),)
        ],
      )));
  }
}
