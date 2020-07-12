import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:pdftron_flutter/pdftron_flutter.dart';


class MyDocApp extends StatefulWidget {
  @override
  _MyDocAppState createState() => _MyDocAppState();
}

class _MyDocAppState extends State<MyDocApp> {
  String _version = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();

    PdftronFlutter.openDocument("http://www.pdf995.com/samples/pdf.pdf");
  }

    Future<void> initPlatformState() async {
    String version;
   
    try {
      //PdftronFlutter.initialize();
      version = await PdftronFlutter.version;
    } on PlatformException {
      version = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _version = version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('PDFTron flutter app'),
        ),
        body: Center(
          child: Text('Running on: $_version\n'),
        ),
      );
    
  }
}