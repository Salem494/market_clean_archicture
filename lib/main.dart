import 'package:bego_market/Helper/dio_helper.dart';
import 'package:bego_market/Helper/shared_helper.dart';
import 'package:bego_market/View%20Model/home_bloc/cubit.dart';
import 'package:bego_market/View/screens/home_screen.dart';
import 'package:bego_market/View/screens/inboarding_screen.dart';
import 'package:bego_market/View/screens/login_screen.dart';
import 'package:bego_market/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await sharedHelper.initShared();

  bool onboarding = sharedHelper.preferences.getBool('onBoarding');

  Token = sharedHelper.preferences.getString('token');

  print("TOKEN :${Token}");

  Widget widget;

  if (onboarding != null) {
    if (Token != null) {
      widget = HomeScreen();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = OnBoardingScreen();
  }

  runApp(MyApp(startScreen: widget));
}

class MyApp extends StatelessWidget {
  final Widget startScreen;

  MyApp({this.startScreen});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopHomeCubit()
        ..getHomeData()
        ..getCategoriesHomeData()
        ..getUserDataProfile(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop Demo',
        theme: themeData,
        darkTheme: darkTheme,
        home: startScreen,
      ),
    );
  }
}
