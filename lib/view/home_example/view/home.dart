import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealdbapp/core/extension/string_extension.dart';
import 'package:mealdbapp/view/home/cubit/home_cubit.dart';
import 'package:mealdbapp/view/home_example/viewModel/cubit/home_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/enums/reques.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../../utils/box_decoration.dart';
import '../../../utils/text_styles.dart';

import '../../widget/error.dart';
import '../../widget/loading.dart';

class ExHomeScreen extends StatelessWidget {
  const ExHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            left: 5.w, right: 5.w, top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            buildAppbar(),
            
            buildContainerPage(),
          ],
        ),
      ),
    );
  }

  SizedBox buildAppbar() {
    return SizedBox(
      height: 8.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Home",
            style: Styles.largeBoldFontStyle(),
          ),
          GestureDetector(
              onTap: () {
                NavigationService.instance
                    .navigateToPage(path: NavigationConstants.SEARCH);
              },
              child: const Icon(Icons.search)),
        ],
      ),
    );
  }

  Container buildContainerPage() {
    return Container(
      alignment: Alignment.topCenter,
      height: 80.h,
      child: BlocProvider<ExHomeCubit>(
        create: (context) => ExHomeCubit(),
        child: BlocConsumer<ExHomeCubit, ExHomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            ExHomeCubit cubit = context.read<ExHomeCubit>();
            return 
                buildSingleChildPage(cubit);
                
          },
        ),
      ),
    );
  }

  SingleChildScrollView buildSingleChildPage(ExHomeCubit cubit) {
    return 
    SingleChildScrollView(
      physics: const  BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "What would your like to eat?",
            style: Styles.normalBoldFontStyle(
                fontSize: 18.sp, color: Colors.blueGrey.shade800),
            textAlign: TextAlign.start,
          ),
          
          buildRandomFood(cubit),
          Text(
            "Over Populer Items",
            style: Styles.normalBoldFontStyle(
                fontSize: 18.sp, color: Colors.blueGrey.shade900),
            textAlign: TextAlign.start,
          ),
          buildListPopulerItems(cubit),
          Text(
            "Category",
            style: Styles.normalBoldFontStyle(
                fontSize: 18.sp, color: Colors.blueGrey.shade900),
            textAlign: TextAlign.start,
          ),
          buildListCategory(cubit)
        ],
      ),
    );
  }

  Widget buildRandomFood(ExHomeCubit cubit) {
    return cubit.isFoodLoading?
     GestureDetector(
      onTap: () {
        NavigationService.instance.navigateToPage(
            path: NavigationConstants.FOOD_DETAIL,
            data: cubit.resFoodDetails!.meals![0].idMeal!);
      },
      child: Container(
        margin: EdgeInsets.only(top: 1.h, bottom: 3.h),
        height: 18.h,
        width: 100.w,
        decoration: customBoxDecoration(
            borderRadius: 5.w,
            image: NetworkImage(cubit.resFoodDetails!.meals![0].strMealThumb!),
            fit: BoxFit.cover),
      ),
    ):const Loading();
  }

  Widget buildListPopulerItems(ExHomeCubit cubit) {
    return cubit.isPopularItemsLoading?
    SizedBox(
      height: 20.h,
      child: ListView.builder(
        itemCount: cubit.resPopulerItems!.meals!.length,
        scrollDirection: Axis.horizontal,
        padding:  EdgeInsets.all(0),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(top: 1.h, bottom: 3.h, right: 10.w),
            height: 18.h,
            width: 50.w,
            decoration: customBoxDecoration(
                borderRadius: 5.w,
                hasShadow: true,
                image: NetworkImage(
                    cubit.resPopulerItems!.meals![index].strIngredient!
                        .toImageNetworkIngredients,
                    scale: 1),
                fit: BoxFit.fitHeight),
          );
        },
      ),
    ):const Loading();
  }

  Widget buildListCategory(ExHomeCubit cubit) {
    return cubit.isCategoriesLoading?
     Container(
      margin: const EdgeInsets.all(5),
      decoration: customBoxDecoration(hasShadow: true),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        itemCount: cubit.resCategories!.categories!.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              NavigationService.instance.navigateToPage(
                  path: NavigationConstants.CATEGORY_DETAILS,
                  data: cubit.resCategories!.categories![index].strCategory!);
            },
            child: Container(
              padding: EdgeInsets.only(top: 20.sp, right: 15.sp, left: 15.sp),
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.network(cubit
                        .resCategories!.categories![index].strCategoryThumb!),
                    Text(
                      cubit.resCategories!.categories![index].strCategory!,
                      style: Styles.normalBoldFontStyle(fontSize: 16.sp),
                    )
                  ]),
            ),
          );
        },
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      ),
    ):const Loading();
  }
}
