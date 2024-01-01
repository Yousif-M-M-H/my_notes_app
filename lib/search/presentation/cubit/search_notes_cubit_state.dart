part of 'search_notes_cubit_cubit.dart';

@immutable
sealed class SearchNotesCubitState {}

final class SearchNotesCubitInitial extends SearchNotesCubitState {}

final class SearchNotesCubitSuccess extends SearchNotesCubitState {
  final List<Map<String, dynamic>> notes;

  SearchNotesCubitSuccess(this.notes);
}

final class SearchNotesCubitEmpty extends SearchNotesCubitState {}

final class SearchNotesCubitFailure extends SearchNotesCubitState {
  final String errorMessage;
  SearchNotesCubitFailure(this.errorMessage);
}

final class SearchNotesCubitLoading extends SearchNotesCubitState {}
