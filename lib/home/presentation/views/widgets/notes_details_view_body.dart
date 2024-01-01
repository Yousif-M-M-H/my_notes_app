import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/home/presentation/view_models/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app/home/presentation/view_models/list_notes_cubit/list_notes_cubit.dart';
import 'package:notes_app/home/presentation/views/widgets/custom_details_app_bar.dart';
import 'package:notes_app/home/presentation/views/widgets/description_text_field.dart';
import 'package:notes_app/home/presentation/views/widgets/save_update_dialog.dart';
import 'package:notes_app/home/presentation/views/widgets/title_text_field.dart';

class NotesDetailsViewBody extends StatelessWidget {
  const NotesDetailsViewBody({Key? key, this.noteDetails}) : super(key: key);

  final Map<String, dynamic>? noteDetails;

  @override
  Widget build(BuildContext context) {
    final titleController =
        TextEditingController(text: noteDetails?['note'] ?? '');
    final descriptionController =
        TextEditingController(text: noteDetails?['description'] ?? '');

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDetailsAppBar(
                onSavePressed: () {
                  final cubit = context.read<AddNotesCubit>();
                  final title = titleController.text;
                  final description = descriptionController.text;
                  final noteId = noteDetails?['id'];

                  try {
                    if (noteId != null) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return SaveAndUpdateDialog(
                            redButtonTitle: 'Keep Editing',
                            onDiscardPressed: () {
                              GoRouter.of(context).pop();
                            },
                            onSavePressed: () {
                              cubit
                                  .updateNoteInDatabase(
                                      noteId, title, description)
                                  .then(
                                (_) {
                                  context.read<ListNotesCubit>().getAllNotes();
                                  GoRouter.of(context).pop();
                                  GoRouter.of(context).pop();
                                },
                              );
                            },
                          );
                        },
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return SaveAndUpdateDialog(
                            redButtonTitle: 'Keep adding',
                            onDiscardPressed: () {
                              GoRouter.of(context).pop();
                            },
                            onSavePressed: () {
                              cubit
                                  .addNoteToDatabase(title, description)
                                  .then((_) {
                                context.read<ListNotesCubit>().getAllNotes();
                                GoRouter.of(context).pop();
                                GoRouter.of(context).pop();
                              });
                            },
                          );
                        },
                      );
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to update note: $e')),
                    );
                  }
                },
              ),
              const SizedBox(height: 15),
              TitleTextField(titleController: titleController),
              DescriptionTextField(
                  descriptionController: descriptionController),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
