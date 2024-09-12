part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}
class HomeLoaded extends HomeState {
  List<UserListModel>? userList;
  HomeLoaded({required this.userList});

}
class HomeFailed extends HomeState{}
