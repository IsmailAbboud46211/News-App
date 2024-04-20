import 'package:app_news/layout/widgets/carosuel_slider.dart';
import 'package:app_news/layout/widgets/shimmer_carsouel_slider.dart';
import 'package:app_news/logic/cubit/internet_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget buildCarsouelCondtionalBuilder(
        {required List articlesList, required width, required height}) =>
    ConditionalBuilder(
      condition: articlesList.isNotEmpty,
      builder: (context) => buildCarouselSlider(
        width: width,
        height: height,
        articlesList: articlesList,
      ),
      fallback: (context) => BlocBuilder<InternetCubit, InternetState>(
        builder: (context, state) {
          if (state is InternetConnected) {
            return const ShimmerCarsouelSlider();
          }
          return const Center(
            child: SizedBox(),
          );
        },
      ),
    );
