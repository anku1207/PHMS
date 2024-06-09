import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFViewerScreen extends StatefulWidget {
  final String pdfUrl;

  PDFViewerScreen({required this.pdfUrl});

  @override
  _PDFViewerScreenState createState() => _PDFViewerScreenState();
}

class _PDFViewerScreenState extends State<PDFViewerScreen> {
 /* bool _isLoading = true;
  PDFDocument? _document;

  @override
  void initState() {
    super.initState();
    _loadPDF();
  }

  Future<void> _loadPDF() async {
    setState(() {
      _isLoading = true;
    });
    try {
      _document = await PDFDocument.fromURL(widget.pdfUrl);
    } catch (e) {
      print(e);
      // Handle error
    }
    setState(() {
      _isLoading = false;
    });
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: PDFView(
        filePath: widget.pdfUrl,
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
        onRender: (_pages) {
          print("Rendered $_pages pages.");
        },
        onError: (error) {
          print('Error occurred: $error');
        },
        onPageError: (page, error) {
          print('Error occurred on page $page: $error');
        },
        onViewCreated: (PDFViewController controller) {
          // Use the controller as needed
        },
      ),
    );
  }
}