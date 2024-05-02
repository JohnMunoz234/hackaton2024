import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hackaton_2024_mv/core/util/dialog_util.dart';
import 'package:hackaton_2024_mv/core/util/file_util.dart';
import 'package:hackaton_2024_mv/core/util/parameters.dart';
import 'package:hackaton_2024_mv/core/util/permission_util.dart';
import 'package:hackaton_2024_mv/core_ui/widgets/shared/custom.main_button.dart';
import 'package:hackaton_2024_mv/core_ui/widgets/shared/custom_app_bar.dart';
import 'package:hackaton_2024_mv/feature/auth/login/presentation/screen/login_screen.dart';
import 'package:hackaton_2024_mv/feature/principal/presentation/notifier/principal_provider.dart';
import 'package:hackaton_2024_mv/resource/color_constants.dart';
import 'package:hackaton_2024_mv/resource/image_constants.dart';

class PrincipalScreen extends ConsumerStatefulWidget {
  static const String name = 'PrincipalScreen';
  static const String link = '/$name';

  const PrincipalScreen({
    super.key,
  });

  @override
  ConsumerState createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends ConsumerState<PrincipalScreen> {
  String dropDownValue = Parameters.itemDropDown1;

  @override
  Widget build(BuildContext context) {
    ref.listen(principalProvider, (previous, next) {
      if (previous is! PrincipalState) return;

      if (previous.showDialog == next.showDialog) {
        return;
      }

      if (mounted &&
          next.showDialog.showDialogEnum == ShowDialogEnum.dialogResult) {
        context.pop();
        DialogUtil.showCustomDialog(
          context: context,
          title: "!Tus resultado estan listos!",
          description:
              "El documento que has proporcionado es: ${next.showDialog.message}",
        );
      }

      if (mounted && next.showDialog.showDialogEnum == ShowDialogEnum.loading) {
        DialogUtil.showCustomDialog(
          context: context,
          isCancelable: false,
          title: 'Procesando...',
          description: 'Esperando resultado de verificación',
        );
      }

      if (mounted && next.showDialog.showDialogEnum == ShowDialogEnum.error) {
        context.pop();
        DialogUtil.showCustomDialog(
          context: context,
          title: 'Tenemos algunos inconvenientes',
          description: 'No fue posible completar la verificación',
        );
      }
    });

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(context),
      ),
    );
  }

  _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: "DOCUSENSE IA",
      icon: ImageConstants.icUserProfile,
      onTap: () => {context.pushReplacement(LoginScreen.link)},
    );
  }

  _buildBody(BuildContext context) {
    final state = ref.watch(principalProvider);

    // final state = ref.read(principalProvider.notifier).state;

    final stateFinal = ref.read(principalProvider.notifier);
    //stateFinal.setIsActive(true);
    return Column(
      children: [
        const SizedBox(height: 10),
        _buildTitle(context),
        _buildDescription(),
        const SizedBox(height: 40),
        _buildDropDown(),
        const SizedBox(height: 40),
        _buildCustomGetLocalDocument(context, stateFinal),
        const SizedBox(height: 40),
        _buildPreviewDocumentList(state, stateFinal),
        const SizedBox(height: 50),
        _buildButton(stateFinal),
      ],
    );
  }

  Future<bool> _validatePermission(BuildContext context) async {
    return PermissionUtil.checkOrRequestPermission(context);
  }

  _buildTitle(BuildContext context) {
    return Center(
      child: Text(
        "Verificador de documentos",
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.w200, fontSize: 24.sp),
      ),
    );
  }

  _buildDescription() {
    return Center(
      child: Text(
        "¡Descubre si la fotografia de un documento es verdadera!",
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.w200, fontSize: 16.sp),
      ),
    );
  }

  _buildCustomGetLocalDocument(
      BuildContext context, PrincipalStateNotifier state) {
    return GestureDetector(
      onTap: () async {
        bool isPermission = await _validatePermission(context);
        if (isPermission && state.state.listPath!.length < 3) {
          final path = await FileUtil.pickFile();
          state.setListPath(path!);
        } else {
          DialogUtil.showCustomDialog(
              context: context,
              title: "!Espera!",
              description:
                  "Has cumplido con el limite (3) para adjuntar documentos ");
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 2,
            color: Colors.grey,
          ),
          // Make rounded corners
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Center(
            child: Column(children: [
          SizedBox(height: 40),
          Image(
            image: AssetImage(ImageConstants.icDocument1),
            width: 40,
            height: 40,
            color: Colors.grey,
          ),
          SizedBox(height: 5),
          Text(
            "Haz tap aqui para seleccionar un documento",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
        ])),
      ),
    );
  }

  _buildDropDown() {
    return DropdownButton<String>(
      value: dropDownValue,
      icon: const Icon(Icons.arrow_circle_left_sharp, color: Colors.grey),
      iconSize: 18,
      elevation: 16,
      style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
      underline: Container(
        height: 2,
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
          child: Text(
            value,
            style: const TextStyle(fontSize: 20),
          ),
        );
      }).toList(),
    );
  }

  _buildButton(PrincipalStateNotifier state) {
    return CustomMainButton(
      text: "Validar",
      colorText: Colors.white,
      color: ColorConstants.primaryButtonColor,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      onPressed: () {
        if (dropDownValue != Parameters.itemDropDown1 &&
            state.state.listPath!.isNotEmpty) {
          // TODO JM ENVIA PETICION A BACK
          state.sendDocument(state.state.listPath!.first, dropDownValue);
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

  _buildPreviewDocumentList(
      PrincipalState state, PrincipalStateNotifier stateNotifier) {
    return Center(
      child: SizedBox(
        height: 160.h,
        child: ListView.builder(
            padding: EdgeInsets.only(left: 32.w),
            scrollDirection: Axis.horizontal,
            itemCount: state.listPath!.length <= 3 ? state.listPath?.length : 3,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  ref
                      .read(principalProvider.notifier)
                      .removeElementListPath(index);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 2,
                      color: Colors.grey,
                    ),
                    // Make rounded corners
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: Image.file(
                      File(state.listPath![index]!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
