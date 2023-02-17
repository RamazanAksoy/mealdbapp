// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealdbapp/core/constants/enums/reques.dart';
import 'package:mealdbapp/utils/box_decoration.dart';
import 'package:mealdbapp/view/food_details/cubit/food_details_cubit.dart';
import 'package:mealdbapp/view/food_details/cubit/food_details_state.dart';
import 'package:mealdbapp/view/widget/error.dart';
import 'package:mealdbapp/view/widget/loading.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/themes/colors.dart';
import '../../../core/init/cache/locale_manager.dart';
import '../../../utils/text_styles.dart';
import '../../home/model/random-food/meals.dart';

class FoodDetailsScreen extends StatefulWidget {
  FoodDetailsScreen({super.key});

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  LocaleManager localeManager = LocaleManager.instance;

  int id = 52772;
  bool isFavorite = false;

  List<Meals>? mealsListShared = [Meals()];
  @override
  void initState() {
    if (localeManager.getStringValue('fav') != '' &&
        localeManager.getStringValue('fav') != null) {
      List<dynamic> res = jsonDecode(localeManager.getStringValue('fav'));
      mealsListShared = res
          .map(
            (e) => Meals.fromJson(e),
          )
          .toList();
    }

    super.initState();
  }

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
          create: (context) => FoodDetailsCubit(),
          child: BlocConsumer<FoodDetailsCubit, FoodDetailsState>(
            listener: (context, state) {},
            builder: (context, state) {
              return state.foodDetailsStatus == ApiRequest.requestInProgress
                  ? const Loading()
                  : state.foodDetailsStatus == ApiRequest.requestSuccess
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                  height: 46.7.h,
                                  width: double.infinity,
                                ),
                                Positioned(
                                  //strMealThumb
                                  child: Image.network(
                                    //"https://media.istockphoto.com/id/1411326800/photo/broccoli-salad.jpg?s=612x612&w=0&k=20&c=EDc0RhOfS4aKw8KiOfoENTWFzJTR_sJ3ut2XZzxKOEY=",
                                    "${state.foodDetails!.meals![0].strMealThumb}",
                                    fit: BoxFit.cover,
                                    height: 40.h,
                                    width: 100.w,
                                  ),
                                ),
                                Positioned(
                                    left: 80.w,
                                    top: 36.5.h,
                                    child: FloatingActionButton(
                                      onPressed: () {
                                        for (var i = 0;
                                            i < mealsListShared!.length;
                                            i++) {
                                          if (int.parse(
                                                  mealsListShared?[i].idMeal ??
                                                      '0') ==
                                              id) {
                                            isFavorite = true;
                                            break;
                                          } else {
                                            isFavorite = false;
                                          }
                                        }

                                        if (isFavorite) {
                                          mealsListShared?.removeLast();

                                          localeManager.setStringValue('fav',
                                              jsonEncode(mealsListShared));

                                          
                                          setState(() {
                                            isFavorite = false;
                                          });
                                        } else {
                                          mealsListShared?.add(
                                              state.foodDetails!.meals![0]);
                                          localeManager.setStringValue('fav',
                                              jsonEncode(mealsListShared));
                                          setState(() {
                                            isFavorite = true;
                                          });
                                        }

                                        //sharedpreferences sadece string değer tutabiliyor. burada shared in map yapısını string bir değere atamayı yaptık. 'fav' key value'suna encode ettik.                                        //print(localeManager.getStringValue('fav'));

                                        //id meals' çağırıldı.
                                      },
                                      child: Icon(isFavorite == true
                                          ? Icons.favorite
                                          : Icons.favorite_border),
                                      backgroundColor: AppColors.red,
                                    )),
                                Positioned(
                                  left: 2.w,
                                  top: 40.h,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.foodDetails!.meals![0].strMeal
                                            .toString(),
                                        style: Styles.largeBoldFontStyle(),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  left: 2.w,
                                  top: 43.5.h,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(Icons.category,
                                          color: AppColors.black),
                                      Text(
                                        "Category:",
                                        style: Styles.normalBoldFontStyle(),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                          "${state.foodDetails?.meals?[0].strCategory}",
                                          style: Styles.normalBoldFontStyle()),
                                      SizedBox(
                                        width: 7.w,
                                      ),
                                      const Icon(Icons.location_on,
                                          color: AppColors.black),
                                      Text("Origin Country:",
                                          style: Styles.normalBoldFontStyle()),
                                      Text(
                                          "${state.foodDetails?.meals?[0].strArea}",
                                          style: Styles.normalBoldFontStyle()),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 2.1.w, right: 2.5.w, bottom: 1.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(Icons.tag, color: AppColors.black),
                                  Text(
                                    "Tags:",
                                    style: Styles.normalBoldFontStyle(),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                      "${state.foodDetails?.meals?[0].strTags}",
                                      style: Styles.normalBoldFontStyle()),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 2.5.w, right: 2.5.w, bottom: 1.h),
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
                                          height: 43.h,
                                          width: 100.w,
                                          margin: EdgeInsets.only(
                                            top: .7.h,
                                          ),
                                          child: Text(
                                            "${state.foodDetails?.meals![0].strInstructions}",
                                            style: Styles.normalFontStyle(),
                                          ))),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          context
                                              .read<FoodDetailsCubit>()
                                              .urlLauncher(Uri());
                                        },
                                        child: Container(
                                          height: 6.h,
                                          width: 65.w,
                                          margin: EdgeInsets.only(right: 2.w),
                                          decoration: youtubeBoxDecoration(),
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
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
                                                  style: Styles
                                                      .normalWhiteBoldFontStyle(),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      : SizedBox(
                          height: 100.h,
                          width: 100.w,
                          child: Center(
                            child: ErrorApi(
                              onRety: () {
                                context
                                    .read<FoodDetailsCubit>()
                                    .loadFoodDetails(52772);
                              },
                            ),
                          ),
                        );
            },
          ),
        ),
      ),
    );
  }
}
