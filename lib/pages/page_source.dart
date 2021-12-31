import 'dart:typed_data';
import 'package:flutter/material.dart';

import 'package:app/services/file_picker_service.dart';
import 'package:app/services/ml_service.dart';

class PageSource extends StatefulWidget {
  @override
  _PageSourceState createState() => _PageSourceState();
}

class _PageSourceState extends State<PageSource> {
  MLService _mlService = MLService();
  FilePickerService _filePickerService = FilePickerService();

  Uint8List? defaultData = Uint8List(0);
  Uint8List? transformedData = Uint8List(0);

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("STT"), actions: [
          IconButton(
            icon: const Icon(Icons.waves),
            onPressed: selectFile,
          )
        ]),
        body: SingleChildScrollView(
            child: Column(children: [
          loadwav(defaultData),
          const Icon(
            Icons.keyboard_arrow_down,
            size: 50,
          ),
          loadwav(transformedData)
        ])));
  }

  Widget loadwav(Uint8List? wavData) {
    if (wavData == null) {
      return Center(
          child: Container(
              child: Text('no files', style: TextStyle(fontSize: 18))));
    } else if (wavData.isEmpty) {
      return Center(
          child: Column(children: [
        CircularProgressIndicator(),
        SizedBox(
          height: 5,
        ),
        const Text('Loading'),
      ]));
    } else {
      return Center(
          child: Text("file uploaded", style: TextStyle(fontSize: 18)));
    }
  }

  void selectFile() async {
    setState(() {
      defaultData = Uint8List(0);
      transformedData = Uint8List(0);
    });

    var inputWav = await _filePickerService.files();

    if (inputWav != null) {
      setState(() {
        defaultData = inputWav;
      });

      var transcript = await _mlService.convert2Text(inputWav);

      setState(() {
        if (transcript == null) {
          transformedData = null;
        } else {
          transformedData = transcript;
        }
      });
    } else {
      setState(() {
        defaultData = null;
        transformedData = null;
      });
    }
  }
}
