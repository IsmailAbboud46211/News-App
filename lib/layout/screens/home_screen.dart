import 'package:app_news/layout/screens/search_screen.dart';
import 'package:app_news/layout/shared/colors.dart';
import 'package:app_news/layout/widgets/custom_drawer.dart';
import 'package:app_news/logic/cubit/app_cubit.dart';
import 'package:app_news/logic/cubit/app_state.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.sizeOf(context).height;
    var cubit = NewsCubit.get(context);
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        return ClipRect(
          child: SafeArea(
            top: false,
            child: Scaffold(
              extendBody: true,
              appBar: AppBar(
                iconTheme: IconThemeData(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.deepBlue
                      : AppColors.softLightBlue,
                ),
                title: const Text(
                  "News App",
                  style: TextStyle(
                    fontFamily: 'javanese-text',
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      cubit.clearSearchArticlesList();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SearchScreen(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.search,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.deepBlue
                          : AppColors.softLightBlue,
                    ),
                  )
                ],
              ),
              drawer: customDrawer(context: context, height: hight),
              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar: CurvedNavigationBar(
                index: cubit.currentIndex,
                color: AppColors.deepBlue,
                height: hight * 0.1,
                backgroundColor: Colors.transparent,
                buttonBackgroundColor: AppColors.babyBlue,
                animationDuration: const Duration(milliseconds: 300),
                items: cubit.items,
                onTap: (index) => cubit.changeIndex(index),
              ),
            ),
          ),
        );
      },
    );
  }
}
