import 'dart:io';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

class PdfViewerPage extends StatefulWidget {
  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  final PdfViewerController _pdfViewerController = PdfViewerController();
  List<String> _pdfFilePaths = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadPdfFilesFromFirebase();
  }

  Future<void> _loadPdfFilesFromFirebase() async {
    setState(() {
      _isLoading = true;
    });

    final storageRef = FirebaseStorage.instance.ref();
    final pdfRefs = [
      storageRef.child('D:\New folder/File 1.pdf'),
      storageRef.child('D:\New folder/File 2.pdf'),
      storageRef.child('D:\New folder/File 3.pdf'),
      storageRef.child('D:\New folder/File 4.pdf'),
    ];

    final tempDir = await getTemporaryDirectory();

    for (final pdfRef in pdfRefs) {
      final pdfPath = '${tempDir.path}/${pdfRef.name}';
      final pdfFile = File(pdfPath);
      await pdfRef.writeToFile(pdfFile);
      _pdfFilePaths.add(pdfPath);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
              ),
              itemCount: _pdfFilePaths.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _showPdfViewer(index);
                  },
                  child: Card(
                    child: Center(
                      child: Text('PDF ${index + 1}'),
                    ),
                  ),
                );
              },
            ),
    );
  }

  void _showPdfViewer(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text('PDF Viewer'),
          ),
          body: SfPdfViewer.file(
            File(_pdfFilePaths[index]),
            controller: _pdfViewerController,
          ),
        ),
      ),
    );
  }
}