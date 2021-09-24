import 'package:bayt_test_app/bloc/home_page_bloc/home_page_cubit.dart';
import 'package:bayt_test_app/helpers/size_config.dart';
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
            const SizedBox(height: 30,),
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
                } else

                if (state is HomePageFailure){
                  return Center(child: Text('error: ${state.errorMessage}'),);
                } else if (state is HomePageSuccess) {
                  return const Center(child: Text('success}'),);
                } else {
                  return const Center(child: Text('please wait}'),);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
