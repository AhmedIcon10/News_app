// ignore_for_file: avoid_print

import 'package:api_test/layout/news_app/screens/business_screen/business_screen.dart';
import 'package:api_test/layout/news_app/screens/science_screen/science_screen.dart';
import 'package:api_test/layout/news_app/screens/sports_screen/sports_screen.dart';
import 'package:api_test/shared/network/local/cache_helper.dart';
import 'package:api_test/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'news_states.dart';

class NewsCubit extends Cubit<NewsAppState> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<String> appBarTitles = [
    'Business Screen',
    'Sports Screen',
    'Science Screen',
    'Settings Screen',
  ];
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon((Icons.business)), label: 'Business'),
    const BottomNavigationBarItem(
        icon: Icon((Icons.sports_esports_outlined)), label: 'Sports'),
    const BottomNavigationBarItem(
        icon: Icon((Icons.science_outlined)), label: 'Science'),
//    const BottomNavigationBarItem(
//         icon: Icon((Icons.settings)),
//         label:'Settings' ),
  ];
  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
//    const SettingsScreen(),
  ];
  changeBottomItems(index) {
    currentIndex = index;
    if (index == 0) {
      getBusiness();
    } else if (index == 1) {
      getSports();
    } else if (index == 2) {
      getScience();
    }
    emit(NewsChangeBottomItemsState());
  }

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  List<dynamic> search = [];
  void getBusiness() {
    emit(NewsBusinessLoadingState());
    if (business.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'business',
          'apiKey': '13365e4851cb4320b7a66229fa7022c8',
        },
      ).then((value) {
        business = value.data['articles'];
        print(value.data['articles']);
        emit(NewsGetBusinessSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetBusinessErrorState(error.toString()));
      });
    } else {
      emit(NewsGetBusinessSuccessState());
    }
  }

  void getSports() {
    emit(NewsSportsLoadingState());
    if (sports.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': '13365e4851cb4320b7a66229fa7022c8',
        },
      ).then((value) {
        sports = value.data['articles'];
        print(value.data['articles']);
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  void getScience() {
    emit(NewsScienceLoadingState());
    if (science.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': '13365e4851cb4320b7a66229fa7022c8',
        },
      ).then((value) {
        science = value.data['articles'];
        print(value.data['articles']);
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  void getSearch(String value) {
    emit(NewsSearchLoadingState());
    search = [];
    if (search.isEmpty) {
      DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q': value,
          'apiKey': '13365e4851cb4320b7a66229fa7022c8',
        },
      ).then((value) {
        search = value.data['articles'];
        print(value.data['articles']);
        emit(NewsGetSearchSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSearchErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSearchSuccessState());
    }
  }

  bool isDark = false;
  void changeAppMode({
    bool? fromShared,
  }) {
    if (fromShared != null) {
      isDark = fromShared;
    } else {
      isDark = !isDark;
      CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
        emit(NewsChangeAppModeState());
      });
    }
  }
}
