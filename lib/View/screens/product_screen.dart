import 'package:bego_market/Model/home/categories_model.dart';
import 'package:bego_market/Model/home/home_model.dart';
import 'package:bego_market/View%20Model/home_bloc/cubit.dart';
import 'package:bego_market/View%20Model/home_bloc/state.dart';
import 'package:bego_market/View/screens/product_details_screen.dart';
import 'package:bego_market/View/widgets/HomeWidget/build_carsoul_slider.dart';
import 'package:bego_market/View/widgets/HomeWidget/build_categories_home_item.dart';
import 'package:bego_market/View/widgets/HomeWidget/build_item_product.dart';
import 'package:bego_market/constant.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  final List imgs = [
    'assets/img/onboarding1.jpg',
    'assets/img/onboarding2.jpg',
    'assets/img/onboarding2.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopHomeCubit, ShopHomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        ShopHomeCubit cubit = ShopHomeCubit.get(context);
        // ignore: avoid_print
        print("First In Screen !!!");
        return ConditionalBuilder(
          condition: cubit.model != null && cubit.categoriesModel != null,
          builder: (context) => Scaffold(
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildCarouselSlider(
                      items: cubit.model.data.banners.map((e) {
                    return Image.network(
                      e.image,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    );
                  }).toList()),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Categories",
                        style: textStyle(color: Colors.black, fontSize: 25),
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    child: buildCategoriesHomeItem(
                      model: cubit.categoriesModel.data,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "New Product",
                        style: textStyle(color: Colors.black, fontSize: 25),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.grey.shade300,
                    child: GridView.count(
                      crossAxisCount: 2,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisSpacing: 2.0,
                      mainAxisSpacing: 2.0,
                      childAspectRatio: 1 / 1.55,
                      children: List.generate(
                          cubit.model.data.products.length,
                          (index) => InkWell(
                            onTap: (){
                              print("DOOOONE");
                              NavigateTo(widget:ProductDetailsScreen(model: cubit.model,index: index,) ,context: context);
                            },
                            child: buildItemProduct(
                                  cubit.model,
                                  index,
                                ),
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget buildItemProduct(HomeModel model, int index) {
    return BlocConsumer<ShopHomeCubit, ShopHomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image(
                      image: NetworkImage(model.data.products[index].image),
                      width: double.infinity,
                      height: 200.0,
                    ),
                    if (model.data.products[index].discount != 0)
                      Container(
                        color: Colors.red,
                        child: Text(
                          "%" + model.data.products[index].discount.toString(),
                          style: textStyle(color: Colors.white, fontSize: 20),
                        ),
                      )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        model.data.products[index].name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(fontSize: 18.0, height: 1.2),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            model.data.products[index].price.toString(),
                            style: textStyle(
                                fontSize: 15, color: Colors.blueAccent),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          if (model.data.products[index].oldPrice !=
                              model.data.products[index].price)
                            Text(
                              model.data.products[index].oldPrice.toString(),
                              style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          Spacer(),
                          InkWell(
                              onTap: () {
//                                ShopHomeCubit.get(context)
//                                    .changeFavouriteButton(
//                                        model.data.products[index].id);
//                                showToast(
//                                    text: ShopHomeCubit.get(context).favModel.message,
//                                    color: ToastColors.SUCCESS);
                                print(model.data.products[index].id);
                                print(model.data.products[index].oldPrice);
                                print(ShopHomeCubit.get(context)
                                    .favModel.status);
                              },
                              child: CircleAvatar(
                                  radius: 18.0,
                                  backgroundColor:
                                      ShopHomeCubit.get(context).isFavourite[
                                              model.data.products[index].id]
                                          ? Colors.red
                                          : Colors.grey,
                                  child: Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                  )))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
