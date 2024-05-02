import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackaton_2024_mv/resource/image_constants.dart';

String _tag = 'CustomItemList';

class CustomItemList extends StatefulWidget {
  final String folderName;
  final String? icon;
  final VoidCallback? onPressed;
  final bool? wasPressed;

  const CustomItemList(
      {super.key, required this.folderName, this.icon, this.onPressed, this.wasPressed});

  @override
  _CustomItemListState createState() => _CustomItemListState();
}


class _CustomItemListState extends State<CustomItemList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed?.call();
      },
      child: Card(
         shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        child: Container(
          color: widget.wasPressed ? Colors.blueAccent : Colors.white12,
          width: 100,
          child: Row(
            children: [
              const SizedBox(width: 10),
             SvgPicture.asset(widget.icon!, width: 100, height: 50,),
              const SizedBox(width: 30),
             Text(widget.folderName, )
            ],
          ),
        )
      )
    );
  }

}