import 'package:bego_market/Model/home/home_model.dart';
import 'package:bego_market/View%20Model/home_bloc/cubit.dart';
import 'package:bego_market/View%20Model/home_bloc/state.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsScreen extends StatelessWidget {
   final HomeModel model;
    final int index;
   const ProductDetailsScreen({this.model,this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            'معلومات المنتج',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
        ),
        body:Container(
            child: BuildItemDetailsProduct(
                model,
                index,
                context
            )));
  }

  Widget BuildItemDetailsProduct(HomeModel model, int i, context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 15,
        ),
        Image.network(
          model.data.products[i].image,
          fit: BoxFit.cover,
          width: 150,
          height: 150,
        ),
        SizedBox(
          height: 20,
        ),
        new Text(
          model.data.products[i].name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          color: Colors.black87,
          height: 2.0,
        ),
        Text('وصف المنتج',
            textDirection: TextDirection.rtl,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 100,
            width: double.infinity,
            child: Text(
              model.data.products[i].description,
              textDirection: TextDirection.ltr,
            ),
          ),
        ),
        Divider(
          color: Colors.grey.shade800,
          height: 2.0,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15, top: 5),
          child: Container(
            height: 100,
            width: double.infinity,
            child: Text(
              model.data.products[i].description,
              textDirection: TextDirection.rtl,
            ),
          ),
        ),
        Divider(
          color: Colors.grey.shade800,
          height: 2.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 25, left: 25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${model.data.products[i].price} ج.م',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const Text(
                    ':سعر المنتج الواحد',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              height: 2,
              color: Colors.grey.shade800,
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: 250,
              height: 40,
              child: RaisedButton(
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none),
                  onPressed: () {
//                        cart.addProduct(pro);
                    // cart.count;
                    bulidDailog(context);
                  },
                  elevation: 1,
                  color: Colors.grey,
                  child: const Text(
                    'إضافة إلي العربة',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  )),
            )
          ],
        ),
        SizedBox(
          height: 10,
        )
      ],
    ));
  }

  Widget bulidDailog(context) {
    final AlertDialog alert = AlertDialog(
      elevation: 5,
      actions: [
        Row(
          children: [
            FlatButton(
              onPressed: () {
//                Navigator.pushNamed(context, Home.routeName);
              },
              child: Text(
                'متابعة التسوق؟',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(width: 12),
            FlatButton(
              onPressed: () {
//                Navigator.pushNamed(context, ConfirmScreen.routeName);
              },
              child: Text('إتمام عملية الشراء؟',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            ),
          ],
        )
      ],
      backgroundColor: Colors.white,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      title: const Center(
        child: Text(
          'تم إضافة المنتج إلي السلة',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
    );
    showDialog(context: context, builder: (context) => alert);
  }
}
