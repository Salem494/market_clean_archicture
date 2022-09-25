import 'package:bego_market/Model/home/categories_model.dart';
import 'package:bego_market/constant.dart';
import 'package:flutter/material.dart';

class buildCategoriesHomeItem extends StatelessWidget {
  Data model;
  buildCategoriesHomeItem({this.model});
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left:8,right: 8,top: 8,bottom: 8),
      child: ListView.builder(
        scrollDirection:Axis.horizontal,
          itemCount: model.data.length,
          itemBuilder:(context,index)=>Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
               child: Container(
                 height: 100,
                 width: 100,
                 child: Image.network(model.data[index].image),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(15.0),
                 ),
               ),
             ),
              Text(model.data[index].name,
                style: textStyle(
                    fontSize: 18,
                    color: Colors.black
                ),
              )
            ],
          )
      ),
    );
  }
}
