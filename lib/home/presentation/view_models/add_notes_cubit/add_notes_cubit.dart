import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/core/sqldb.dart';

part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());

  Future<void> addNoteToDatabase(String title, String description) async {
    emit(AddNotesLoading());

    try {
      SqlDb db = SqlDb();

      final sql =
          "INSERT INTO notes (note, description) VALUES ('$title', '$description')";

      await db.insertData(sql);
      emit(AddNotesSuccess());
    } catch (e) {
      emit(AddNotesFailure("Failed to add note: $e"));
    }
  }

  Future<void> updateNoteInDatabase(
      int noteId, String title, String description) async {
    emit(AddNotesLoading());

    try {
      final db = SqlDb();
      final sql =
          "UPDATE notes SET note = '$title', description = '$description' WHERE id = $noteId";
      await db.updateData(sql);
      emit(AddNotesSuccess());
    } catch (e) {
      emit(AddNotesFailure("Failed to update note: $e"));
    }
  }
}
