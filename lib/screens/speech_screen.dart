import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class SpeechScreen extends StatelessWidget {
  // インスタンス変数
  FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: RaisedButton(
        child: Text("Press this button to say hello"),
        onPressed: () => speak(),
      ),
    )
  }
}
