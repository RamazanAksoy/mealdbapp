import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealdbapp/core/constants/themes/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/enums/reques.dart';
import '../../../utils/text_styles.dart';
import '../../widget/error.dart';
import '../../widget/loading.dart';
import '../cubit/search_cubit.dart';
import '../cubit/search_state.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildAppBar(context, "Search"),
            buildSearchText(context),
            customSizedbox(),
          ],
        ),
      ),
    );
  }

  Padding buildSearchText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: SizedBox(
        height: 8.h,
        child: TextFormField(
          onChanged: (value) {
            if (value.length >= 2) {
              context.read<SearchCubit>().loadsearch(value);
            }
          },
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.w)),
              borderSide: BorderSide.none,
            ),
            hintText: 'Search Data',
            prefixIcon: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }

  SizedBox customSizedbox() {
    return SizedBox(
      height: 74.h,
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state.searchStatus == ApiRequest.requestInProgress
              ? const Loading()
              : state.searchStatus == ApiRequest.requestSuccess
                  ? buildListView(state)
                  : const Center(child: Text('Data not found'));
          ;
        },
      ),
    );
  }

  Container buildAppBar(BuildContext context, categoryName) {
    return Container(
      padding: EdgeInsets.only(left: 5.w, top: MediaQuery.of(context).padding.top),
      height: 10.h,
      child: Row(children: [
        Text(
          categoryName,
          style: Styles.largeBoldFontStyle(),
        ),
      ]),
    );
  }

  Widget buildListView(SearchState state) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      itemCount: state.search?.meals?.length ?? 0,
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
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: 5.h,
              width: 5.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.w),
                child: Image.network(state.search?.meals?[index].strMealThumb != null
                    ? state.search!.meals![index].strMealThumb!
                    : "https://www.shutterstock.com/image-vector/empty-set-null-slashed-zero-600w-2106956618.jpg"),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            SizedBox(
              width: 65.w,
              child: Text(
                state.search?.meals?[index].strMeal ?? '',
                style: Styles.normalBoldFontStyle(fontSize: 17.sp),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ]),
        );
      },
    );
  }
}
