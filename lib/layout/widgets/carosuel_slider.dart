import 'package:app_news/layout/widgets/custom_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget buildCarouselSlider(
        {required width, required height, required List articlesList}) =>
    CarouselSlider(
      items: articlesList
          .map(
            (e) => CustomCard(
              width: width,
              height: height,
              imageUrl: e["urlToImage"],
              title: e["title"],
              publishedAt: e["publishedAt"],
              url: e["url"],
            ),
          )
          .toList(),
      options: CarouselOptions(
        height: height * 0.25,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(seconds: 1),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
        viewportFraction: 0.9,
      ),
    );
