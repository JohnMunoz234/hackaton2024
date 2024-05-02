import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hackaton_2024_mv/core_ui/widgets/shared/custom_drawer.dart';
import 'package:hackaton_2024_mv/feature/document/presentation/screen/document_screen.dart';
import 'package:hackaton_2024_mv/feature/folder/presentation/screen/folders_screen.dart';
import 'package:hackaton_2024_mv/feature/principal/presentation/screen/principal_screen.dart';

final documentProvider =
StateNotifierProvider<DocumentStateNotifier, DocumentState>((ref) {
  return DocumentStateNotifier();
});

class DocumentStateNotifier extends StateNotifier<DocumentState> {
  DocumentStateNotifier() : super(DocumentState()) {
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

  onDrawerItemTapped(BuildContext context, int drawerItemSelectedIndex) {
    if (drawerItemSelectedIndex == DrawerMenuScreensEnum.unpairDevice.index) {
      context.pushReplacement(FoldersScreen.link);
      return;
    }
    if (drawerItemSelectedIndex == DrawerMenuScreensEnum.logout.index) {
      context.pushReplacement(PrincipalScreen.link);
      return;
    }
  }
}

class DocumentState {
  final int? countDocuments;
  final bool? isActive;
  final String? path;
  final List<String>? listPath;

  DocumentState({
    this.countDocuments,
    this.isActive,
    this.path,
    this.listPath = const [],
  });

  DocumentState copyWith({
    int? countDocuments,
    bool? isActive,
    String? path,
    List<String>? listPath,
  }) {
    return DocumentState(
      countDocuments: countDocuments ?? this.countDocuments,
      isActive: isActive ?? this.isActive,
      path: path ?? this.path,
      listPath: listPath ?? this.listPath,
    );
  }
}
