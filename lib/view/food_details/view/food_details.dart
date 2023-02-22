import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealdbapp/core/constants/themes/colors.dart';
import 'package:mealdbapp/utils/box_decoration.dart';
import 'package:mealdbapp/utils/text_styles.dart';
import 'package:mealdbapp/view/food_details/cubit/meal_fav_ex_cubit.dart';
import 'package:mealdbapp/view/widget/loading.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FoodDetailsScreen extends StatelessWidget {
  const FoodDetailsScreen({super.key, required this.foodId});

  final int foodId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: AppColors.red,
      ),
      body: SingleChildScrollView(
          child: BlocProvider(
        create: (context) => MealFavExCubit(foodId),
        child: BlocConsumer<MealFavExCubit, MealFavExState>(
          listener: (context, state) {},
          builder: (context, state) {
            var read = context.read<MealFavExCubit>();
            var watch = context.watch<MealFavExCubit>();
            return read.isThereAnyError != true
                ? buildColumn(read, context, watch)
                : const Loading();
          },
        ),
      )),
    );
  }

  Column buildColumn(
      MealFavExCubit cubit, BuildContext context, MealFavExCubit watch) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            SizedBox(
              height: 46.7.h,
              width: double.infinity,
            ),
            buildPositionedImage(cubit),
            buildPositionedFavoriButton(cubit, watch),
            buildPositionedReturnIconButton(context),
            buildPositionedTextName(cubit),
            buildPositionedCategoryRow(cubit),
          ],
        ),
        cubit.resFoodDetails?.meals?[0].strTags != null
            ? buildPositionedTag(cubit)
            : const Text(""),
        buildPaddingInstructions(cubit)
      ],
    );
  }

  Positioned buildPositionedReturnIconButton(BuildContext context) {
    return Positioned(
        child: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: CircleAvatar(
        backgroundColor: AppColors.white,
        child: Padding(
          padding: EdgeInsets.only(left: 2.w),
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.grey,
          ),
        ),
      ),
      iconSize: 3.5.h,
    ));
  }

  Padding buildPaddingInstructions(MealFavExCubit cubit) {
    return Padding(
      padding: EdgeInsets.only(left: 2.5.w, right: 2.5.w, bottom: 1.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "- Instructions:",
            style: Styles.largeBoldFontStyle(),
          ),
          FittedBox(
              child: Container(
                  width: 100.w,
                  margin: EdgeInsets.only(
                    top: .7.h,
                  ),
                  child: Text(
                    cubit.resFoodDetails?.meals![0].strInstructions != null
                        ? "${cubit.resFoodDetails?.meals![0].strInstructions}"
                        : "Theres no instructions",
                    style: Styles.mediumFontStyle(),
                  ))),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  cubit.urlLauncher(cubit.resFoodDetails?.meals?[0].strYoutube);
                },
                child: Container(
                  height: 6.h,
                  width: 65.w,
                  margin: EdgeInsets.symmetric(vertical: 1.7.h),
                  decoration: youtubeBoxDecoration(),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.smart_display_outlined,
                          size: 5.5.h,
                          color: AppColors.white,
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          "Watch the Tutorial Video",
                          style: Styles.normalWhiteBoldFontStyle(),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Padding buildPositionedTag(MealFavExCubit cubit) {
    return Padding(
      padding: EdgeInsets.only(left: 2.1.w, right: 2.5.w, bottom: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.tag, color: AppColors.black),
          Text(
            "Tags:",
            style: Styles.normalBoldFontStyle(),
            overflow: TextOverflow.ellipsis,
          ),
          Text("${cubit.resFoodDetails?.meals?[0].strTags}",
              style: Styles.normalBoldFontStyle()),
          SizedBox(
            width: 3.w,
          ),
        ],
      ),
    );
  }

  Positioned buildPositionedCategoryRow(MealFavExCubit cubit) {
    return Positioned(
      left: 2.w,
      top: 43.5.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.category, color: AppColors.black),
          Text(
            "Category:",
            style: Styles.normalBoldFontStyle(),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
              cubit.resFoodDetails?.meals?[0].strCategory != null
                  ? "${cubit.resFoodDetails?.meals?[0].strCategory}"
                  : "",
              style: Styles.normalBoldFontStyle()),
          SizedBox(
            width: 7.w,
          ),
          const Icon(Icons.location_on, color: AppColors.black),
          Text("Origin Country:", style: Styles.normalBoldFontStyle()),
          Text(
              cubit.resFoodDetails?.meals?[0].strArea != null
                  ? "${cubit.resFoodDetails?.meals?[0].strArea}"
                  : "",
              style: Styles.normalBoldFontStyle()),
        ],
      ),
    );
  }

  Positioned buildPositionedTextName(MealFavExCubit cubit) {
    return Positioned(
      left: 2.w,
      top: 40.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 80.w,
            child: Text(
              cubit.resFoodDetails!.meals![0].strMeal.toString(),
              style: Styles.largeBoldFontStyle(),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Positioned buildPositionedFavoriButton(
      MealFavExCubit cubit, MealFavExCubit watch) {
    return Positioned(
        left: 83.w,
        top: 36.5.h,
        child: FloatingActionButton(
          onPressed: () {
            cubit.favoriButtonClick(foodId, cubit.resFoodDetails!.meals?[0]);
          },
          backgroundColor: AppColors.red,
          child: Icon(watch.isFavButton == true
              ? Icons.favorite
              : Icons.favorite_border),
        ));
  }

  Positioned buildPositionedImage(MealFavExCubit cubit) {
    return Positioned(
      child: Image.network(
        cubit.resFoodDetails!.meals![0].strMealThumb != null
            ? "${cubit.resFoodDetails!.meals![0].strMealThumb}"
            : "https://artsmidnorthcoast.com/wp-content/uploads/2014/05/no-image-available-icon-6.png",
        fit: BoxFit.cover,
        height: 40.h,
        width: 100.w,
      ),
    );
  }
}
