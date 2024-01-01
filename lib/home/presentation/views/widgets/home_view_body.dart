import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/utils/container_color.dart';
import 'package:notes_app/home/presentation/view_models/list_notes_cubit/list_notes_cubit.dart';
import 'package:notes_app/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:notes_app/home/presentation/views/widgets/empty_notes.dart';
import 'package:notes_app/home/presentation/views/widgets/home_floating_button.dart';
import 'package:notes_app/home/presentation/views/widgets/notes_details_view_body.dart';
import 'package:notes_app/home/presentation/views/widgets/title_container_widget.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<ListNotesCubit>().getAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: CustomAppBar(),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<ListNotesCubit, ListNotesState>(
              builder: (context, state) {
                if (state is ListNotesSuccess) {
                  final notes = state.notes;
                  if (notes.isEmpty) {
                    return const EmptyNotesWidget();
                  }
                  return Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 15),
                      itemCount: notes.length,
                      itemBuilder: (context, index) {
                        final note = notes[index];
                        final colorIndex =
                            index % ContainerColors.colors.length;
                        final title = note['note'] ?? 'No Title';

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Dismissible(
                            background: Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(16)),
                              child: const Icon(Icons.delete),
                            ),
                            key: UniqueKey(),
                            onDismissed: (direction) {
                              final noteId = notes[index]['id'];
                              context
                                  .read<ListNotesCubit>()
                                  .deleteNoteById(noteId);
                            },
                            child: SizedBox(
                              width: double.infinity,
                              height: 100,
                              child: TitleContainerWidget(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          NotesDetailsViewBody(
                                              noteDetails: note),
                                    ),
                                  );
                                },
                                title: title,
                                containerColor:
                                    ContainerColors.colors[colorIndex],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is ListNotesFailure) {
                  return Center(
                    child: Text(state.errMessage),
                  );
                } else {
                  context.read<ListNotesCubit>().getAllNotes();
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: HomeFloatingButton(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NotesDetailsViewBody()),
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
