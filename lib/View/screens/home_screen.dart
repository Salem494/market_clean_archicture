// ignore_for_file: use_key_in_widget_constructors

import 'package:bego_market/Helper/shared_helper.dart';
import 'package:bego_market/View%20Model/home_bloc/cubit.dart';
import 'package:bego_market/View%20Model/home_bloc/state.dart';
import 'package:bego_market/View/screens/login_screen.dart';
import 'package:bego_market/View/screens/search_screen.dart';
import 'package:bego_market/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopHomeCubit, ShopHomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        ShopHomeCubit cubit = ShopHomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Market One',
              style: textStyle(color: Colors.black45, fontSize: 18.0),
            ),
            actions: [
              FlatButton(
                  onPressed: () {
                    NavigateTo(context: context, widget: SearchScreen());
                  },
                  child: Icon(Icons.search))
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.black45,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favourite'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ],
          ),
        );
      },
    );
  }
}
