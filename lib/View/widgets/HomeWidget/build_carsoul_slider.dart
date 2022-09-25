import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildCarouselSlider({  List<Widget> items}) {
  return CarouselSlider(
    items: items,
    options: CarouselOptions(
      height: 250,
      viewportFraction:1.0,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval:const Duration(seconds: 3),
      autoPlayAnimationDuration:const Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
//      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
    ),
  );

}