import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo/features/Home/repo/homerepo.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../model/homemodel.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<OnHomePressEvent>(_getUserDetails);

  }
  void _getUserDetails(OnHomePressEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());

    try {
      Response<dynamic>? response = await HomeRepo.getUserData();

      if (response != null && response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<UserListModel> userDetailsList = [];

        for (var item in data) {
          userDetailsList.add(UserListModel.fromJson(item));
        }

        emit(HomeLoaded(userList: userDetailsList));      }
      else {
        emit(HomeFailed());
      }
    } catch (e) {
      emit(HomeFailed());
    }
  }

}
