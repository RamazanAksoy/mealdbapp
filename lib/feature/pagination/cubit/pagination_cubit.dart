import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mealdbapp/feature/pagination/service/pagination_service.dart';
import 'package:meta/meta.dart';

import '../model/res_user_data.dart';

part 'pagination_state.dart';

class PaginationCubit extends Cubit<PaginationState> {
  PaginationCubit() : super(PaginationInitial()) {
    getUserData();
    sscontroller.addListener(
      () {
        if (sscontroller.position.maxScrollExtent == sscontroller.offset) {
          getUserData();
        }
      },
    );
  }

  PaginationService paginationService = PaginationService();

  List<ResUserData>? resUserData = List.empty(growable: true);
  int page = 1;
  final sscontroller = ScrollController();

  Future<void> getUserData() async {
    List<ResUserData>? newdata = (await paginationService.getUserData(page))?.data;
    page++;
    if (newdata != null) {
      for (var res in newdata) {
        resUserData?.add(res);
      }
    }
    emit(PaginationSuccess());
  }
}
