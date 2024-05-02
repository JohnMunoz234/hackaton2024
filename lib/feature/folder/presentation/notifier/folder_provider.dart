import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hackaton_2024_mv/core/util/parameters.dart';
import 'package:hackaton_2024_mv/core_ui/widgets/shared/custom_drawer.dart';
import 'package:hackaton_2024_mv/feature/principal/presentation/screen/principal_screen.dart';

final folderProvider =
    StateNotifierProvider<FolderStateNotifier, FolderState>((ref) {
  return FolderStateNotifier();
});

class FolderStateNotifier extends StateNotifier<FolderState> {
  FolderStateNotifier() : super(FolderState()) {
    init();
  }

  init() {
    List<String> listNameFolder = [
      Parameters.itemListFolderName1,
      Parameters.itemListFolderName2,
      Parameters.itemListFolderName3,
      Parameters.itemListFolderName1,
      Parameters.itemListFolderName2,
      Parameters.itemListFolderName3,
    ];

    for (var element in listNameFolder) {
      setListFolders(FoldersInfo(name: element, isPressed: false));
    }
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
