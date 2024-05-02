import 'package:flutter_riverpod/flutter_riverpod.dart';

final principalProvider =
    StateNotifierProvider<PrincipalStateNotifier, PrincipalState>((ref) {
  return PrincipalStateNotifier();
});

class PrincipalStateNotifier extends StateNotifier<PrincipalState> {
  PrincipalStateNotifier() : super(PrincipalState()) {
    //init();
  }

  init() {
   state = state.copyWith(
      isActive: true,
      countDocuments: 0,
      path: null,
      listPath: [],
    );
  }

  setCountDocuments() {
    state = state.copyWith(countDocuments: state.countDocuments! + 1);
  }

  setIsActive(bool isActive) {
   state =  state.copyWith(isActive: isActive);
  }

  resetCountDocuments() {
   state =  state.copyWith(countDocuments: 0);
  }

  setListPath(String path){
   state =  state.copyWith(listPath: [...?state.listPath, path]);
  }

  removeElementListPath(int index) {
    var stateInternal = state.listPath;
    stateInternal?.removeAt(index);
    state = state.copyWith(listPath: stateInternal);

  }
}

class PrincipalState {
  final int? countDocuments;
   final bool? isActive;
  final String? path;
  final List<String>? listPath;

  PrincipalState({
    this.countDocuments,
    this.isActive,
    this.path,
    this.listPath = const [],
  });

  PrincipalState copyWith({
    int? countDocuments,
    bool? isActive,
    String? path,
    List<String>? listPath,
  }) {
    return PrincipalState(
      countDocuments: countDocuments ?? this.countDocuments,
      isActive: isActive ?? this.isActive,
      path: path ?? this.path,
      listPath: listPath ?? this.listPath,
    );
  }
}
