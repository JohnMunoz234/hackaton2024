import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackaton_2024_mv/resource/color_constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_render/pdf_render.dart';
import 'package:skeletonizer/skeletonizer.dart';

String _tag = 'CustomDocumentItem';

class CustomDocumentItem extends StatefulWidget {
  final String documentName;
  final String? fileName;
  final String? filePath;
  final Uint8List? pdfData;
  final bool? isFavorite;
  final VoidCallback? onFavoriteClick;
  final VoidCallback? onPressed;
  final String? pdfState;
  final bool skeletonEnabled;
  final bool? isFirstBuild;

  const CustomDocumentItem({
    super.key,
    required this.documentName,
    this.fileName,
    this.filePath,
    this.pdfData,
    this.isFavorite,
    this.onFavoriteClick,
    this.onPressed,
    this.pdfState,
    this.skeletonEnabled = false,
    this.isFirstBuild = true,
  });

  @override
  _CustomDocumentItemState createState() => _CustomDocumentItemState();
}

class _CustomDocumentItemState extends State<CustomDocumentItem> {
  bool skeletonDocumentItemEnable = true;

  Uint8List? imagePreview;

  @override
  Widget build(BuildContext context) {
    double aspectRatio = 0.65;
    return GestureDetector(
        onTap: () {
          widget.onPressed?.call();
        },
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: Skeleton.ignore(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          color: ColorConstants.generalBorderColor),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    elevation: 1,
                    child: Skeleton.ignore(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildPDFView(),
                          ],
                        ))),
                Skeleton.ignore(
                    child: Padding(
                      padding: EdgeInsets.only(left: 4.w),
                      child: (widget.fileName != null &&
                          widget.fileName?.isNotEmpty == true)
                          ? Text(
                        widget.fileName ?? '',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp,
                            color: ColorConstants.tertiaryTextColor),
                        overflow: TextOverflow.ellipsis,
                      )
                          : Container(),
                    )),
              ],
            ),
          ),
        ));
  }

  Widget _buildPDFView() {
    int defaultPage = 0;


    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 90.h,
          width: 135.w,
          child: Stack(
            children: [
              Container(
                color: Colors.white,
                child: FutureBuilder<ui.Image?>(
                  future: _loadOrRenderPdfImage(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        print('${_tag} Error rendering PDF image: ${snapshot.error}');
                        return Container();
                      } else {
                        final image = snapshot.data;
                        return RawImage(
                          width: 135.w,
                          height: 90.h,
                          fit: BoxFit.contain,
                          image: image,
                        );
                      }
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<PdfDocument> _getPdfDocument(Uint8List b64) async {
    return await _convertPdfBase64ToDocument(base64Encode(b64));
  }

  Future<PdfDocument> _convertPdfBase64ToDocument(String fileBase64) async {
    final Uint8List decode = base64.decode(fileBase64);
    final doc = await PdfDocument.openData(decode);
    return doc;
  }

  Future<ui.Image?> _loadOrRenderPdfImage() async {
    Directory dir = await getApplicationSupportDirectory();
    File file = File('${dir.path}/${widget.documentName}');

    if (await file.exists()) {
      var bytes = await file.readAsBytes();
      var codec = await ui.instantiateImageCodec(bytes);
      var frameInfo = await codec.getNextFrame();
      return frameInfo.image;
    } else {
      var image = await _renderPdfImage();
      if (image != null) {
        final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
        if (byteData != null) {
          _saveImage(byteData.buffer.asUint8List(), widget.fileName!);
        }
      }
      return image;
    }
  }

  Future<ui.Image?> _renderPdfImage() async {
    try {
      var doc = widget.filePath != null
          ? await PdfDocument.openFile(widget.filePath!)
          : await PdfDocument.openData(widget.pdfData ?? Uint8List(0));
      final page = await doc.getPage(1);
      final image = await page.render(
        width: page.width.toInt(),
        height: page.height.toInt(),
        fullHeight: 0,
        backgroundFill: true,
        allowAntialiasingIOS: true,
      );
      if (image.imageIfAvailable != null &&
          image.imageIfAvailable!.height > 0) {
        return image.imageIfAvailable;
      }
      var imageYe = await image.createImageIfNotAvailable();
      await doc.dispose();
      return imageYe;
    } catch (e) {
      // Log.e(_tag, 'Error rendering PDF image: $e');
    }
    return null;
  }

  Future<File> _saveImage(Uint8List bytes, String filename) async {
    Directory dir = await getApplicationSupportDirectory();
    File file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes);
    return file;
  }
}
