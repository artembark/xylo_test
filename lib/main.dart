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
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    instrument = false;
                  });
                },
                child: Text('Xylophone'),
              ),
              SizedBox(
                width: 50,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    instrument = true;
                  });
                },
                child: Text('Drums'),
              ),
            ],
          ),
        ),
        body: instrument ? drumMachine() : xylophone(),
      ),
    );
  }

  GridView drumMachine() {
    return GridView(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      children: [
        buildExpanded(color: Colors.red, fileName: 'kick.wav', title: 'Kick'),
        buildExpanded(
            color: Colors.green, fileName: 'snare.wav', title: 'Snare'),
        buildExpanded(
            color: Colors.blue, fileName: 'hat_open.wav', title: 'Open Hat'),
        buildExpanded(
            color: Colors.grey,
            fileName: 'hat_closed.wav',
            title: 'Closed Hat'),
        buildExpanded(
            color: Colors.teal, fileName: 'magic_music.mp3', title: ''),
        buildExpanded(
            color: Colors.yellow, fileName: 'magic_music.mp3', title: ''),
        buildExpanded(
            color: Colors.orange, fileName: 'magic_music.mp3', title: ''),
      ],
    );
  }

  xylophone() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildExpanded(
            color: Colors.red, fileName: 'magic_music.mp3', title: ''),
        buildExpanded(
            color: Colors.green, fileName: 'magic_music.mp3', title: ''),
        buildExpanded(
            color: Colors.blue, fileName: 'magic_music.mp3', title: ''),
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
      child: Text(
        title,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
      ),
    );
  }

  playFile(String fileName) async {
    final player = AudioCache();
    AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
    audioPlayer = await player.play(fileName);
  }
}
