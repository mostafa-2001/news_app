import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/layout/news_app.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cachehelper.dart';
import 'package:news_app/shared/network/remoto/dio_helper.dart';
import 'package:news_app/shared/style/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  Diohleper.init();
  await cacheHelper.initi();
  bool? mode = cacheHelper.Getboolean(key: 'isdark');
  runApp(MyApp(
    mode: mode,
  ));
}

class MyApp extends StatelessWidget {
  final bool? mode;

  MyApp({this.mode});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => APP_cubit()
        ..Getnews()
        ..changeAppMode(fromShared: mode),
      child: BlocConsumer<APP_cubit, states>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              appBarTheme: AppBarTheme(
                  color: Colors.white,
                  elevation: 0,
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark),
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  toolbarTextStyle: TextStyle(backgroundColor: Colors.black),
                  iconTheme: IconThemeData(color: Colors.black)),
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.white,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  elevation: 0),
              scaffoldBackgroundColor: Colors.white,
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              appBarTheme: AppBarTheme(
                  backgroundColor: HexColor('403E3E'),
                  elevation: 0,
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('403E3E'),
                      statusBarIconBrightness: Brightness.light),
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  toolbarTextStyle: TextStyle(
                    backgroundColor: HexColor('403E3E'),
                  ),
                  iconTheme: IconThemeData(color: Colors.white)),
              iconTheme: IconThemeData(color: Colors.white),
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: HexColor('403E3E'),
                  type: BottomNavigationBarType.fixed,
                  unselectedItemColor: Colors.grey,
                  selectedItemColor: Colors.deepOrange,
                  elevation: 0),
              scaffoldBackgroundColor: HexColor('403E3E'),
            ),
            themeMode: APP_cubit.get(context).isdark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: News_app(),
          );
        },
      ),
    );
  }
}
