import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/utils/container_color.dart';
import 'package:notes_app/home/presentation/views/widgets/notes_details_view_body.dart';
import 'package:notes_app/home/presentation/views/widgets/title_container_widget.dart';
import 'package:notes_app/search/presentation/cubit/search_notes_cubit_cubit.dart';
import 'package:notes_app/search/presentation/view/widgets/search_not_found.dart';
import 'package:notes_app/search/presentation/view/widgets/search_text_field.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  _SearchViewBodyState createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        child: Column(
          children: [
            SearchTextfield(searchController: _searchController),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<SearchNotesCubitCubit, SearchNotesCubitState>(
                builder: (context, state) {
                  if (state is SearchNotesCubitLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SearchNotesCubitFailure) {
                    return Center(child: Text(state.errorMessage));
                  } else if (state is SearchNotesCubitSuccess) {
                    final searchResults = state.notes;
                    return ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20),
                      itemCount: searchResults.length,
                      itemBuilder: (context, index) {
                        final colorIndex =
                            index % ContainerColors.colors.length;
                        return TitleContainerWidget(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NotesDetailsViewBody(
                                    noteDetails: state.notes[index]),
                              ),
                            );
                          },
                          title: searchResults[index]['note'],
                          containerColor: ContainerColors.colors[colorIndex],
                        );
                      },
                    );
                  } else {
                    return const Center(child: SearchNoFound());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
