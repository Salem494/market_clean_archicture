import 'package:bego_market/Helper/shared_helper.dart';
import 'package:bego_market/View%20Model/home_bloc/cubit.dart';
import 'package:bego_market/View%20Model/home_bloc/state.dart';
import 'package:bego_market/View/screens/login_screen.dart';
import 'package:bego_market/constant.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopHomeCubit, ShopHomeState>(
        listener: (context, state) {},
        builder: (context, state) {
            ShopHomeCubit user = ShopHomeCubit.get(context);

          name.text  = user.userModel.data.name;
          email.text = user.userModel.data.email;
          phone.text = user.userModel.data.phone;

          return ConditionalBuilder(
            condition: ShopHomeCubit.get(context).userModel != null,
            builder: (context) => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if(state is UpdateDataLoadingState)

                        const Center(child: CircularProgressIndicator(),),
                      textFormField(
                          controller: name,
                          textInputType: TextInputType.text,
                          hintText: 'Your Name',
                          icon: Icons.person,
                          color: Colors.blueGrey),
                      const SizedBox(
                        height: 15,
                      ),
                      textFormField(
                          controller: email,
                          textInputType: TextInputType.text,
                          hintText: 'Your Email',
                          icon: Icons.email,
                          color: Colors.blueGrey),
                      const SizedBox(
                        height: 15,
                      ),
                      textFormField(
                          controller: phone,
                          textInputType: TextInputType.text,
                          hintText: 'Phone Number',
                          icon: Icons.phone_android,
                          color: Colors.blueGrey),

                      SizedBox(
                        height: 10,
                      ),

                      Center(
                        child: customButton(
                            fontSize: 20,
                            color: Colors.black45,
                            width: 150,
                            height: 50,
                            title: 'update',
                            onPressed: (){
                              if(formKey.currentState.validate()){
                                ShopHomeCubit.get(context).updateData(
                                    name: name.text,
                                    email: email.text,
                                    phone: phone.text
                                );
                              }
                            }
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            sharedHelper.preferences.remove('token').then((value) {
                              if (value) {
                                NavigateAndRemove(
                                    context: context, widget: LoginScreen());
                              }
                            });
                          },
                          child: Row(
                            children: [

                              const Icon(
                                Icons.logout,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 10,),
                              Text(
                                'Log Out',
                                style: textStyle(color: Colors.black, fontSize: 18.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ),
            ),
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
