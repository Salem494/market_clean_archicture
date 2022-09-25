import 'package:bego_market/Model/login/login_user_data.dart';

abstract class RegisterState {}

class RegisterInitState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
 final UserModel userModel;
  RegisterSuccessState(this.userModel);
}

class RegisterErrorState extends RegisterState {
  final String error;

  RegisterErrorState(this.error);
}