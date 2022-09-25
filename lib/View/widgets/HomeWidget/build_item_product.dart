//import 'package:bego_market/Model/home/home_model.dart';
//import 'package:bego_market/View%20Model/home_bloc/cubit.dart';
//import 'package:bego_market/View%20Model/home_bloc/state.dart';
//import 'package:bego_market/View/screens/favourite_screen.dart';
//import 'package:bego_market/constant.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//
//class buildItemProduct extends StatelessWidget {
//  final HomeModel model;
//  final int index;
//
//  buildItemProduct({this.model, this.index});
//
//  @override
//  Widget build(BuildContext context) {
//    return BlocConsumer<ShopHomeCubit, ShopHomeState>(
//        listener: (context, state) {},
//        builder: (context, state) {
//          return Container(
//            color: Colors.white,
//            child: Column(
//              mainAxisAlignment: MainAxisAlignment.start,
//              children: [
//                Stack(
//                  children: [
//                    Image(
//                      image: NetworkImage(
//                          model.data.products[index].image),
//                      width: double.infinity,
//                      height: 200.0,
//                    ),
//                    if (model.data.products[index].discount != 0)
//                      Container(
//                        color: Colors.red,
//                        child: Text(
//                          "%" +
//                              model.data.products[index].discount.toString(),
//                          style: textStyle(color: Colors.white, fontSize: 20),
//                        ),
//                      )
//                  ],
//                ),
//                Padding(
//                  padding: const EdgeInsets.all(10.0),
//                  child: Column(
//                    children: [
//                      Text(
//                        model.data.products[index].name,
//                        overflow: TextOverflow.ellipsis,
//                        maxLines: 2,
//                        style: TextStyle(fontSize: 18.0, height: 1.2),
//                      ),
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: [
//                          Text(
//                            model.data.products[index].price.toString(),
//                            style: textStyle(
//                                fontSize: 15, color: Colors.blueAccent),
//                          ),
//                          SizedBox(
//                            width: 15,
//                          ),
//                          if (model.data.products[index].oldPrice !=
//                              model.data.products[index].price)
//                            Text(
//                              model.data.products[index].oldPrice
//                                  .toString(),
//                              style: const TextStyle(
//                                  decoration: TextDecoration.lineThrough,
//                                  fontSize: 13,
//                                  fontWeight: FontWeight.w500),
//                            ),
//                          Spacer(),
//                          InkWell(
//                              onTap: () {
//                                ShopHomeCubit.get(context)
//                                    .changeFavouriteButton(
//                                        model.data.products[index].id);
////                                showToast(
////                                    text: ShopHomeCubit.get(context).favModel.message,
////                                    color: ToastColors.SUCCESS);
//                                print(model.data.products[index].id);
//                                print(ShopHomeCubit.get(context).favModel.message);
//                              },
//                              child: CircleAvatar(
//                                  radius: 18.0,
//                                  backgroundColor:
//                                      ShopHomeCubit.get(context).isFavourite[
//                                              model.data.products[index].id]
//                                          ? Colors.red
//                                          : Colors.grey,
//                                  child: Icon(
//                                    Icons.favorite_border,
//                                    color: Colors.white,
//                                  )))
//                        ],
//                      )
//                    ],
//                  ),
//                )
//              ],
//            ),
//          );
//        });
//  }
//}
