import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackaton_2024_mv/core/util/file_util.dart';
import 'package:hackaton_2024_mv/core/util/permission_util.dart';
import 'package:hackaton_2024_mv/core_ui/widgets/shared/custom.main_button.dart';
import 'package:hackaton_2024_mv/core_ui/widgets/shared/custom_app_bar.dart';
import 'package:hackaton_2024_mv/core_ui/widgets/shared/custom_appbar_icon.dart';
import 'package:hackaton_2024_mv/core_ui/widgets/shared/custom_sized_box_space.dart';
import 'package:hackaton_2024_mv/resource/color_constants.dart';
import 'package:hackaton_2024_mv/resource/image_constants.dart';

class PrincipalScreen extends StatefulWidget {
  static const String name = 'PrincipalScreen';
  static const String link = '/$name';

  const PrincipalScreen({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
  String dropDownValue = 'Selecciona un tipo de documento';

  @override
  Widget build(BuildContext context) {
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
      leading: CustomAppbarIcon(
        assetName: ImageConstants.imageLogoTrueId,
        onTap: () async {
          Navigator.pop(context);
        },
      ),
    );
  }

  _buildBody(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 120),
        _buildTitle(context),
        _buildDescription(),
        const SizedBox(height: 40),
        _buildDropDown(),
        const SizedBox(height: 40),
        _buildCustomGetLocalDocument(context),
        const SizedBox(height: 40),
        _buildButton()
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

  _buildCustomGetLocalDocument(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        bool isPermission = await _validatePermission(context);
        if (isPermission) {
          FileUtil.pickFile(CustomFileType.PDF);
          print("Oprimi el boton");
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

  _buildTextVerify() {
    bool isOfficial = true;
    return Center(
      child: isOfficial
          ? const Text("El Documento es: ", style: TextStyle(color: Colors.grey),)
          : Text(
              "El documento es una vil mentira ladron de datos personales \n llamando a la policia....."),
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
        'Selecciona un tipo de documento',
        'Cedula',
        'Pasaporte',
        'Licencia de conduccion',
        'Cedula de extranjeria'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  _buildButton() {
    return CustomMainButton(
      text: "Validar",
      colorText: Colors.white,
      color: ColorConstants.primaryButtonColor,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      onPressed: () {
        print("Ir a login");
      },
    );
  }
}
