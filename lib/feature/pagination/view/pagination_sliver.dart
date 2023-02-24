import 'package:cached_network_image/cached_network_image.dart';
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
              buildSliverAppbar(read),
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

  SliverAppBar buildSliverAppbar(PaginationCubit read) {
    return SliverAppBar(
      pinned: true,
      snap: false,
      floating: false,
      expandedHeight: 30.h,
      backgroundColor: Colors.black87,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text("Pagination Sliver List"),
        background: read.resUserData != null && read.resUserData!.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: read.resUserData?[0].downloadUrl ?? '',
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              )
            : Container(),
      ),
    );
  }

  Widget listItemWidget(PaginationCubit read, int index, BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ListTile(
        leading: const Icon(
          Icons.arrow_right,
          color: Colors.black87,
        ),
        title: Text(read.resUserData?[index].author ?? ''),
        subtitle: Text(read.resUserData?[index].url ?? ''),
      ),
    );
  }

  Center loadingWidget() {
    return const Center(
        child: Padding(
      padding: EdgeInsets.all(15.0),
      child: CircularProgressIndicator(
        color: Colors.black87,
      ),
    ));
  }
}
