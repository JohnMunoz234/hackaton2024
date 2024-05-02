import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hackaton_2024_mv/core/api/api_error.dart';
import 'package:hackaton_2024_mv/core_ui/widgets/shared/custom_drawer.dart';
import 'package:hackaton_2024_mv/feature/folder/di/folder_module.dart';
import 'package:hackaton_2024_mv/feature/folder/domain/params/folders_params.dart';
import 'package:hackaton_2024_mv/feature/folder/domain/response/folders_response.dart';
import 'package:hackaton_2024_mv/feature/folder/domain/usecase/get_folders.dart';
import 'package:hackaton_2024_mv/feature/folder/domain/usecase/send_folders.dart';
import 'package:hackaton_2024_mv/feature/principal/presentation/screen/principal_screen.dart';

final folderProvider =
    StateNotifierProvider<FolderStateNotifier, FolderState>((ref) {
  final GetFolders getFolderUseCase = ref.watch(getFoldersUseCaseProvider);
  final SendFolders sendFolderUseCase = ref.watch(sendFoldersUseCaseProvider);
  return FolderStateNotifier(
    getFolders: getFolderUseCase,
    sendFolders: sendFolderUseCase,
  );
});

class FolderStateNotifier extends StateNotifier<FolderState> {
  final GetFolders getFolders;
  final SendFolders sendFolders;

  FolderStateNotifier({
    required this.getFolders,
    required this.sendFolders,
  }) : super(FolderState()) {
    init();
  }

  init() {
    loadFolders();
  }

  void loadFolders() async {
    final result = await getFolders.call();
    result.fold((ApiError l) {
      debugPrint('failed get list folder: ${l.message}');
      return null;
    }, (FoldersResponse r) {
      debugPrint(
          'success get list folder: ${r.folders?.map((e) => e.prefix).toList()}');
      for (PrefixResponse element in r.folders ?? []) {
        setListFolders(FoldersInfo(name: element.prefix, isPressed: false));
      }
      return null;
    });
  }

  setWasPressed(int index) {
    var listInternal = state.listFolders;
    int count = 0;
    int saveIndex = 0;
    FoldersInfo? info;
    listInternal?.forEach((element) {
      if (element.isPressed) {
        saveIndex = count;
        info = FoldersInfo(name: element.name, isPressed: false);
      }
      count++;
    });

    if (info != null) {
      listInternal![saveIndex] =
          FoldersInfo(name: info?.name!, isPressed: info!.isPressed);
    }

    listInternal![index] = FoldersInfo(
        name: listInternal[index].name,
        isPressed: !listInternal[index].isPressed);
    state = state.copyWith(listFolders: listInternal);
  }

  setListFolders(FoldersInfo info) {
    state = state.copyWith(listFolders: [...?state.listFolders, info]);
  }

  String? getSelectFolders() {
    String? nameFolder;
    state.listFolders?.forEach((element) {
      if (element.isPressed) {
        nameFolder = element.name;
      }
    });
    return nameFolder;
  }

  List<String>? getFoldersBySearch(String search) {
    List<String> listFolders = [];
    state.listFolders!.forEach((element) {
      if (element.name!.contains(search)) {
        listFolders.add(element.name!);
      }
    });
    return listFolders;
  }

  onDrawerItemTapped(BuildContext context, int drawerItemSelectedIndex) {
    if (drawerItemSelectedIndex == DrawerMenuScreensEnum.unpairDevice.index) {
      context.pushReplacement(PrincipalScreen.link);
      return;
    }
    if (drawerItemSelectedIndex == DrawerMenuScreensEnum.logout.index) {
      context.pushReplacement(PrincipalScreen.link);
      return;
    }
  }

  callSendFolders() async {
    final result = await sendFolders.call(
        params: FoldersParams(folderName: state.listFolders?.first.name ?? ''));

    result.fold((ApiError l) {
      debugPrint('Failed send folders: ${l.message}');
      return null;
    }, (FoldersResponse r) {
      debugPrint('Success send folders: ${r.folders?.length}');
      return null;
    });
  }
}

class FolderState {
  final bool? wasPressed;
  final List<FoldersInfo>? listFolders;

  FolderState({this.wasPressed = false, this.listFolders});

  FolderState copyWith({
    bool? wasPressed,
    List<FoldersInfo>? listFolders,
  }) {
    return FolderState(
      wasPressed: wasPressed ?? this.wasPressed,
      listFolders: listFolders ?? this.listFolders,
    );
  }
}

class FoldersInfo {
  String? name;
  bool isPressed;

  FoldersInfo({this.name, required this.isPressed});
}
