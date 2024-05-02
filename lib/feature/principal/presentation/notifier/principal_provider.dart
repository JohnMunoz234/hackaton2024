import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackaton_2024_mv/core/util/dialog_util.dart';
import 'package:hackaton_2024_mv/feature/principal/di/principal_module.dart';
import 'package:hackaton_2024_mv/feature/principal/domain/params/send_document_params.dart';
import 'package:hackaton_2024_mv/feature/principal/domain/params/send_documents_params.dart';
import 'package:hackaton_2024_mv/feature/principal/domain/usecase/send_document.dart';
import 'package:hackaton_2024_mv/feature/principal/domain/usecase/send_documents.dart';

final principalProvider =
StateNotifierProvider<PrincipalStateNotifier, PrincipalState>((ref) {
  final StateNotifierProviderRef _ref = ref;
  final document = ref.watch(sendDocumentUseCaseProvider);
  final documents = ref.watch(sendDocumentsUseCaseProvider);
  return PrincipalStateNotifier(ref: ref, document: document, documents: documents);
});

class PrincipalStateNotifier extends StateNotifier<PrincipalState> {
  StateNotifierProviderRef ref;
  SendDocument document;
  SendDocuments documents;

  PrincipalStateNotifier({required this.ref, required this.document, required this.documents})
      : super(PrincipalState()) {
    //init();
  }

  get paths => null;

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

  sendDocument(BuildContext context, String path, String typeDocument) async {
    File file = File(path);
    final data = await file.readAsBytes();
    final documentInBase64 = base64.encode(data);
    print("the base64 is : $documentInBase64");

    final response = await document.call(
      params: SendDocumentParams(
          fileName: "$typeDocument.png", base64Document: documentInBase64),
    );

    response.fold((l) =>
    {
      print("Falle  $l")
    }, (r) => {
    DialogUtil.showCustomDialog(
    context: context,
    title: "!Tus resultado estan listos!",
    description:
    "Documento 1: ${r.classPrincipal} ")
    });
  }


  Future<List<String>?> sendDocuments(BuildContext context, String typeDocument) async {
    List<RealRequest> paths = [RealRequest(fileName: '', base64Documents: '')];
    state.listPath?.forEach((element) async {
      File file = File(element);
      final data = await file.readAsBytes();
      final documentInBase64 = base64.encode(data);
      paths.add(RealRequest(fileName: typeDocument, base64Documents: documentInBase64));
    });

    final response = await documents.call(params:SendDocumentsParams(base64Document: paths));
    response.fold((l) =>
    {
      print("Falle  $l")
    }, (r) => {

      DialogUtil.showCustomDialog(
          context: context,
          title: "!Tus resultado estan listos!",
          description:
          "Documento 1")
    });
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
