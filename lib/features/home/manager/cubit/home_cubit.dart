import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:task_dashboard/core/utils/model/device.dart';

import '../../../../core/utils/components/components.dart';
import '../../../../core/utils/local/cache_helper.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  late Devices devices;

  void getData() async {
    emit(HomeGetDataLoading());
    await FirebaseFirestore.instance
        .collection('dashboard')
        .doc(userID)
        .get()
        .then((value) {
      devices = Devices.fromJson(value.data()!);
      if (kDebugMode) {
        print(devices.PricePerHourPS5);
      }
      emit(HomeGetDataSuccess());
    }).catchError((onError) {
      if (kDebugMode) {
        print(onError.toString());
      }
      emit(HomeGetDataError());
    });
  }

  void signOut() async {
    emit(HomesignOutLoading());

    await FirebaseAuth.instance.signOut().then((value) {
      CacheHelper.removeData(key: 'UserID');
      if (kDebugMode) {
        print("signOut Seccses");
      }
      emit(HomesignOutSuccess());
    }).catchError((onError) {
      if (kDebugMode) {
        print(onError.toString());
      }
      emit(HomesignOutError());
    });
  }
}
