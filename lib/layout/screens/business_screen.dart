import 'package:app_news/layout/widgets/articles_conditonal_builder.dart';
import 'package:app_news/layout/widgets/carosuel_slider_conditonal_builder.dart';
import 'package:app_news/layout/widgets/error_widget.dart';
import 'package:app_news/logic/cubit/app_cubit.dart';
import 'package:app_news/logic/cubit/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        var articlesList = NewsCubit.get(context).businessArticles;
        var width = MediaQuery.sizeOf(context).width;
        var height = MediaQuery.sizeOf(context).height;
        if (state is NewsBuisnessFailedState) {
          return errorWidget(height: height, width: width);
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              buildCarsouelCondtionalBuilder(
                articlesList: articlesList,
                width: width,
                height: height,
              ),
              articalesCondtionalBuilder(
                articlesList: articlesList,
              ),
            ],
          ),
        );
      },
    );
  }
}
