import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Expanded buildKey({int soundNumber, Color color,String alphabet}) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          playSound(soundNumber);
        },
        child: Text(
          alphabet,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30.0),
          textAlign: TextAlign.start,
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('XYLOPHONE'),
          ),
          backgroundColor: Colors.black,
          toolbarHeight: 40.0,
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(soundNumber: 1, color: Colors.red, alphabet: 'G'),
              buildKey(soundNumber: 2, color: Colors.orange, alphabet: 'D'),
              buildKey(soundNumber: 3, color: Colors.yellow, alphabet: 'E'),
              buildKey(soundNumber: 4, color: Colors.green, alphabet: 'F'),
              buildKey(soundNumber: 5, color: Colors.blue, alphabet: 'A'),
              buildKey(soundNumber: 6, color: Colors.indigo, alphabet: 'B'),
              buildKey(soundNumber: 7, color: Colors.purple, alphabet: 'C'),
            ],
          ),
        ),
      ),
    );
  }
}
