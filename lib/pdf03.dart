import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pdfx/pdfx.dart';

import 'model/Musics.dart';

class pdf03 extends StatefulWidget {
  pdf03({required this.mMusic});
  final Musics mMusic;
  @override
  State<pdf03> createState() => _pdf03State();
}

class _pdf03State extends State<pdf03> {
  // final pdf = Document() ;
  late PdfControllerPinch pdfControllerPinch;

  @override
  void initState() {
    super.initState();
    pdfControllerPinch = PdfControllerPinch(
        document: PdfDocument.openAsset('${(widget.mMusic.url)} '));
     //   document: PdfDocument.openAsset('assets/pdfs/pd1.pdf'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "PDF Viewer",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      /*   appBar:  AppBar(title: const Text('PDF Viewer '), centerTitle: true,),
      body: _isloding? Center(child: CircularProgressIndicator(),)
       :  SfPdfViewer.
      asset(
        // هنا وين لازم نحط ال بيديياف 
         '${(widget.mMusic.url)} ',
        key: _pdfViewerKey,
     
      ), */
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return Column(
      children: [
        _pdfView(),
      ],
    );
  }

  Widget _pdfView() {
    return Expanded(
      child: PdfViewPinch(controller: pdfControllerPinch,)
    );
  }
}
