import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const XyloApp());
}

class XyloApp extends StatefulWidget {
  const XyloApp({Key? key}) : super(key: key);

  @override
  State<XyloApp> createState() => _XyloAppState();
}

class _XyloAppState extends State<XyloApp> {
  bool instrument = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: GestureDetector(
            onTap: () {
              setState(() {
                instrument = !instrument;
              });
            },
            child: Text('Change instrument'),
          ),
        ),
        body: drumMachine(),
      ),
    );
  }

  GridView drumMachine() {
    return GridView(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      children: [
        buildExpanded(
            color: Colors.red, fileName: 'magic_music.mp3', title: ''),
        buildExpanded(
            color: Colors.green, fileName: 'magic_music.mp3', title: ''),
        buildExpanded(
            color: Colors.blue, fileName: 'magic_music.mp3', title: ''),
        buildExpanded(
            color: Colors.black, fileName: 'magic_music.mp3', title: ''),
        buildExpanded(
            color: Colors.teal, fileName: 'magic_music.mp3', title: ''),
        buildExpanded(
            color: Colors.yellow, fileName: 'magic_music.mp3', title: ''),
        buildExpanded(
            color: Colors.orange, fileName: 'magic_music.mp3', title: ''),
      ],
    );
  }

  buildExpanded({
    required Color color,
    required String fileName,
    required String title,
  }) {
    return TextButton(
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(color)),
      onPressed: () {
        playFile(fileName);
      },
      child: Text(title),
    );
  }

  playFile(String fileName) {
    final player = AudioCache();
    player.play(fileName);
  }
}
