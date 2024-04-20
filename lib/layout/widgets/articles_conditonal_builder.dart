import 'package:app_news/layout/screens/screens.dart';
import 'package:app_news/layout/widgets/article_item.dart';
import 'package:app_news/layout/widgets/custom_divider.dart';
import 'package:app_news/layout/widgets/no_internert_widget.dart';
import 'package:app_news/logic/cubit/internet_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget articalesCondtionalBuilder({required List articlesList}) =>
    ConditionalBuilder(
      condition: articlesList.isNotEmpty,
      builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => articleItem(
          article: articlesList[index],
          context: context,
        ),
        separatorBuilder: (context, index) => customDivider(),
        itemCount: articlesList.length,
      ),
      fallback: (context) => BlocBuilder<InternetCubit, InternetState>(
        builder: (context, state) {
          if (state is InternetConnected) {
            return const ShimmerArticalesWidet();
          }
          return const Center(
            child: NoInternet(),
          );
        },
      ),
    );
