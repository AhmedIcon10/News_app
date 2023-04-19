// ignore_for_file: avoid_print

import 'package:api_test/layout/news_app/cubit/news_cubit.dart';
import 'package:api_test/modules/search_screen/search_screen.dart';
import 'package:api_test/shared/Widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/news_states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NewsCubit()..getBusiness(),
        child: BlocConsumer<NewsCubit, NewsAppState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = NewsCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: const Text('News'),
                actions: [
                  IconButton(
                      onPressed: () {
                        navigateTo(context, SearchScreen());
                      },
                      icon: const Icon(Icons.search)),
                  IconButton(
                    icon: const Icon(Icons.brightness_4_outlined),
                    onPressed: () {
                      cubit.changeAppMode();
                    },
                  ),
                ],
              ),
              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                  items: cubit.bottomItems,
                  currentIndex: cubit.currentIndex,
                  onTap: (index) {
                    cubit.changeBottomItems(index);
                  }),
            );
          },
        ));
  }
}
