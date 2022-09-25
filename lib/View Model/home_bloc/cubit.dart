import 'dart:convert';

import 'package:bego_market/Model/home/categories_model.dart';
import 'package:bego_market/Model/home/favourite_model.dart';
import 'package:bego_market/Model/home/search_model.dart';
import 'package:bego_market/Model/login/login_user_data.dart';
import 'package:dio/dio.dart';
import 'package:bego_market/Helper/dio_helper.dart';
import 'package:bego_market/Helper/shared_helper.dart';
import 'package:bego_market/Model/home/home_model.dart';
import 'package:bego_market/View%20Model/home_bloc/state.dart';
import 'package:bego_market/View/screens/categories_screen.dart';
import 'package:bego_market/View/screens/favourite_screen.dart';
import 'package:bego_market/View/screens/product_screen.dart';
import 'package:bego_market/View/screens/search_screen.dart';
import 'package:bego_market/View/screens/settings_screen.dart';
import 'package:bego_market/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class ShopHomeCubit extends Cubit<ShopHomeState> {
  ShopHomeCubit() : super(InitShopHomeState());

  static ShopHomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  Map<int, bool> isFavourite = {};

  List<Widget> screens = [
    ProductScreen(),
    CategoriesScreen(),
    FavouriteScreen(),
    SearchScreen(),
    SettingsScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }

  HomeModel model;
  CategoriesModel categoriesModel;
  AddFavModel favModel;
  UserModel userModel;
  SearchModel searchModel;

  getHomeData() async {
    emit(HomeLoadingState());
    DioHelper.getData(url: 'home').then((value) {
      model = HomeModel.fromJson(value.data);
      model.data.products.forEach((element) {
        isFavourite.addAll({element.id: element.inFavorites});
      });
      print("Data : ${isFavourite}");
      emit(HomeSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeErrorState());
    });
  }

  getCategoriesHomeData() async {
    emit(CategoriesLoadingState());
    DioHelper.getData(url: 'categories', token: Token).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      print("categories : " + value.data);
      emit(CategoriesSuccessState());
    }).catchError((error) {
      print("Error in Method getCategoriesHomeData Data");
      print(error.toString());
      emit(CategoriesErrorState());
    });
  }

  changeFavouriteButton(int productId) {
    isFavourite[productId] = !isFavourite[productId];
    emit(ChangeFavSuccessState());

    DioHelper.postData(
      url: 'favorites',
      data: {'product_id': productId},
      token: Token,
    ).then((value) {
      favModel = AddFavModel.fromJson(value.data);
      if (!favModel.status) {
        isFavourite[productId] = !isFavourite[productId];
      }
      emit(ChangeFavButtonSuccessState(favModel));
    }).catchError((e) {
      print("Error Is :${e.toString()} ");
      isFavourite[productId] = !isFavourite[productId];
      emit(ChangeFavButtonErrorState());
    });
  }

  getUserDataProfile() {
    emit(ProfileLoadingState());
    DioHelper.getData(url: 'profile', token: Token).then((value) {
      userModel = UserModel.fromJson(value.data);
      print("USER Data " + value.data);
      emit(ProfileSuccessState(userModel));
    }).catchError((error) {
      print("Error :${error.toString()}");
      emit(ProfileErrorState());
    });
  }

  updateData({
    String name = '',
    String email = '',
    String phone = '',
  }) {
    emit(UpdateDataLoadingState());
    DioHelper.putData(
      url: 'update-profile',
      data: {'name': name, 'email': email, 'phone': phone},
      token: Token,
    ).then((value) {
      userModel = UserModel.fromJson(value.data);
      emit(UpdateDataSuccessState());
    }).catchError((e) {
      print("Error Is :${e.toString()} ");
      emit(UpdateDataErrorState());
    });
  }

  searchData({String text}) {
    emit(SearchLoadingState());
    DioHelper.postData(
            url: 'products/search', data: {'text': text}, token: Token)
        .then((value) {
      searchModel = SearchModel.fromJson(value.data);
      print(value.data);
      emit(SearchSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(SearchErrorState());
    });
  }

  getProductDetails(int id) {
    GetProductDetailsLoadingState();
    DioHelper.getData(url: 'products/${id}', token: Token)
        .then((value){
          model = HomeModel.fromJson(value.data);
          print("Data "+value.data);
          emit(GetProductDetailsSuccessState());
        })
        .catchError((e) {
      print("Error : ${e}");
      emit(GetProductDetailsErrorState());
    });
  }
}
