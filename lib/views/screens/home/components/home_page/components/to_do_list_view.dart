import 'package:bayt_test_app/bloc/to_do_list_bloc/to_do_list_cubit.dart';
import 'package:bayt_test_app/providers/generic_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoListView extends StatefulWidget {
  const ToDoListView({Key? key}) : super(key: key);

  @override
  _ToDoListViewState createState() => _ToDoListViewState();
}

class _ToDoListViewState extends State<ToDoListView> {
  late final ToDoListCubit _toDoListCubit;
  final ScrollController _scrollController = ScrollController();
  bool _loading = false;

  @override
  void initState() {
    _toDoListCubit = context.read<GenericProvider>().toDoListCubit;
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
      _toDoListCubit.getTodos().then((_) => setState(() {
            _loading = false;
          }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoListCubit, ToDoListState>(
      bloc: _toDoListCubit..getTodos(),
      builder: (context, state) {
        print('to do list view state has changed');
        if (state is ToDoListInitialLoading) {
          return const Center(
            child: SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        } else if (state is ToDoListFailure) {
          return Center(
            child: Text('error: ${state.errorMessage}'),
          );
        } else if (state is ToDoListSuccess) {
          return Stack(
            children: [
              SingleChildScrollView(
                controller: _scrollController,
                child: ListView.builder(
                  itemCount: _toDoListCubit.todos.length,
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
                              _toDoListCubit.todos[index].id.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              _toDoListCubit.todos[index].title,
                            ),
                            Text(
                              _toDoListCubit.todos[index].completed.toString(),
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
