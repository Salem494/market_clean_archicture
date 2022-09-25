import 'package:bego_market/Helper/shared_helper.dart';
import 'state.dart';
import 'package:bego_market/constant.dart';
import 'package:bloc/bloc.dart';
import 'package:bego_market/Helper/dio_helper.dart';
import 'package:bego_market/Model/login/login_user_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  UserModel userModel;

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
      emit(RegisterSuccessState(userModel));
    }).catchError((e) {
      print(" Error " + e.toString());
      emit(RegisterErrorState(e.toString()));
    });
  }



}
