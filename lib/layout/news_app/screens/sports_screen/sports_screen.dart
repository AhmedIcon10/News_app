import 'package:api_test/layout/news_app/cubit/news_cubit.dart';
import 'package:api_test/layout/news_app/cubit/news_states.dart';
import 'package:api_test/shared/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsAppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).sports;
        return list.isNotEmpty
            ? articleBuilder(list, context)
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
