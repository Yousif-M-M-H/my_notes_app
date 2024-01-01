import 'package:flutter/material.dart';
import 'package:notes_app/home/presentation/views/widgets/notes_details_view_body.dart';

class NotesDetailsView extends StatelessWidget {
  const NotesDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NotesDetailsViewBody(),
    );
  }
}
