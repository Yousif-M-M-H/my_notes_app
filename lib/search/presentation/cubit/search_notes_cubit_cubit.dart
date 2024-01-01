import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/core/sqldb.dart';

part 'search_notes_cubit_state.dart';

class SearchNotesCubitCubit extends Cubit<SearchNotesCubitState> {
  SearchNotesCubitCubit() : super(SearchNotesCubitInitial());

  void searchNotes(String query) async {
    emit(SearchNotesCubitLoading());

    try {
      SqlDb db = SqlDb();
      final data =
          await db.readData("SELECT * FROM notes WHERE note LIKE '%$query%'");

      if (data.isEmpty) {
        emit(SearchNotesCubitEmpty());
      } else {
        emit(SearchNotesCubitSuccess(data));
      }
    } catch (e) {
      emit(SearchNotesCubitFailure("Error: $e"));
    }
  }
}
