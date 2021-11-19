import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const XyloApp());
}

class XyloApp extends StatelessWidget {
  const XyloApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildExpanded(
                color: Colors.red, fileName: 'magic_music.mp3', title: ''),
            buildExpanded(
                color: Colors.green, fileName: 'magic_music.mp3', title: ''),
            buildExpanded(
                color: Colors.blue, fileName: 'magic_music.mp3', title: ''),
          ],
        )),
      ),
    );
  }

  Expanded buildExpanded({
    required Color color,
    required String fileName,
    required String title,
  }) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color)),
        onPressed: () {
          playFile(fileName);
        },
        child: Text(title),
      ),
    );
  }

  playFile(String fileName) {
    final player = AudioCache();
    player.play(fileName);
  }
}
