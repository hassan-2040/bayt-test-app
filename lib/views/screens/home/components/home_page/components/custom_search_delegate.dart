import 'package:bayt_test_app/bloc/to_do_search_bloc/to_do_search_cubit.dart';
import 'package:bayt_test_app/helpers/size_config.dart';
import 'package:bayt_test_app/models/to_do.dart';
import 'package:bayt_test_app/providers/generic_provider.dart';
import 'package:bayt_test_app/views/common_widgets/feedback_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchDelegate extends SearchDelegate {
  final ToDoSearchCubit _toDoSearchCubit;
  CustomSearchDelegate(this._toDoSearchCubit);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        context.read<GenericProvider>().saveRecentSearches(_toDoSearchCubit.searchStrings.reversed.toList());
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {

    _toDoSearchCubit.searchToDos(query); //sending search query

    return BlocBuilder<ToDoSearchCubit, ToDoSearchState>(
      bloc: _toDoSearchCubit,
      builder: (context, state) {
        if (state is ToDoSearchLoading) {
          return const Center(
            child: SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        } else if (state is ToDoSearchFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else if (state is ToDoSearchSuccess) {
          final _results = state.searchResults;
          return ListView.builder(
            itemCount: _results.length,
            itemBuilder: (context, index) {
              var result = _results[index];
              return ListTile(
                title: Text(result.title),
              );
            },
          );
        } else {
          return const Center(
            child: Text('Please wait'),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // This method is called everytime the search term changes.
    if(query.isEmpty) {
      final _searchStrings = _toDoSearchCubit.searchStrings.reversed.toList();
      if (_searchStrings.isEmpty) {
        return const Center(child: Text('No Recent Searches'));
      } else {
        return ListView.builder(
          itemCount: _searchStrings.length,
          itemBuilder: (ctx, index) {
            return ListTile(
              title: Text(_searchStrings[index]),
            );
          },
        );
      }
    } else {
      _toDoSearchCubit.searchToDos(query);
      final _searchResults = _toDoSearchCubit.searchResults;
      return ListView.builder(
        itemCount: _searchResults.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text(_searchResults[index].title),
          );
        },
      );
    }
    return const Center(child: Text('Last Resort'),);
  }
}
