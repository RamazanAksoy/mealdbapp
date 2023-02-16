import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/enums/reques.dart';
import '../../../utils/text_styles.dart';
import '../../widget/error.dart';
import '../../widget/loading.dart';
import '../cubit/categories_cubit.dart';
import '../cubit/categories_state.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildAppBar(context),
          buildSizedBox(),
        ],
      ),
    );
  }

  SizedBox buildSizedBox() {
    return SizedBox(
        height: 84.h,
        child: BlocProvider<CategoriesCubit>(
            create: (context) => CategoriesCubit(),
            child: BlocConsumer<CategoriesCubit, CategoriesState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return state.categoriesStatus == ApiRequest.requestInProgress
                      ? const Loading()
                      : state.categoriesStatus == ApiRequest.requestSuccess
                          ? buildGridView(state)
                          : ErrorApi(
                              onRety: () {
                                context.read<CategoriesCubit>().loadcategories();
                              },
                            );
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

  Widget buildGridView(CategoriesState state) {
    return GridView.builder(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      itemCount: state.categories!.categories!.length,
      itemBuilder: (context, index) {
        return Container(
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
            Image.network(state.categories!.categories![index].strCategoryThumb!),
            Text(
              state.categories!.categories![index].strCategory!,
              style: Styles.normalBoldFontStyle(),
            )
          ]),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }
}
