import 'package:bayt_test_app/bloc/home_page_bloc/home_page_cubit.dart';
import 'package:bayt_test_app/models/to_do.dart';
import 'package:bayt_test_app/views/common_widgets/feedback_widgets.dart';
import 'package:bayt_test_app/views/common_widgets/feedback_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoListView extends StatefulWidget {
  const ToDoListView({Key? key}) : super(key: key);

  @override
  _ToDoListViewState createState() => _ToDoListViewState();
}

class _ToDoListViewState extends State<ToDoListView> {
  final HomePageCubit _homePageCubit = HomePageCubit();
  final ScrollController _scrollController = ScrollController();
  bool _loading = false;

  @override
  void initState() {
    _scrollController.addListener(_onScrollEnd);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScrollEnd() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      setState(() {
        _loading = true;
      });
      _homePageCubit.getTodos().then((_) => setState(() {
            _loading = false;
          }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      bloc: _homePageCubit..getTodos(),
      builder: (context, state) {
        if (state is HomePageInitialLoading) {
          return const Center(
            child: SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        } else if (state is HomePageFailure) {
          return Center(
            child: Text('error: ${state.errorMessage}'),
          );
        } else if (state is HomePageSuccess) {
          return Stack(
            children: [
              SingleChildScrollView(
                controller: _scrollController,
                child: ListView.builder(
                  itemCount: _homePageCubit.todos.length,
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
                            Text(
                              _homePageCubit.todos[index].id.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              _homePageCubit.todos[index].title,
                            ),
                            Text(
                              _homePageCubit.todos[index].completed.toString(),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              if(_loading) const Positioned(
                left: 0,
                right: 0,
                bottom: 10,
                child: Center(
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator.adaptive(),
                  ),
                ),
              )
            ],
          );
        } else {
          return const Center(
            child: Text('please wait}'),
          );
        }
      },
    );
  }
}
