import 'package:app_news/layout/shared/colors.dart';
import 'package:app_news/layout/shared/validation_funcations.dart';
import 'package:app_news/layout/widgets/article_item.dart';
import 'package:app_news/layout/widgets/custom_divider.dart';
import 'package:app_news/layout/widgets/custom_loding_indicator.dart';
import 'package:app_news/layout/widgets/empty_search_widget.dart';
import 'package:app_news/layout/widgets/error_widget.dart';
import 'package:app_news/layout/widgets/no_internert_widget.dart';
import 'package:app_news/logic/cubit/app_cubit.dart';
import 'package:app_news/logic/cubit/app_state.dart';

import 'package:app_news/logic/cubit/internet_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.deepBlue,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(
          width * 0.02,
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            TextFormField(
              controller: searchController,
              cursorColor: AppColors.softLightBlue,
              style: TextStyle(
                color: AppColors.grey,
              ),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                focusColor: AppColors.deepBlue,
                fillColor: AppColors.deepBlue,
                hoverColor: AppColors.deepBlue,
                labelText: "Search",
                labelStyle: TextStyle(
                  color: AppColors.deepBlue,
                  fontFamily: 'javanese-text',
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.deepBlue,
                ),
              ),
              onChanged: (value) =>
                  NewsCubit.get(context).getSearchArticles(searchItem: value),
              validator: searchValidation,
            ),
            BlocBuilder<NewsCubit, NewsState>(builder: (context, state) {
              var articlesList = NewsCubit.get(context).searchArticles;
              if (state is NewsSearchFailedState) {
                return errorWidget(height: height, width: width);
              }
              return ConditionalBuilder(
                condition: articlesList.isNotEmpty,
                builder: (context) => SizedBox(
                  height: height,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => articleItem(
                      article: articlesList[index],
                      context: context,
                    ),
                    separatorBuilder: (context, index) => customDivider(),
                    itemCount: articlesList.length,
                  ),
                ),
                fallback: (context) =>
                    BlocBuilder<InternetCubit, InternetState>(
                  builder: (context, state) {
                    if (state is InternetDisconnected) {
                      return const NoInternet();
                    }
                    return Center(
                      child: searchController.text.isEmpty
                          ? emptySearchWidget(height: height, width: width)
                          : customLodingIndicator(height: height, width: width),
                    );
                  },
                ),
              );
            }),
          ]),
        ),
      ),
    );
  }
}
