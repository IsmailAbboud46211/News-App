import 'package:app_news/data/dio_helper.dart';
import 'package:app_news/layout/shared/colors.dart';
import 'package:app_news/logic/cubit/app_state.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_news/layout/screens/screens.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  int currentIndex = 0;
  bool isDarkMode = false;
  List<dynamic> businessArticles = [];
  List<dynamic> sportArticles = [];
  List<dynamic> scienceArticles = [];
  List<dynamic> technologyArticles = [];
  List<dynamic> healthArticles = [];
  List<dynamic> searchArticles = [];

  //self call
  static NewsCubit get(context) => BlocProvider.of(context);

  void changeIndex(var index) {
    currentIndex = index;
    emit(NewsBottomNavState());
  }

  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
    const TechnologyScreen(),
    const HealthScreen(),
  ];
  List<CurvedNavigationBarItem> items = [
    CurvedNavigationBarItem(
      child: Icon(
        Icons.business_center,
        color: AppColors.iceBlue,
      ),
      label: "Business",
      labelStyle: TextStyle(
        color: AppColors.iceBlue,
        fontFamily: 'javanese-text',
      ),
    ),
    CurvedNavigationBarItem(
      child: Icon(
        Icons.sports_baseball_sharp,
        color: AppColors.iceBlue,
      ),
      label: "Sports",
      labelStyle: TextStyle(
        color: AppColors.iceBlue,
        fontFamily: 'javanese-text',
      ),
    ),
    CurvedNavigationBarItem(
      child: Icon(
        Icons.science,
        color: AppColors.iceBlue,
      ),
      label: "Science",
      labelStyle: TextStyle(
        color: AppColors.iceBlue,
        fontFamily: 'javanese-text',
      ),
    ),
    CurvedNavigationBarItem(
      child: Icon(
        Icons.laptop,
        color: AppColors.iceBlue,
      ),
      label: "Technology",
      labelStyle: TextStyle(
        color: AppColors.iceBlue,
        fontFamily: 'javanese-text',
      ),
    ),
    CurvedNavigationBarItem(
      child: Icon(
        Icons.medical_services_outlined,
        color: AppColors.iceBlue,
      ),
      label: "Health",
      labelStyle: TextStyle(
        color: AppColors.iceBlue,
        fontFamily: 'javanese-text',
      ),
    ),
  ];

//filter the articles list from  the removed articles
  List<dynamic> filterRemovedArticles(List<dynamic> articleslist) {
    List<dynamic> temp = articleslist;
    for (var i = 0; i < temp.length; i++) {
      if (temp[i]['title'] == "[Removed]") {
        temp.removeAt(i);
      }
    }
    return temp;
  }

  void getBuisnessArticles() {
    emit(NewsBuisnessLodingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'business',
      'apiKey': '6d37eeb2eaed483e85db4153d7de8ea5',
    }).then((value) {
      businessArticles = filterRemovedArticles(value.data['articles']);
      emit(NewsBuisnessSuccessState());
    }).catchError((error) {
      emit(NewsBuisnessFailedState());
    });
  }

  void getSportsArticles() {
    emit(NewsSportLodingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'sports',
      'apiKey': '6d37eeb2eaed483e85db4153d7de8ea5',
    }).then((value) {
      sportArticles = filterRemovedArticles(value.data['articles']);
      emit(NewsSportSuccessState());
    }).catchError((error) {
      emit(NewsSportFailedState());
    });
  }

  void getScienceArticles() {
    emit(NewsScienceLodingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'science',
      'apiKey': '6d37eeb2eaed483e85db4153d7de8ea5',
    }).then((value) {
      scienceArticles = filterRemovedArticles(value.data['articles']);
      emit(NewsScienceSuccessState());
    }).catchError((error) {
      emit(NewsScienceFailedState());
    });
  }

  void getTechnologyArticles() {
    emit(NewsTechnologyLodingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'technology',
      'apiKey': '6d37eeb2eaed483e85db4153d7de8ea5',
    }).then((value) {
      technologyArticles = filterRemovedArticles(value.data['articles']);
      emit(NewsTechnologySuccessState());
    }).catchError((error) {
      emit(NewsTechnologyFailedState());
    });
  }

  void getHealthArticles() {
    emit(NewsHealthLodingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'health',
      'apiKey': '6d37eeb2eaed483e85db4153d7de8ea5',
    }).then((value) {
      healthArticles = filterRemovedArticles(value.data['articles']);
      emit(NewsHealthSuccessState());
    }).catchError((error) {
      emit(NewsSportFailedState());
    });
  }

  void getSearchArticles({required searchItem}) {
    emit(NewsSearchLodingState());
    clearSearchArticlesList();
    DioHelper.getData(url: 'v2/everything', query: {
      'q': '$searchItem',
      'apiKey': '6d37eeb2eaed483e85db4153d7de8ea5',
    }).then((value) {
      searchArticles = filterRemovedArticles(value.data['articles']);

      emit(NewsSearchSuccessState());
    }).catchError((error) {
      emit(NewsSearchFailedState());
    });
  }

  clearSearchArticlesList() => searchArticles.clear();
}
