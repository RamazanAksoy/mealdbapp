import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealdbapp/view/my_favorite/cubit/meal_cubit.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/text_styles.dart';

class MyFavoriteScreen extends StatelessWidget {
  const MyFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocProvider<MealCubit>(
          create: (context) => MealCubit(),
          child: BlocConsumer<MealCubit, MealState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state.foodDetails!.meals!.isEmpty) {
                return Text("boş");
              } else {
                return Column(
                  children: [
                    buildAppBar(context),
                    buildGridView(state),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

Container buildAppBar(BuildContext context) {
  return Container(
    padding:
        EdgeInsets.only(left: 5.w, top: MediaQuery.of(context).padding.top),
    height: 10.h,
    child: Row(children: [
      Text(
        "My Favorites",
        style: Styles.largeBoldFontStyle(),
      ),
    ]),
  );
}

Widget buildGridView(MealState state) {
  return GridView.builder(
    padding: const EdgeInsets.all(0),
    shrinkWrap: true,
    itemCount: state.foodDetails!.meals!.length,
    itemBuilder: (context, index) {
      return InkWell(
        onTap: () {
          //food detail sayfasına gidecek!
        },
        child: BlocProvider<MealCubit>(
          create: (context) => MealCubit(),
          child: BlocConsumer<MealCubit, MealState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Container(
                padding: EdgeInsets.all(15.sp),
                margin: EdgeInsets.all(15.sp),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.sp),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.1,
                      blurRadius: 1.5,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.network(
                          state.foodDetails!.meals![index].strMealThumb!),
                      Text(
                        state.foodDetails!.meals![index].strMeal!,
                        style:
                            Styles.largeFontStyle().copyWith(fontSize: 19.sp),
                      )
                    ]),
              );
            },
          ),
        ),
      );
    },
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1, childAspectRatio: 4 / 5),
  );
}


/* var x = "sa";

var y;

final meals = {
  "meals": [
    {
      "idMeal": "52772",
      "strMeal": "Teriyaki Chicken Casserole",
      "strDrinkAlternate": "sa",
      "strCategory": "Chicken",
      "strArea": "Japanese",
      "strInstructions":
          "Preheat oven to 350° F. Spray a 9x13-inch baking pan with non-stick spray....",
      "strMealThumb":
          "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg"
    }
  ]
};
  saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('meals', json.encode(meals));
    print("saveData");
  }

  getData() async {
    String strMeal = "boş";

    dynamic strMealThumb;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('meals');
    Map<String, dynamic> veri = jsonDecode(jsonString!);

    setState(() {
      strMeal = veri['meals'][0]['strMeal'];
      strMealThumb = veri['meals'][0]['strMealThumb'];
      x = strMeal;
      //setstate to cubit
      y = strMealThumb;
    });
  } */