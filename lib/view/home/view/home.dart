import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealdbapp/core/extension/string_extension.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/enums/reques.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../../utils/box_decoration.dart';
import '../../../utils/text_styles.dart';

import '../../widget/error.dart';
import '../../widget/loading.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5.w, right: 5.w, top: MediaQuery.of(context).padding.top),
      child: Column(
        children: [
          buildAppbar(),
          buildContainerPage(),
        ],
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
                NavigationService.instance.navigateToPage(path: NavigationConstants.SEARCH);
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
      child: BlocProvider<HomeCubit>(
        create: (context) => HomeCubit(),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return state.homeStatus == ApiRequest.requestInProgress
                ? const Loading()
                : state.homeStatus == ApiRequest.requestSuccess
                    ? buildSingleChildPage(state)
                    : ErrorApi(
                        onRety: () {
                          context.read<HomeCubit>().loadfoodDetails();
                        },
                      );
          },
        ),
      ),
    );
  }

  SingleChildScrollView buildSingleChildPage(HomeState state) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "What would your like to eat?",
            style: Styles.normalBoldFontStyle(fontSize: 18.sp, color: Colors.blueGrey.shade800),
            textAlign: TextAlign.start,
          ),
          buildRandomFood(state),
          Text(
            "Over Populer Items",
            style: Styles.normalBoldFontStyle(fontSize: 18.sp, color: Colors.blueGrey.shade900),
            textAlign: TextAlign.start,
          ),
          buildListPopulerItems(state),
          Text(
            "Category",
            style: Styles.normalBoldFontStyle(fontSize: 18.sp, color: Colors.blueGrey.shade900),
            textAlign: TextAlign.start,
          ),
          buildListCategory(state)
        ],
      ),
    );
  }

  Widget buildRandomFood(HomeState state) {
    return GestureDetector(
      onTap: () {
        NavigationService.instance.navigateToPage(
            path: NavigationConstants.FOOD_DETAIL, data: state.foodDetails!.meals![0].idMeal!);
      },
      child: Container(
        margin: EdgeInsets.only(top: 1.h, bottom: 3.h),
        height: 18.h,
        width: 100.w,
        decoration: customBoxDecoration(
            borderRadius: 5.w,
            image: NetworkImage(state.foodDetails!.meals![0].strMealThumb!),
            fit: BoxFit.cover),
      ),
    );
  }

  SizedBox buildListPopulerItems(HomeState state) {
    return SizedBox(
      height: 20.h,
      child: ListView.builder(
        itemCount: state.populerItems!.meals!.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(0),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(top: 1.h, bottom: 3.h, right: 10.w),
            height: 18.h,
            width: 50.w,
            decoration: customBoxDecoration(
                borderRadius: 5.w,
                hasShadow: true,
                image: NetworkImage(
                    state.populerItems!.meals![index].strIngredient!.toImageNetworkIngredients,
                    scale: 1),
                fit: BoxFit.fitHeight),
          );
        },
      ),
    );
  }

  Container buildListCategory(HomeState state) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: customBoxDecoration(hasShadow: true),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        itemCount: state.categories!.categories!.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              NavigationService.instance.navigateToPage(
                  path: NavigationConstants.CATEGORY_DETAILS,
                  data: state.categories!.categories![index].strCategory!);
            },
            child: Container(
              padding: EdgeInsets.only(top: 20.sp, right: 15.sp, left: 15.sp),
              alignment: Alignment.center,
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Image.network(state.categories!.categories![index].strCategoryThumb!),
                Text(
                  state.categories!.categories![index].strCategory!,
                  style: Styles.normalBoldFontStyle(fontSize: 16.sp),
                )
              ]),
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      ),
    );
  }
}
