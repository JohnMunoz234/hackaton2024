import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackaton_2024_mv/core/api/api_error.dart';
import 'package:hackaton_2024_mv/feature/principal/di/principal_module.dart';
import 'package:hackaton_2024_mv/feature/principal/domain/params/send_document_params.dart';
import 'package:hackaton_2024_mv/feature/principal/domain/response/principal_response.dart';
import 'package:hackaton_2024_mv/feature/principal/domain/usecase/send_document.dart';

final principalProvider =
    StateNotifierProvider<PrincipalStateNotifier, PrincipalState>((ref) {
  final StateNotifierProviderRef _ref = ref;
  final documents = ref.watch(sendDocumentUseCaseProvider);
  return PrincipalStateNotifier(ref: ref, document: documents);
});

class PrincipalStateNotifier extends StateNotifier<PrincipalState> {
  StateNotifierProviderRef ref;
  SendDocument document;

  PrincipalStateNotifier({required this.ref, required this.document})
      : super(PrincipalState()) {
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
    state = state.copyWith(isActive: isActive);
  }

  resetCountDocuments() {
    state = state.copyWith(countDocuments: 0);
  }

  setListPath(String path) {
    state = state.copyWith(listPath: [...?state.listPath, path]);
  }

  removeElementListPath(int index) {
    var stateInternal = state.listPath;
    stateInternal?.removeAt(index);
    state = state.copyWith(listPath: stateInternal);
  }

  sendDocument(String path, String typeDocument) async {
    showDialogEnum(const ShowDialog(showDialogEnum: ShowDialogEnum.loading));

    File file = File(path);
    final data = await file.readAsBytes();
    final documentInBase64 = base64.encode(data);
    print("the base64 is : $documentInBase64");

    final response = await document.call(
      params: SendDocumentParams(
          fileName: "$typeDocument.png", base64Document: documentInBase64),
    );

    response.fold(
      (ApiError apiError) {
        showDialogEnum(const ShowDialog(showDialogEnum: ShowDialogEnum.error));
        return {print("Falle  $apiError")};
      },
      (PrincipalResponse principalResponse) {
        showDialogEnum(
          ShowDialog(
              showDialogEnum: ShowDialogEnum.dialogResult,
              message: principalResponse.classPrincipal),
        );
        return {print("No falle  ${principalResponse.classPrincipal}")};
      },
    );
  }

  Future<List<String>?> sendDocuments(List<String> path) async {
    return [];
  }

  void showDialogEnum(ShowDialog showDialog) {
    state = state.copyWith(
        showDialog: const ShowDialog(showDialogEnum: ShowDialogEnum.initial));
    state = state.copyWith(showDialog: showDialog);
  }
}

class PrincipalState {
  final int? countDocuments;
  final bool? isActive;
  final String? path;
  final List<String>? listPath;
  final ShowDialog showDialog;

  PrincipalState({
    this.countDocuments,
    this.isActive,
    this.path,
    this.listPath = const [],
    this.showDialog = const ShowDialog(),
  });

  PrincipalState copyWith({
    int? countDocuments,
    bool? isActive,
    String? path,
    List<String>? listPath,
    ShowDialog? showDialog,
  }) {
    return PrincipalState(
      countDocuments: countDocuments ?? this.countDocuments,
      isActive: isActive ?? this.isActive,
      path: path ?? this.path,
      listPath: listPath ?? this.listPath,
      showDialog: showDialog ?? this.showDialog,
    );
  }
}

enum ShowDialogEnum { initial, loading, error, dialogResult }

class ShowDialog {
  final ShowDialogEnum showDialogEnum;
  final String? message;

  const ShowDialog({
    this.showDialogEnum = ShowDialogEnum.initial,
    this.message,
  });
}
