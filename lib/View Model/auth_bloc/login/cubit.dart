import 'package:bego_market/Helper/shared_helper.dart';
import 'state.dart';
import 'package:bego_market/constant.dart';
import 'package:bloc/bloc.dart';
import 'package:bego_market/Helper/dio_helper.dart';
import 'package:bego_market/Model/login/login_user_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);
  UserModel userModel;

  void LoginRequest({
    String email = '',
    String password = '',
  }) {
    emit(LoginLoadingState());
    print("Loading ******");
    DioHelper.postData(
        url: 'login',
        data: {'email': email, 'password': password}).then((value) {
      print("Enter ***");
      userModel = UserModel.fromJson(value.data);
      print("Data :${value.data}");
      emit(LoginSuccessState(userModel));
    }).catchError((e) {
      print(" Error " + e.toString());
      emit(LoginErrorState(e.toString()));
    });
  }



  void RegisterRequest({
    String name = '',
    String email = '',
    String password = '',
    String phone = '',
  }) {
    emit(RegisterLoadingState());
    print("Loading ******");
    DioHelper.postData(
        url: 'register',
        data: {'name':name ,'email': email, 'password': password,'phone':phone}).then((value) {
      print("Enter ***");
      userModel = UserModel.fromJson(value.data);
      print("Data :${value.data}");
      emit(RegisterSuccessState());
    }).catchError((e) {
      print(" Error " + e.toString());
      emit(RegisterErrorState(e.toString()));
    });
  }



}
