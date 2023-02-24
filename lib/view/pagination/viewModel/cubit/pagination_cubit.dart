import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mealdbapp/view/pagination/model/data_model.dart';
import 'package:mealdbapp/view/pagination/viewModel/service/pagination_service.dart';
import 'package:meta/meta.dart';

part 'pagination_state.dart';

class PaginationCubit extends Cubit<PaginationState> {
  PaginationCubit() : super(PaginationInitial()) {
    _init();
  }

  List<UserData>? newData;
  List<UserData>? userData = List.empty(growable: true);

  PaginationService paginationService = PaginationService();
  final scroolController = ScrollController();
  int page = 1;

  _init() async {
    await getUserData();
    scroolController.addListener(() {
      if (scroolController.position.maxScrollExtent ==
          scroolController.offset) {
        getUserData();
      }
    });
  }

  Future getUserData() async {
    newData = (await paginationService.getUserDataService(page))?.data;
    page++;
    if (newData != null) {
      for (var element in newData!) {
        userData!.add(element);
      }
    }
    emit(PaginationSuccess());
  }
}
