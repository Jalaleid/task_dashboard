// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:task_dashboard/core/utils/components/components.dart';

part 'add_devices_state.dart';

class AddDevicesCubit extends Cubit<AddDevicesState> {
  AddDevicesCubit() : super(AddDevicesInitial());

  AddDevices({
    //required String uId,
    required String CountPS5,
    required String PricePerHourPS5,
    required String CountPS4,
    required String PricePerHourPS4,
    required String CountPC,
    required String PricePerHourPC,
  }) {
    emit(AddDevicesLoading());
    Map<String, dynamic> json = {
      'CountPS5': num.parse(CountPS5),
      'PricePerHourPS5': num.parse(PricePerHourPS5),
      'CountPS4': num.parse(CountPS4),
      'PricePerHourPS4': num.parse(PricePerHourPS4),
      'CountPC': num.parse(CountPC),
      'PricePerHourPC': num.parse(PricePerHourPC)
    };
    FirebaseFirestore.instance
        .collection('dashboard')
        .doc(userID)
        .set(json)
        .then((value) {
      emit(AddDevicesSuccess());
    }).catchError((onError) {
      emit(AddDevicesError());
      if (kDebugMode) {
        print(onError.toString());
      }
    });
  }
}
