part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required bool isLoading,
    required List<NotesModel> notesModelList,
  }) = _HomeState;

  factory HomeState.initial() {//factory constructor
    return const HomeState(
      isLoading: false,
      notesModelList: [],
    );
  }
}