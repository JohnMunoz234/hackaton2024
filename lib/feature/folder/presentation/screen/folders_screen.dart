import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackaton_2024_mv/core/util/dialog_util.dart';
import 'package:hackaton_2024_mv/core/util/parameters.dart';
import 'package:hackaton_2024_mv/core_ui/widgets/shared/custom.main_button.dart';
import 'package:hackaton_2024_mv/core_ui/widgets/shared/custom_app_bar.dart';
import 'package:hackaton_2024_mv/core_ui/widgets/shared/custom_item_list.dart';
import 'package:hackaton_2024_mv/feature/folder/presentation/notifier/folder_provider.dart';
import 'package:hackaton_2024_mv/resource/color_constants.dart';
import 'package:hackaton_2024_mv/resource/image_constants.dart';

class FoldersScreen extends ConsumerStatefulWidget {
  static const String name = 'FoldersScreen';
  static const String link = '/$name';

  const FoldersScreen({
    super.key,
  });

  @override
  ConsumerState createState() => _FoldersScreenState();
}

class _FoldersScreenState extends ConsumerState<FoldersScreen> {

  String dropDownValue = Parameters.itemDropDown1;
  List<String> listNameFolder = [
    Parameters.itemListFolderName1,
    Parameters.itemListFolderName2,
    Parameters.itemListFolderName3,
    Parameters.itemListFolderName1,
    Parameters.itemListFolderName2,
    Parameters.itemListFolderName3,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    ));
  }

  _buildAppBar(BuildContext context) {
    return CustomAppBar(
        title: "DOCUSENSE IA",
        icon: ImageConstants.icMenu,
        onTap: () {
          print("Aparece menu hamburguesa");
        });
  }

  _buildBody(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 20),
      _buildTitle(context),
      _buildDescription(),
      const SizedBox(height: 20),
      _buildDropDown(),
      const SizedBox(height: 10),
      _buildFoldersList(),
      const SizedBox(height: 10),
      _buildButton()
    ]);
  }

  _buildTitle(BuildContext context) {
    return Center(
      child: Text(
        "Validador de carpetas",
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.w200, fontSize: 24.sp),
      ),
    );
  }

  _buildDescription() {
    return Center(
      child: Text(
        "Selecciona la carpeta que deseas validar",
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.w200, fontSize: 16.sp),
      ),
    );


  }
  _buildDropDown() {
    return DropdownButton<String>(
      value: dropDownValue,
      icon: const Icon(Icons.arrow_circle_left_sharp, color: Colors.grey),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
      underline: Container(
        height: 5,
        color: Colors.grey,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropDownValue = newValue!;
        });
      },
      items: <String>[
        Parameters.itemDropDown1,
        Parameters.itemDropDown2,
        Parameters.itemDropDown3,
        Parameters.itemDropDown4,
        Parameters.itemDropDown5,
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
  
  _buildFoldersList() {
    final state = ref.read(folderProvider);

    return SizedBox(
      width: 300.h,
      height: 450.h,
      child:  ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          scrollDirection: Axis.vertical,
          itemCount: listNameFolder.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                ref.read(folderProvider.notifier).setWasPressed(true);
                print("Tap en folder");
              },
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical:10),
                  child: CustomItemList(
                    folderName: listNameFolder[index],
                    icon: ImageConstants.icFolder,
                    onPressed: () {
                      print('Internal Tap');
                    },
                    wasPressed: state.wasPressed,
                  ),
                ),
              ),
            );
          }),
    );
  }

  _buildButton() {
    return CustomMainButton(
      text: "Validar",
      colorText: Colors.white,
      color: ColorConstants.primaryButtonColor,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      onPressed: () {
        if (dropDownValue != Parameters.itemDropDown1) {
          // TODO JM ENVIA PETICION A BACK
          DialogUtil.showCustomDialog(
              context: context,
              title: "!Tus resultado estan listos!",
              description:
              "Oprime el siguiente boton para descargar los resultados de la validacion");
        } else {
          DialogUtil.showCustomDialog(
              context: context,
              title: "!Ha ocurrido un error!",
              description: dropDownValue == Parameters.itemDropDown1
                  ? "Por favor seleccionar un tipo de documento"
                  : "Por favor adjuntar al menos una imagen");
        }
      },
    );
  }
  
  
}
