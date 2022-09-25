import 'package:bego_market/Model/home/favourite_model.dart';
import 'package:bego_market/Model/login/login_user_data.dart';

abstract class ShopHomeState {}

class InitShopHomeState extends ShopHomeState {}

class ChangeBottomNavBarState extends ShopHomeState {}

class HomeLoadingState extends ShopHomeState {}

class HomeSuccessState extends ShopHomeState {}

class HomeErrorState extends ShopHomeState {}

class CategoriesLoadingState extends ShopHomeState {}

class CategoriesSuccessState extends ShopHomeState {}

class CategoriesErrorState extends ShopHomeState {}

class ChangeFavButtonLoadingState extends ShopHomeState {}

class ChangeFavButtonSuccessState extends ShopHomeState {
  final AddFavModel addFavModel;
  ChangeFavButtonSuccessState(this.addFavModel);
}

class ChangeFavSuccessState extends ShopHomeState {}

class ChangeFavButtonErrorState extends ShopHomeState {}



class ProfileLoadingState extends ShopHomeState {}

class ProfileSuccessState extends ShopHomeState {
  final UserModel userModel;
  ProfileSuccessState(this.userModel);
}

class ProfileErrorState extends ShopHomeState {}

class UpdateDataLoadingState extends ShopHomeState {}

class UpdateDataSuccessState extends ShopHomeState {}

class UpdateDataErrorState extends ShopHomeState {}


class SearchLoadingState extends ShopHomeState {}

class SearchSuccessState extends ShopHomeState {}

class SearchErrorState extends ShopHomeState {}

class GetProductDetailsLoadingState extends ShopHomeState {}

class GetProductDetailsSuccessState extends ShopHomeState {}

class GetProductDetailsErrorState extends ShopHomeState {}
