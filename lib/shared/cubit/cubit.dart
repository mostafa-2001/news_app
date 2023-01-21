import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business/business.dart';
import 'package:news_app/modules/science/science.dart';
import 'package:news_app/modules/sports/sports.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cachehelper.dart';
import 'package:news_app/shared/network/remoto/dio_helper.dart';

class APP_cubit extends Cubit<states> {
  APP_cubit() : super(initalstate());

  static APP_cubit get(context) => BlocProvider.of(context);
  List<Widget> screens = [
    business_screen(),
    sports_screen(),
    science_screen(),
  ];
  int current_index = 0;

  void changescreen(int index) {
    current_index = index;
    if (index == 1) Getsports();
    if (index == 2) Getscience();
    emit(bottomnavigetor());
  }

  List<dynamic> business = [];
  List<dynamic> bus = [];
  void Getnews() {
    emit(getloadingbusiness());
    Diohleper.getdata(url: 'v2/top-headlines', querys: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '4d813b70a0074560ab613dd7100646ba'
    }).then((value) {
      bus = [];
      bus = value.data['articles'];
      for (int i = 0; i < bus.length; i++) {
        if (bus[i]['urlToImage'] == null) {
          bus[i]['urlToImage'] =
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWzbCd99apcPV1Ih-h56s9AVnzE2JADOmF0w&usqp=CAU';
        }
      }
      business = bus;
      emit(getbusiness());
    }).catchError((error) {
      print(error.toString());
      emit(geterrorbusiness(error));
    });
  }

  List<dynamic> sports = [];
  List<dynamic> bus1 = [];
  void Getsports() {
    if (sports.length == 0) {
      emit(getloadingsports());
      Diohleper.getdata(url: 'v2/top-headlines', querys: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '4d813b70a0074560ab613dd7100646ba'
      }).then((value) {
        bus1 = [];
        bus1 = value.data['articles'];
        for (int i = 0; i < bus1.length; i++) {
          if (bus1[i]['urlToImage'] == null) {
            bus1[i]['urlToImage'] =
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWzbCd99apcPV1Ih-h56s9AVnzE2JADOmF0w&usqp=CAU';
          }
        }
        sports = bus1;
        print(sports[0]['title']);
        emit(getsports());
      }).catchError((error) {
        print(error.toString());
        emit(geterrorsports(error));
      });
    } else {
      emit(getsports());
    }
  }

  List<dynamic> science = [];
  List<dynamic> bus2 = [];
  void Getscience() {
    if (science.length == 0) {
      emit(getloadingscience());
      Diohleper.getdata(url: 'v2/top-headlines', querys: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '4d813b70a0074560ab613dd7100646ba'
      }).then((value) {
        bus2 = value.data['articles'];
        for (int i = 0; i < bus2.length; i++) {
          if (bus2[i]['urlToImage'] == null) {
            bus2[i]['urlToImage'] =
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWzbCd99apcPV1Ih-h56s9AVnzE2JADOmF0w&usqp=CAU';
          }
        }
        science = bus2;
        emit(getscience());
      }).catchError((error) {
        print(error.toString());
        emit(geterrorscience(error));
      });
    } else {
      emit(getscience());
    }
  }

  List<dynamic> search = [];
  List<dynamic> bus3 = [];
  void Getsearch(String value) {
    search = [];
    bus3 = [];
    emit(getloadingsearch());
    Diohleper.getdata(url: 'v2/everything', querys: {
      'q': '$value',
      'apiKey': '4d813b70a0074560ab613dd7100646ba'
    }).then((value) {
      bus3 = value.data['articles'];
      for (int i = 0; i < bus1.length; i++) {
        if (bus3[i]['urlToImage'] == null) {
          bus3[i]['urlToImage'] =
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWzbCd99apcPV1Ih-h56s9AVnzE2JADOmF0w&usqp=CAU';
        }
      }
      search = bus3;
      emit(getsearch());
    }).catchError((error) {
      print(error.toString());
      emit(geterrorsearch(error));
    });
  }

   bool isdark = true;
  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isdark = fromShared;
      emit(chancemodeapp());
    } else {
      isdark = !isdark;
      cacheHelper.Putboolean(key: 'isdark', value: isdark).then((value) {
        emit(chancemodeapp());
      });
    }
  }
}
