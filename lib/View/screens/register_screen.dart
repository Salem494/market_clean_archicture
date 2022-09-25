import 'package:bego_market/Helper/shared_helper.dart';
import 'package:bego_market/View%20Model/auth_bloc/register/cubit.dart';
import 'package:bego_market/View%20Model/auth_bloc/register/state.dart';
import 'package:bego_market/View/screens/home_screen.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:bego_market/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RegisterScreen extends StatelessWidget {
  var email = TextEditingController();
  var name = TextEditingController();
  var password = TextEditingController();
  var phone = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            if (state.userModel.status) {
              print(state.userModel.status);
              showToast(
                  text: state.userModel.message.toString(),
                  color: ToastColors.SUCCESS);
              sharedHelper.preferences
                  .setString('token', state.userModel.data.token)
                  .then((value) {
                Token = state.userModel.data.token;
                print("Token" + Token);
                NavigateAndRemove(context: context, widget: HomeScreen());
              });
            } else {
              showToast(
                  text: state.userModel.message.toString(),
                  color: ToastColors.ERROR);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(),
              body: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Register Here ',
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
                              hintText: 'Name',
                              icon: Icons.person,
                              controller: name,
                              validate: (value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Your name';
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
                                hintText: 'Email',
                                icon: Icons.email,
                                controller: email,
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return 'Please Enter Your Email';
                                  } else {
                                    return null;
                                  }
                                }),
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
                            textFormField(
                              color: Colors.white,
                              fillColor: Colors.grey.shade200,
                              hintText: 'Phone Number',
                              icon: Icons.phone_android,
                              controller: phone,
                              validate: (value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Your phone';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            ConditionalBuilder(
                              condition: state is! RegisterLoadingState,
                              builder: (context) => customButton(
                                  onPressed: () {
                                    if (formKey.currentState.validate()) {
                                      RegisterCubit.get(context)
                                          .RegisterRequest(
                                              name: name.text,
                                              email: email.text,
                                              phone: phone.text,
                                              password: password.text);
                                    }
                                  },
                                  title: 'Register',
                                  color: Colors.deepOrange,
                                  height: 50,
                                  width: double.infinity),
                              fallback: (context) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ));
        },
      ),
    );

  }

}
