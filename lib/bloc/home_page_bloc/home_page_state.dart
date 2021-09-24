part of 'home_page_cubit.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class HomePageLoading extends HomePageState {}

class HomePageSuccess extends HomePageState {
  final List<ToDo> toDos;
  HomePageSuccess(this.toDos);
}

class HomePageFailure extends HomePageState {
  final String errorMessage;
  HomePageFailure(this.errorMessage);
}
