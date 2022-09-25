import 'package:bego_market/Model/home/search_model.dart';
import 'package:bego_market/View%20Model/home_bloc/cubit.dart';
import 'package:bego_market/View%20Model/home_bloc/state.dart';
import 'package:bego_market/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopHomeCubit(),
      child: BlocConsumer<ShopHomeCubit, ShopHomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 450,
                      child: textFormField(
                        // ignore: missing_return
                          onChanged: (String text) {
                            ShopHomeCubit.get(context).searchData(text: text);
                          },
                          icon: Icons.search,
                          textInputType:TextInputType.text,
                          controller: searchController,
                          hintText: 'Search Here !',
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'Enter Text To Search It !';
                            } else {
                              return null;
                            }
                          },
                          color: Colors.grey),
                    ),
                  ),
                ),
                if (state is SearchLoadingState)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                const SizedBox(height: 10,),
                if(state is SearchSuccessState)
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                        itemCount:
                        ShopHomeCubit.get(context).searchModel.data.data.length,
                        itemBuilder: (context, i) {
                          return buildSearchItem(
                              model: ShopHomeCubit.get(context).searchModel.data, index: i);
                        }),
                  )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildSearchItem({DataSearchModel model, int index}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            width: 1.0,
            color: Colors.grey
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Expanded(
               child: SizedBox(
                  height: 110,
                  width: 110,
                  child: Image.network(model.data[index].image,width: 100,height: 100,)),
             ),
             Expanded(
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text(model.data[index].name,
                   maxLines: 2,
                   overflow: TextOverflow.ellipsis,
                   textAlign: TextAlign.center,
                   style: textStyle(
                  color: Colors.black,
                  fontSize: 12.0
            ),),
               ),
             )
          ],
        ),
      ),
    );
  }
}
