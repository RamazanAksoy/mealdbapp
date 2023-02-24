import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../../product/utils/text_styles.dart';
import '../cubit/meal_cubit.dart';

class MyFavoriteScreen extends StatelessWidget {
  const MyFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            buildAppBar(context),
            SizedBox(height: 84.h, child: buildGridView()),
          ],
        ),
      ),
    );
  }
}

Container buildAppBar(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(left: 5.w, top: MediaQuery.of(context).padding.top),
    height: 10.h,
    child: Row(children: [
      Text(
        "My Favorites",
        style: Styles.largeBoldFontStyle(),
      ),
    ]),
  );
}

Widget buildGridView() {
  return BlocProvider<MealCubit>(
    create: (context) => MealCubit(),
    child: BlocConsumer<MealCubit, MealState>(
      listener: (context, state) {},
      builder: (blocContext, state) {
        return state.isLoading == true
            ? state.foodDetails!.isNotEmpty
                ? GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(0),
                    shrinkWrap: true,
                    itemCount: state.foodDetails!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            //food detail sayfasına gidecek!
                            NavigationService.instance.navigateToPage(
                                path: NavigationConstants.FOOD_DETAIL,
                                data: state.foodDetails![0].idMeal!);
                          },
                          child: Container(
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
                                    Image.network(state.foodDetails![index].strMealThumb!),
                                    Text(
                                      state.foodDetails![index].strMeal!,
                                      style: Styles.largeFontStyle().copyWith(fontSize: 19.sp),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          customShowDialog(blocContext,
                                              int.parse(state.foodDetails?[index].idMeal ?? ''));
                                        },
                                        icon: const Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                          size: 30,
                                        ))
                                  ])));
                    },
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, childAspectRatio: 4 / 5),
                  )
                : const Center(child: Text("Favori Ürün Bulunmamaktadır!"))
            : const Center(child: CircularProgressIndicator());
      },
    ),
  );
}

customShowDialog(BuildContext blocContext, int index) {
  showDialog(
    context: blocContext,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Dikkat!"),
        content: const Text("Ürün Favorilerden Kaldıracaktır!"),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text("Onayla"),
            onPressed: () async {
              blocContext.read<MealCubit>().deleteValue(index);
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
