import 'package:bego_market/Model/login/login_user_data.dart';

abstract class LoginState {}

class LoginInitState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
   final UserModel userModel;

  LoginSuccessState(this.userModel);
}

class LoginErrorState extends LoginState {
  final String error;

  LoginErrorState(this.error);
}


class RegisterLoadingState extends LoginState {}

class RegisterSuccessState extends LoginState {
}

class RegisterErrorState extends LoginState {
  final String error;

  RegisterErrorState(this.error);
}
