// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/components/components.dart';
import '../../../core/utils/local/cache_helper.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibility());
  }

  IconData resuffix = Icons.visibility_off_outlined;
  bool isrePassword = true;
  void changeRePasswordVisibility() {
    isrePassword = !isrePassword;
    resuffix = isrePassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ChangeRePasswordVisibility());
  }

  SignUp({
    required String email,
    required String password,
  }) async {
    emit(SignUpLoading());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      emit(SignUpSuccess());
      CacheHelper.saveData(key: 'userID', value: value.user!.uid);
      // user = UserModel.fromJson(value.user);
      // user.name = value.user!.displayName!;
      userID = value.user!.uid;

      // user = value.user;
      if (kDebugMode) {
        print('UID User is : ${value.user!.uid}');
        print('User is : ${value.user!}');
        print('Value User is : $value');
        // print(user.name);
      }
    }).catchError((onError) {
      emit(SignUpError());
      if (kDebugMode) {
        print(onError.toString());
      }
    });
  }
}


/*
// ignore_for_file: depend_on_referenced_packages, avoid_print, non_constant_identifier_names, unused_local_variable, use_build_context_synchronously, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/models/login_model.dart';
import 'package:market_app/modules/shop_login/cubit/states.dart';
import 'package:market_app/shared/network/end_points.dart';

import '../../../shared/network/remote/dio_helper.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoadingInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);
  ShopLoginModel? shoploginmodel;

  Future<void> login(
    String? phoneNumber,
    String? password,
  ) async {
    try {
      // Set the state to loading
      emit(ShopLoginLoadingState());

      // Make the API call using Dio
      final response = await DioHelper.postData(
        url: LOGIN,
        data: {'phoneNumber': phoneNumber, 'password': password},
      );

      // Handle the response based on your API's behavior
      if (response.statusCode! > 199 && response.statusCode! < 206) {
        // Authentication success
        shoploginmodel = ShopLoginModel.fromJson(response.data);
        print(shoploginmodel!.message);
        emit(ShopLoginSucsessState(shoploginmodel!));
      } else {
        // Authentication failure
        print('${response.statusCode} error failure');
        emit(ShopLoginErrorState(response.statusMessage!));
      }
    } catch (e) {
      // Handle any error that occurred during the API call
      print('api call $e');
      emit(ShopLoginErrorState(e.toString()));
    }
  }

  
  // function to implement the google signin

// creating firebase instance
}




*/