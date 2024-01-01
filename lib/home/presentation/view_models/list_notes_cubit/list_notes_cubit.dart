import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/core/sqldb.dart';

part 'list_notes_state.dart';

class ListNotesCubit extends Cubit<ListNotesState> {
  ListNotesCubit() : super(ListNotesInitial());

  Future<void> getAllNotes() async {
    emit(ListNotesLoading());

    try {
      SqlDb db = SqlDb();
      final data = await db.readData('SELECT * FROM notes');

      emit(ListNotesSuccess(data));
    } catch (e) {
      emit(ListNotesFailure("Error: $e"));
    }
  }

  Future<void> deleteNoteById(int noteId) async {
    emit(ListNotesLoading());

    try {
      SqlDb db = SqlDb();
      final result =
          await db.deleteData('DELETE FROM notes WHERE id = $noteId');

      if (result > 0) {
        emit(ListNotesSuccess(await db.readData('SELECT * FROM notes')));
      } else {
        emit(ListNotesFailure("Failed to delete note"));
      }
    } catch (e) {
      emit(ListNotesFailure("Error: $e"));
    }
  }
}
