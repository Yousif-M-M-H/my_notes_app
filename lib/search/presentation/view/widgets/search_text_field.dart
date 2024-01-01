import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/search/presentation/cubit/search_notes_cubit_cubit.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: "Search by Keyword",
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.white,
        ),
        filled: true,
        fillColor: const Color(0xff3B3B3B),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
        ),
      ),
      onChanged: (value) {
        context.read<SearchNotesCubitCubit>().searchNotes(value);
      },
    );
  }
}
