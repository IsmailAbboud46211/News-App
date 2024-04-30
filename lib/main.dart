import 'package:app_news/data/dio_helper.dart';
import 'package:app_news/layout/screens/splash_screen.dart';
import 'package:app_news/layout/shared/colors.dart';
import 'package:app_news/logic/cubit/app_cubit.dart';
import 'package:app_news/logic/cubit/app_state.dart';
import 'package:app_news/logic/cubit/internet_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

const String themeBoxName = "settings";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //init the connection with api
  DioHelper.init();
  final documents = await getApplicationDocumentsDirectory();
  Hive.init(documents.path);
  await Hive.initFlutter();
  await Hive.openBox("settings");
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
            ..getBuisnessArticles()
            ..getHealthArticles()
            ..getScienceArticles()
            ..getSportsArticles()
            ..getTechnologyArticles(),
        ),
        BlocProvider(
          create: (context) => InternetCubit()..checkConnection(),
        )
      ],
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          return ValueListenableBuilder(
            valueListenable: Hive.box("settings").listenable(),
            builder: ((BuildContext context, Box box, Widget? child) {
              final isDarkMode = box.get(
                "isDarkMode",
                defaultValue: false,
              );
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'News app',
                theme: isDarkMode
                    ? ThemeData.dark(useMaterial3: true).copyWith(
                        appBarTheme: AppBarTheme(
                          titleSpacing: 20.0,
                          toolbarHeight: 75.0,
                          backgroundColor: AppColors.drak,
                          iconTheme: const IconThemeData(color: Colors.white),
                          elevation: 0.0,
                          titleTextStyle: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                          systemOverlayStyle: SystemUiOverlayStyle(
                            statusBarBrightness: Brightness.dark,
                            statusBarColor: AppColors.deepBlue,
                          ),
                        ),
                        scaffoldBackgroundColor: AppColors.drak,
                        colorScheme: ColorScheme.dark(
                          primary: AppColors.deepBlue,
                        ),
                      )
                    : ThemeData.light(useMaterial3: true).copyWith(
                        appBarTheme: AppBarTheme(
                          titleSpacing: 20.0,
                          toolbarHeight: 75.0,
                          backgroundColor: AppColors.snow,
                          iconTheme: const IconThemeData(
                            color: Colors.black,
                          ),
                          elevation: 0.0,
                          titleTextStyle: const TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                          systemOverlayStyle: SystemUiOverlayStyle(
                            statusBarBrightness: Brightness.dark,
                            statusBarColor: AppColors.babyBlue,
                          ),
                        ),
                        scaffoldBackgroundColor: AppColors.snow,
                        colorScheme: ColorScheme.light(
                          primary: AppColors.deepBlue,
                        ),
                      ),
                home: const CustomSplashScreen(),
              );
            }),
          );
        },
      ),
    );
  }
}
