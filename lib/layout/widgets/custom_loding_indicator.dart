import 'package:app_news/layout/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

Widget customLodingIndicator({required height, required width}) => Center(
      child: Column(
        children: [
          SizedBox(
            height: height * 0.25,
          ),
          Center(
            child: SizedBox(
              width: width * 0.2,
              height: height * 0.05,
              child: LoadingIndicator(
                indicatorType: Indicator.lineScale,
                colors: [
                  AppColors.deepBlue,
                  AppColors.softLightBlue,
                  AppColors.babyBlue,
                  AppColors.softWhite,
                  AppColors.lightBlue,
                ],
                strokeWidth: 2,
              ),
            ),
          ),
        ],
      ),
    );
