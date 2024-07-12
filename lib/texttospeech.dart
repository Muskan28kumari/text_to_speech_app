import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  final TextEditingController _text = TextEditingController();
  final FlutterTts flutterTts = FlutterTts();

  //function for speaking the text
  speak(String _text) async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(2); //0.5 to 1.5
    await flutterTts.speak(_text);
  }

/*English:
Locale: 'en-US' (English US)
Locale: 'en-GB' (English UK)
'hi-IN' (Hindi India).
'mr-IN' (Marathi India). */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade100,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Text to speech app'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('WELCOME TO THE TEXT TO SPEECH CONVERTING MODEL',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15)),
            SizedBox(
              height: 10,
            ),
            /*Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('TEXT'),
                Icon(Icons.change_circle_outlined),
                Text('SPEECH'),
              ],
            ),*/
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                labelText: 'Enter your Text',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              controller: _text,
              cursorColor: Colors.amber,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.red, // Set the background color of the button
                ),
                onPressed: () {
                  speak(_text.text);
                },
                child: Text(
                  'Turn into speech',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
