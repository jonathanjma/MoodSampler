import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MoodSamplerApp());

String userName = 'Robert';
class MoodSamplerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood Sampler',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: Home()
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {

  Color color = Color.fromARGB(255, 203, 153, 126);  // brown => relaxation/well-being

  void setColor(Color color) {
    this.color = color;
  }

  void rebuild() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: new Padding(
        padding: new EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 25),
              Text(
                'Hi $userName!\nHow are you feeling today?',
                style: TextStyle(color: Colors.white, fontSize: 40, height: 2),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              FittedBox(
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      child: MoodOption('Very Happy',
                          Color.fromARGB(255, 231, 111, 81), // red => excitement/activity
                          FontAwesomeIcons.laughBeam, this),
                    ),
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      child: MoodOption('Happy',
                          Color.fromARGB(255, 244, 162, 97), // orange => joy/warmth
                          FontAwesomeIcons.smile, this),
                    ),
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      child: MoodOption('OK',
                          Color.fromARGB(255, 233, 196, 106), // yellow => relief/openness
                          FontAwesomeIcons.meh, this),
                    ),
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      child: MoodOption('Sad',
                          Color.fromARGB(255, 42, 157, 143), // green => constraint/steadiness
                          FontAwesomeIcons.frown, this),
                    ),
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      child: MoodOption('Very Sad',
                          Color.fromARGB(255, 38, 70, 83), // blue => calmness/quiet
                          FontAwesomeIcons.sadTear, this),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MoodOption extends StatefulWidget {

  String name;
  Color color;
  HomeState homeState;
  IconData buttonFace;
  MoodOption(this.name, this.color, this.buttonFace, this.homeState);

  @override
  State<MoodOption> createState() => MoodOptionState();
}

class MoodOptionState extends State<MoodOption> {

  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ElevatedButton.styleFrom(
          fixedSize: Size(clicked ? 115 : 85, clicked ? 115 : 85),
          primary: Colors.brown[50],
          onPrimary: widget.color),
      onPressed: () {
        print('$widget.name was pressed!');
        widget.homeState.setColor(widget.color);
        widget.homeState.rebuild();
        clicked = !clicked;
      },
      child: Icon(
        widget.buttonFace,
        color: widget.color,
        size: clicked ? 85 : 60,
      ),
    );
  }
}