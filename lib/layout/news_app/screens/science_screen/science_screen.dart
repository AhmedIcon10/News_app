import 'package:api_test/layout/news_app/cubit/news_cubit.dart';
import 'package:api_test/layout/news_app/cubit/news_states.dart';
import 'package:api_test/shared/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsAppState>(
      listener: (context, state){},
      builder: (context, state){
        var list = NewsCubit.get(context).science;
        return list.isNotEmpty
            ? articleBuilder(list, context)
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
