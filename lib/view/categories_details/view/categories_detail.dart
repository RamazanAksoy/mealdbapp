import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/enums/reques.dart';
import '../../../utils/text_styles.dart';
import '../../widget/error.dart';
import '../../widget/loading.dart';
import '../cubit/categories_details_cubit.dart';
import '../cubit/categories_details_state.dart';

class CategoriesDetailsScreen extends StatelessWidget {
  final String? categoryName;
  const CategoriesDetailsScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [buildAppBar(context, categoryName), customSizedbox()],
        ),
      ),
    );
  }

  SizedBox customSizedbox() {
    return SizedBox(
      height: 84.h,
      child: BlocProvider<CategoriesDetailsCubit>(
        create: (context) => CategoriesDetailsCubit(),
        child: BlocConsumer<CategoriesDetailsCubit, CategoriesDetailsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return state.categoryDetailsStatus == ApiRequest.requestInProgress
                ? const Loading()
                : state.categoryDetailsStatus == ApiRequest.requestSuccess
                    ? buildGridView(state)
                    : ErrorApi(
                        onRety: () {
                          context
                              .read<CategoriesDetailsCubit>()
                              .loadcategoryDetails(categoryName!);
                        },
                      );
          },
        ),
      ),
    );
  }

  Container buildAppBar(BuildContext context, categoryName) {
    return Container(
      padding:
          EdgeInsets.only(left: 5.w, top: MediaQuery.of(context).padding.top),
      height: 10.h,
      child: Row(children: [
        Text(
          categoryName,
          style: Styles.largeBoldFontStyle(),
        ),
      ]),
    );
  }

  Widget buildGridView(CategoriesDetailsState state) {
    return GridView.builder(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      itemCount: state.categoryDetails!.meals!.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(18.sp),
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
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(state
                            .categoryDetails!.meals![index].strMealThumb !=
                        null
                    ? state.categoryDetails!.meals![index].strMealThumb!
                    : "https://www.shutterstock.com/image-vector/empty-set-null-slashed-zero-600w-2106956618.jpg"),
                Text(
                  state.categoryDetails!.meals![index].strMeal!,
                  style: Styles.largeFontStyle(),
                ),
              ]),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, childAspectRatio: 4 / 5),
    );
  }
}
