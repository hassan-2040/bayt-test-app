import 'package:bayt_test_app/bloc/filter_drawer_bloc/filter_drawer_cubit.dart';
import 'package:bayt_test_app/helpers/enums.dart';
import 'package:bayt_test_app/helpers/size_config.dart';
import 'package:bayt_test_app/providers/generic_provider.dart';
import 'package:bayt_test_app/views/common_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';

class FilterDrawer extends StatelessWidget {
  FilterDrawer({Key? key}) : super(key: key);

  final FilterDrawerCubit _filterDrawerCubit = FilterDrawerCubit();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: BlocBuilder<FilterDrawerCubit, FilterDrawerState>(
          bloc: _filterDrawerCubit,
          builder: (context, state) {
            if (state is FilterDrawerSelectedFilters) {
              final _sorted = state.sortById;
              final _status = state.toDoStatus;
              return Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    translate('homeScreen.filterDrawer.sortById.title'),
                    style: TextStyle(
                      fontSize: SizeConfig.textSizeLarge,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      _filterButton(
                        primaryColor: _sorted == SortById.desc
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).primaryColorLight,
                        textColor: _sorted == SortById.desc
                            ? Colors.white
                            : Colors.black,
                        onPress: _sorted == SortById.desc
                            ? () {}
                            : () {
                                _filterDrawerCubit
                                    .updateSortById(SortById.desc);
                              },
                        text: translate('homeScreen.filterDrawer.sortById.descending'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      _filterButton(
                        primaryColor: _sorted == SortById.asc
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).primaryColorLight,
                        textColor: _sorted == SortById.asc
                            ? Colors.white
                            : Colors.black,
                        onPress: _sorted == SortById.asc
                            ? () {}
                            : () {
                                _filterDrawerCubit.updateSortById(SortById.asc);
                              },
                        text: translate('homeScreen.filterDrawer.sortById.ascending'),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 20,
                    ),
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  Text(
            translate('homeScreen.filterDrawer.toDoStatus.title'),
                    style: TextStyle(
                      fontSize: SizeConfig.textSizeLarge,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      _filterButton(
                        primaryColor: _status == ToDoStatus.all
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).primaryColorLight,
                        textColor: _sorted == SortById.desc
                            ? Colors.white
                            : Colors.black,
                        onPress: _status == ToDoStatus.all
                            ? () {}
                            : () {
                                _filterDrawerCubit
                                    .updateToDoStatus(ToDoStatus.all);
                              },
                        text: translate('homeScreen.filterDrawer.toDoStatus.all'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      _filterButton(
                        primaryColor: _status == ToDoStatus.completed
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).primaryColorLight,
                        textColor: _status == ToDoStatus.completed
                            ? Colors.white
                            : Colors.black,
                        onPress: _status == ToDoStatus.completed
                            ? () {}
                            : () {
                                _filterDrawerCubit
                                    .updateToDoStatus(ToDoStatus.completed);
                              },
                        text: translate('homeScreen.filterDrawer.toDoStatus.done'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      _filterButton(
                        primaryColor: _status == ToDoStatus.notCompleted
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).primaryColorLight,
                        textColor: _status == ToDoStatus.notCompleted
                            ? Colors.white
                            : Colors.black,
                        onPress: _status == ToDoStatus.notCompleted
                            ? () {}
                            : () {
                                _filterDrawerCubit
                                    .updateToDoStatus(ToDoStatus.notCompleted);
                              },
                        text: translate('homeScreen.filterDrawer.toDoStatus.notDone'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: CustomElevatedButton(
                      text: translate('homeScreen.filterDrawer.applyFiltersButton'),
                      onPress: () {
                        final _toDoListCubit = context.read<GenericProvider>().toDoListCubit;
                        _toDoListCubit.applyFilters(_sorted, _status);
                        Navigator.pop(context);
                      },
                      buttonColor: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: Text('Please wait'),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _filterButton({
    required Color primaryColor,
    required Color textColor,
    required void Function() onPress,
    required String text,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        textStyle: TextStyle(
          color: textColor,
        ),
      ),
      onPressed: onPress,
      child: Text(
        text,
      ),
    );
  }
}
