import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealdbapp/view/pagination/viewModel/cubit/pagination_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PaginationScreen extends StatelessWidget {
  const PaginationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: BlocProvider(
        create: (context) => PaginationCubit(),
        child: BlocConsumer<PaginationCubit, PaginationState>(
          listener: (context, state) {},
          builder: (context, state) {
            PaginationCubit cubit = context.read<PaginationCubit>();
            return CustomScrollView(
              controller: cubit.scroolController,
              slivers: <Widget>[
                buildSliverAppbar(cubit),
                buildSliverToBoxAdapter(),
                buildSliverList(cubit)
              ],
            );
          },
        ),
      ),
    );
  }

  ListView buildListview(PaginationCubit cubit) {
    return ListView.builder(
        controller: cubit.scroolController,
        itemCount: (cubit.userData?.length ?? 0) + 1,
        itemBuilder: (context, index) => index < (cubit.userData?.length ?? 0)
            ? listItemWidget(cubit, index, context)
            : loadingWidget());
  }

  Widget listItemWidget(
      PaginationCubit cubit, int index, BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ListTile(
        leading: const Icon(Icons.person_3),
        title: Text(cubit.userData?[index].author ?? ''),
        subtitle: Text(cubit.userData?[index].url ?? ''),
      ),
    );
  }

  Center loadingWidget() {
    return const Center(
        child: Padding(
      padding: EdgeInsets.all(15.0),
      child: LinearProgressIndicator(),
    ));
  }

  SliverList buildSliverList(PaginationCubit cubit) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return index < (cubit.userData?.length ?? 0)
              ? listItemWidget(cubit, index, context)
              : loadingWidget();
        },
        childCount: (cubit.userData?.length ?? 0) + 1,
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

  SliverAppBar buildSliverAppbar(PaginationCubit cubit) {
    return SliverAppBar(
      pinned: true,
      snap: false,
      floating: false,
      expandedHeight: 30.h,
      backgroundColor: Colors.black87,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text("Pagination Sliver List"),
        background: cubit.userData != null && cubit.userData!.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: cubit.userData?[1].downloadUrl ?? '',
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
}
