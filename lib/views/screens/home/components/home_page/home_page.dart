import 'package:bayt_test_app/bloc/to_do_list_bloc/to_do_list_cubit.dart';
import 'package:bayt_test_app/helpers/size_config.dart';
import 'package:bayt_test_app/models/to_do.dart';
import 'package:bayt_test_app/views/screens/home/components/home_page/components/to_do_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: SizeConfig.screenWidth,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'JSONPlaceholder Todos',
            style: TextStyle(
              fontSize: SizeConfig.textSizeSubHeading,
            ),
          ),
          const Expanded(
            child: ToDoListView(),
          ),
        ],
      ),
    );
  }
}
