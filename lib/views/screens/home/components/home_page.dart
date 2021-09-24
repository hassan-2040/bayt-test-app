import 'package:bayt_test_app/bloc/home_page_bloc/home_page_cubit.dart';
import 'package:bayt_test_app/helpers/size_config.dart';
import 'package:bayt_test_app/models/to_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomePageCubit _homePageCubit = HomePageCubit();

    return SizedBox(
      width: SizeConfig.screenWidth,
      child: SingleChildScrollView(
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
            BlocBuilder<HomePageCubit, HomePageState>(
              bloc: _homePageCubit..getAllTodos(),
              builder: (context, state) {
                if (state is HomePageLoading) {
                  return const CircularProgressIndicator.adaptive();
                } else if (state is HomePageFailure) {
                  return Center(
                    child: Text('error: ${state.errorMessage}'),
                  );
                } else if (state is HomePageSuccess) {
                  final List<ToDo> _todos = state.toDos;
                  return ListView.builder(
                    itemCount: _todos.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 8,
                        ),
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(_todos[index].title,),
                              Text(_todos[index].completed.toString(),),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text('please wait}'),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
