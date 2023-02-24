part of 'pagination_cubit.dart';

@immutable
abstract class PaginationState {}

class PaginationInitial extends PaginationState {}

class PaginationLoading extends PaginationState{}

class PaginationSuccess extends PaginationState{}
