import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealdbapp/core/init/cache/locale_manager.dart';
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
             
                return Column(
                  children: [
                    buildAppBar(context),
                    buildGridView(state),
                  ],
                );
              
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
  return state.isLoading==true?
  state.foodDetails!.meals!.isNotEmpty?
  GridView.builder(
    physics: const NeverScrollableScrollPhysics(),
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
              return state.isLoading==true?
              Container(
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
                child: 
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.network(
                          state.foodDetails!.meals![index].strMealThumb!),
                      Text(
                        state.foodDetails!.meals![index].strMeal!,
                        style:
                            Styles.largeFontStyle().copyWith(fontSize: 19.sp),
                      ),IconButton(onPressed: () {
                       customShowDialog(context,index);
                      }, icon: const Icon(Icons.favorite,color: Colors.red,size: 30,))
                    ])
              ):const Center(child: CircularProgressIndicator(),);
            },
          ),
        ),
      );
    },
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1, childAspectRatio: 4 / 5),
  ):const Center(child:  CircularProgressIndicator()):const Center(child: Text("Favori Ürün Bulunmamaktadır!"),);
}


 customShowDialog(BuildContext context,index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  const Text("Dikkat!"),
          content: const Text("Ürün Favorilerden Kaldıracaktır!"),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text("Onayla"),
              onPressed: () async{
                //Listeden seçilen veriyi silme işlemi yapılacak!
              MealCubit().deleteValue(index);
                
                // print(state.foodDetails!.meals!.length);

                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text("Kapat"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }