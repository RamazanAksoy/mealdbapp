import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealdbapp/feature/pagination/cubit/pagination_cubit.dart';

class PaginationScreen extends StatelessWidget {
  const PaginationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Pagination")),
        body: BlocProvider(
          create: (context) => PaginationCubit(),
          child: BlocConsumer<PaginationCubit, PaginationState>(
            listener: (context, state) {},
            builder: (context, state) {
              PaginationCubit read = context.read<PaginationCubit>();
              return buildListview(read);
            },
          ),
        ));
  }

  ListView buildListview(PaginationCubit read) {
    return ListView.builder(
        controller: read.sscontroller,
        itemCount: (read.resUserData?.length ?? 0) + 1,
        itemBuilder: (context, index) => index < (read.resUserData?.length ?? 0)
            ? listItemWidget(read, index, context)
            : loadingWidget());
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
