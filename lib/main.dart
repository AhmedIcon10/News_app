import 'package:api_test/layout/news_app/cubit/news_cubit.dart';
import 'package:api_test/shared/network/local/cache_helper.dart';
import 'package:api_test/shared/network/remote/dio_helper.dart';
import 'package:api_test/utils/apptheme.dart';
import 'package:api_test/utils/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout/news_app/cubit/news_states.dart';
import 'layout/news_app/news_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool isDark = CacheHelper.getData(key: 'isDark')?? false;
  BlocOverrides.runZoned(
    () {
      runApp(MyApp(
        isDark: isDark,
      ));
      // Use cubits...
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  const MyApp({Key? key, this.isDark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..changeAppMode(fromShared: isDark),
      child: BlocConsumer<NewsCubit, NewsAppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: appLightTheme,
            darkTheme: appDarkTheme,
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}
