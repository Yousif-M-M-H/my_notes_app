part of 'list_notes_cubit.dart';

@immutable
sealed class ListNotesState {}

final class ListNotesInitial extends ListNotesState {}

final class ListNotesLoading extends ListNotesState {}

final class ListNotesSuccess extends ListNotesState {
  final List<Map<String, dynamic>> notes;

  ListNotesSuccess(this.notes);
}

final class ListNotesFailure extends ListNotesState {
  final String errMessage;

  ListNotesFailure(this.errMessage);
}
