import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealdbapp/feature/pagination/cubit/pagination_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PaginationSliverScreen extends StatelessWidget {
  const PaginationSliverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => PaginationCubit(),
      child: BlocConsumer<PaginationCubit, PaginationState>(
        listener: (context, state) {},
        builder: (context, state) {
          PaginationCubit read = context.read<PaginationCubit>();
          return CustomScrollView(
            controller: read.sscontroller,
            slivers: <Widget>[
              buildSliverAppbar(),
              buildSliverToBoxAdapter(),
              buildSliverList(read),
            ],
          );
        },
      ),
    ));
  }

  SliverList buildSliverList(PaginationCubit read) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return index < (read.resUserData?.length ?? 0)
              ? listItemWidget(read, index, context)
              : loadingWidget();
        },
        childCount: (read.resUserData?.length ?? 0) + 1,
      ),
    );
  }

  SliverToBoxAdapter buildSliverToBoxAdapter() {
    return const SliverToBoxAdapter(
      child: SizedBox(
        height: 20,
        child: Center(
          child: Text('Scroll to see the SliverAppBar in effect.'),
        ),
      ),
    );
  }

  SliverAppBar buildSliverAppbar() {
    return SliverAppBar(
      pinned: true,
      snap: false,
      floating: false,
      expandedHeight: 40.h,
      flexibleSpace: const FlexibleSpaceBar(
        title: Text("deneme"),
        background: FlutterLogo(),
      ),
    );
  }

  Widget listItemWidget(PaginationCubit read, int index, BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ListTile(
        leading: const Icon(Icons.arrow_right),
        title: Text(read.resUserData?[index].author ?? ''),
        subtitle: Text(read.resUserData?[index].url ?? ''),
      ),
    );
  }

  Center loadingWidget() {
    return const Center(
        child: Padding(
      padding: EdgeInsets.all(15.0),
      child: CircularProgressIndicator(),
    ));
  }
}
