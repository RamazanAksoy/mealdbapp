import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealdbapp/view/category_example/cubit/category_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../../utils/text_styles.dart';
import '../../widget/loading.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildAppBar(context),
            buildSizedBox(),
          ],
        ),
      ),
    );
  }

  SizedBox buildSizedBox() {
    return SizedBox(
        height: 84.h,
        child: BlocProvider<CategoryCubit>(
            create: (context) => CategoryCubit(),
            child: BlocConsumer<CategoryCubit, CategoryState>(
                listener: (context, state) {},
                builder: (context, state) {
                  CategoryCubit read = context.read<CategoryCubit>();
                  return read.isLoading ? buildGridView(read) : const Loading();
                })));
  }

  Container buildAppBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5.w, top: MediaQuery.of(context).padding.top),
      height: 10.h,
      child: Row(children: [
        Text(
          "Category",
          style: Styles.largeBoldFontStyle(),
        ),
      ]),
    );
  }

  Widget buildGridView(CategoryCubit read) {
    return GridView.builder(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      itemCount: read.resCategories!.categories!.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            NavigationService.instance.navigateToPage(
                path: NavigationConstants.CATEGORY_DETAILS,
                data: read.resCategories!.categories![index].strCategory!);
          },
          child: Container(
            padding: EdgeInsets.all(20.sp),
            margin: EdgeInsets.all(18.sp),
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
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Image.network(read.resCategories!.categories![index].strCategoryThumb!),
              Text(
                read.resCategories!.categories![index].strCategory!,
                style: Styles.normalBoldFontStyle(),
              )
            ]),
          ),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }
}
