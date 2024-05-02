import 'package:flutter_riverpod/flutter_riverpod.dart';

final folderProvider = StateNotifierProvider<FolderStateNotifier, FolderState>((
    ref) {
  return FolderStateNotifier();
});

class FolderStateNotifier extends StateNotifier<FolderState> {
  FolderStateNotifier() : super(FolderState());

  setWasPressed(bool wasPressed) {
    state = state.copyWith(wasPressed: wasPressed);
  }
}

class FolderState {
  final bool? wasPressed;

  FolderState({
    this.wasPressed,
  });


  FolderState copyWith({
    bool? wasPressed,
  }) {
    return FolderState(
      wasPressed: wasPressed ?? this.wasPressed,
    );
  }
}