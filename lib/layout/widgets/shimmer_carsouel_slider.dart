import 'package:app_news/layout/shared/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCarsouelSlider extends StatelessWidget {
  const ShimmerCarsouelSlider({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Shimmer.fromColors(
      baseColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.white10
          : Colors.grey.shade300,
      highlightColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.white24
          : Colors.grey.shade100,
      child: CarouselSlider(
        items: [
          Container(
            width: width,
            height: height * 0.25,
            decoration: BoxDecoration(
              color: AppColors.softWhite,
              borderRadius: BorderRadius.circular(
                width * 0.05,
              ),
            ),
          ),
          Container(
            width: width,
            height: height * 0.25,
            decoration: BoxDecoration(
              color: AppColors.softWhite,
              borderRadius: BorderRadius.circular(
                width * 0.05,
              ),
            ),
          ),
          Container(
            width: width,
            height: height / 3,
            decoration: BoxDecoration(
              color: AppColors.softWhite,
              borderRadius: BorderRadius.circular(
                width * 0.05,
              ),
            ),
          ),
        ],
        options: CarouselOptions(
          height: height * 0.25,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
          viewportFraction: 0.9,
        ),
      ),
    );
  }
}
