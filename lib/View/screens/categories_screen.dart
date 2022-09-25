import 'package:bego_market/Model/home/categories_model.dart';
import 'package:bego_market/Model/home/home_model.dart';
import 'package:bego_market/View%20Model/home_bloc/cubit.dart';
import 'package:bego_market/View%20Model/home_bloc/state.dart';
import 'package:bego_market/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopHomeCubit, ShopHomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        print(ShopHomeCubit.get(context).categoriesModel.data.data.length);
        return Container(
          height: double.infinity,
          child: ListView.builder(
              itemCount: ShopHomeCubit.get(context).categoriesModel.data.data.length,
              itemBuilder: (context, index) => buildCategoryItem(
                  categoriesModel: ShopHomeCubit.get(context).categoriesModel,
                  i: index)
          ),
        );
      },
    );
  }

  buildCategoryItem({CategoriesModel categoriesModel, int i}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  categoriesModel.data.data[i].image,
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
                Text(categoriesModel.data.data[i].name,style: textStyle(
                    fontSize: 20,
                    color: Colors.black
                ),),
                Icon(Icons.eleven_mp,size: 20,color: Colors.grey.shade500,)
              ],
            ),
            const Divider(),
          ],
        )
      ),
    );
  }
}
