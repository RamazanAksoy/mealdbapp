// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealdbapp/core/constants/enums/reques.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/themes/colors.dart';
import '../../../product/utils/box_decoration.dart';
import '../../../product/utils/text_styles.dart';
import '../../../product/widget/error.dart';
import '../../../product/widget/loading.dart';
import '../cubit/favorite_cubit.dart';
import '../cubit/favorite_state.dart';
import '../cubit/food_details_api_cubit.dart';
import '../cubit/food_details_api_state.dart';

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
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => FoodDetailsCubit(foodId),
            ),
            BlocProvider(
              create: (context) => FavoriteCubit(foodId),
            ),
          ],
          child: BlocConsumer<FoodDetailsCubit, FoodDetailsState>(
            listener: (context, state) {},
            builder: (context, state) {
              return state.foodDetailsStatus == ApiRequest.requestInProgress
                  ? const Loading()
                  : state.foodDetailsStatus == ApiRequest.requestSuccess
                      ? buildColumn(state, context)
                      : buildEror(context);
            },
          ),
        ),
      ),
    );
  }

  SizedBox buildEror(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: Center(
        child: ErrorApi(
          onRety: () {
            context.read<FoodDetailsCubit>().loadFoodDetails(52772);
          },
        ),
      ),
    );
  }

  Column buildColumn(FoodDetailsState state, BuildContext context) {
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
            buildPositionedImage(state),
            BlocConsumer<FavoriteCubit, FavoriteState>(
                listener: (context, state) {},
                builder: (context, stateFavori) {
                  return buildPositionedFavoriButton(context, state, stateFavori);
                }),
            buildPositionedReturnIconButton(context),
            buildPositionedTextName(state),
            buildPositionedCategoryRow(state),
          ],
        ),
        state.foodDetails?.meals?[0].strTags != null ? buildPositionedTag(state) : const Text(""),
        buildPaddingInstructions(state, context)
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
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors.grey,
          ),
        ),
      ),
      iconSize: 3.5.h,
    ));
  }

  Padding buildPaddingInstructions(FoodDetailsState state, BuildContext context) {
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
                    "${state.foodDetails?.meals![0].strInstructions}",
                    style: Styles.mediumFontStyle(),
                  ))),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //buildYoutubeButton(context),
              GestureDetector(
                onTap: () {
                  context
                      .read<FoodDetailsCubit>()
                      .urlLauncher(state.foodDetails?.meals![0].strYoutube);
                  //context.read<FoodDetailsCubit>().urlLauncher();
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

  Padding buildPositionedTag(FoodDetailsState state) {
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
          Text("${state.foodDetails?.meals?[0].strTags}", style: Styles.normalBoldFontStyle()),
          SizedBox(
            width: 3.w,
          ),
        ],
      ),
    );
  }

  Positioned buildPositionedCategoryRow(FoodDetailsState state) {
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
              state.foodDetails?.meals?[0].strCategory != null
                  ? "${state.foodDetails?.meals?[0].strCategory}"
                  : "",
              style: Styles.normalBoldFontStyle()),
          SizedBox(
            width: 7.w,
          ),
          const Icon(Icons.location_on, color: AppColors.black),
          Text("Origin Country:", style: Styles.normalBoldFontStyle()),
          Text(
              state.foodDetails?.meals?[0].strArea != null
                  ? "${state.foodDetails?.meals?[0].strArea}"
                  : "",
              style: Styles.normalBoldFontStyle()),
        ],
      ),
    );
  }

  Positioned buildPositionedTextName(FoodDetailsState state) {
    return Positioned(
      left: 2.w,
      top: 40.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 80.w,
            child: Text(
              state.foodDetails!.meals![0].strMeal.toString(),
              style: Styles.largeBoldFontStyle(),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Positioned buildPositionedFavoriButton(
      BuildContext context, FoodDetailsState state, FavoriteState stateFavori) {
    return Positioned(
        left: 83.w,
        top: 36.5.h,
        child: FloatingActionButton(
          onPressed: () {
            context.read<FavoriteCubit>().favoriButtonClick(foodId, state.foodDetails!.meals?[0]);
          },
          backgroundColor: AppColors.red,
          child: Icon(stateFavori.isFavorite == true ? Icons.favorite : Icons.favorite_border),
        ));
  }

  Positioned buildPositionedImage(FoodDetailsState state) {
    return Positioned(
      //strMealThumb
      child: Image.network(
        //"https://media.istockphoto.com/foodId/1411326800/photo/broccoli-salad.jpg?s=612x612&w=0&k=20&c=EDc0RhOfS4aKw8KiOfoENTWFzJTR_sJ3ut2XZzxKOEY=",
        "${state.foodDetails!.meals![0].strMealThumb}",
        fit: BoxFit.cover,
        height: 40.h,
        width: 100.w,
      ),
    );
  }
}
