import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealdbapp/view/food_details/cubit/food_details_cubit.dart';
import 'package:mealdbapp/view/food_details/cubit/food_details_state.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/themes/colors.dart';
import '../../../utils/text_styles.dart';

class FoodDetailsScreen extends StatelessWidget {
  const FoodDetailsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: AppColors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildStack(),
            buildInstructors(),
            
          ],
        ),
      ),
    );
  }
}

class buildInstructors extends StatelessWidget {
  const buildInstructors({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 2.5.w,right: 2.5.w,bottom: 1.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "- Instructors",
            style: Styles.largeBoldFontStyle(),
          ),
      FittedBox(
          child: Container(
              height: 45.h,
              width: 100.w,
              margin: EdgeInsets.only(top: 1.h,),
              child: Text(
                "Descsssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss",
                style: Styles.normalFontStyle(),
              ))),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () {},
              child: Icon(Icons.smart_display_outlined, size: 5.5.h,color: AppColors.red,)),
        ],
      )
        ],
      ),
    );
  }
}

class buildStack extends StatelessWidget {
  const buildStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FoodDetailsCubit>(
      create: (context) => FoodDetailsCubit(),
      child: BlocConsumer<FoodDetailsCubit, FoodDetailsState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return Stack(
      children: [
        SizedBox(
          height: 44.h,
          width: double.infinity,
        ),
        Positioned(
          child: Image.network(
            "https://static.onecms.io/wp-content/uploads/sites/44/2021/08/03/jamaican-escovitch-fish.jpg",
            fit: BoxFit.cover,
            height: 40.h,
            width: 100.w,
          ),
        ),
        Positioned(
            left: 80.w,
            top: 36.5.h,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: AppColors.red,
              child: const Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
            )),
        Positioned(
          left: 15.w,
          top: 30.h,
          child: Text(
            "Estovich",
            style: Styles.largeWhiteFontStyle(),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Positioned(
          left: 2.w,
          top: 40.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.category, color: AppColors.black),
              Text(
                "Category:",
                style: Styles.normalBoldFontStyle(),
                overflow: TextOverflow.ellipsis,
              ),
              Text("Seafood", style: Styles.normalBoldFontStyle()),
              SizedBox(
                width: 10.w,
              ),
              const Icon(Icons.location_on, color: AppColors.black),
              Text("Area:", style: Styles.normalBoldFontStyle()),
              Text("Jamaican", style: Styles.normalBoldFontStyle()),
            ],
          ),
        ),
      ],
    );
        },
      ),
    )
    ;
    
    
  }
}
