import 'package:bego_market/Helper/shared_helper.dart';
import '../../View Model/auth_bloc/login/cubit.dart';
import '../../View Model/auth_bloc/login/state.dart';
import 'package:bego_market/View/screens/home_screen.dart';
import 'package:bego_market/View/screens/register_screen.dart';
import 'package:bego_market/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder/conditional_builder.dart';

class LoginScreen extends StatelessWidget {
  var email = TextEditingController();
  var password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          print("Enter Login Screen");
          if (state is LoginSuccessState) {
             print("Enter Login Screen2");
              if(state.userModel.status){
                print(state.userModel.status);
                showToast(
                    text: state.userModel.message.toString(),
                    color: ToastColors.SUCCESS);
                sharedHelper.preferences
                    .setString('token', state.userModel.data.token)
                    .then((value) {
                  Token = state.userModel.data.token;
                  print("Token" +Token);
                  NavigateAndRemove(context: context, widget: HomeScreen());
                });
              }else {
                print(state.userModel.status);
                showToast(
                    text: state.userModel.message.toString(),
                    color: ToastColors.ERROR);
              }
             }
          if (state is LoginErrorState) {
            print("Error In Login Screen");
            showToast(
              text: state.error,
              color: ToastColors.ERROR,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
              body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Log in',
                style: textStyle(color: Colors.black, fontSize: 25),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      textFormField(
                        color: Colors.white,
                        fillColor: Colors.grey.shade200,
                        hintText: 'Email',
                        icon: Icons.email,
                        controller: email,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Your Email';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      textFormField(
                          color: Colors.white,
                          fillColor: Colors.grey.shade200,
                          hintText: 'Password',
                          icon: Icons.remove_red_eye,
                          controller: password,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter Your Password';
                            } else {
                              return null;
                            }
                          }),
                      SizedBox(
                        height: 25,
                      ),
                      ConditionalBuilder(
                        condition:state is! LoginLoadingState ,
                        builder: (context)=>customButton(
                            onPressed: () {
                              if (formKey.currentState.validate()) {
                                LoginCubit.get(context).LoginRequest(
                                    email: email.text,
                                    password: password.text);
                              }
                            },
                            title: 'Login',
                            color: Colors.deepOrange,
                            height: 50,
                            width: double.infinity),
                        fallback: (context)=>const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account ',
                            style: textStyle(
                                color: Colors.grey.shade500, fontSize: 15),
                          ),
                          InkWell(
                            onTap: () {
                              NavigateAndRemove(
                                  context: context, widget: RegisterScreen());
                            },
                            child: Text(
                              'Register ',
                              style: textStyle(
                                  color: Colors.grey.shade800, fontSize: 20),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ));
        },
      ),
    );
  }
}
