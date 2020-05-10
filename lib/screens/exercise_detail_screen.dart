// import 'package:audioplayers/audio_cache.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_lakh/screens/hub_json.dart';
import 'package:flutter/material.dart';

class ExerciseDetailScreen extends StatefulWidget {

  final Exercises exercises;
  final int seconds;
  
ExerciseDetailScreen({this.exercises,this.seconds});

  @override
  _ExerciseDetailScreenState createState() => _ExerciseDetailScreenState();
}

class _ExerciseDetailScreenState extends State<ExerciseDetailScreen> {
   Timer timer;
   int _stepSeconds=0;
   bool _isCompleted=false;

  @override
  void initState() { 


 timer = Timer.periodic(
      Duration(seconds: 1),
      (t) {

        if(t.tick==widget.seconds){
          
          _isCompleted=true;
        }
        setState(() {
          
        _stepSeconds=t.tick;
        });
      });

    super.initState();
    
  }
  
  //   AudioPlayer audioPlayer = AudioPlayer();
  // AudioCache audioCache = AudioCache();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Stack(
          children: <Widget>[
                      _isCompleted==false?Center(
          child: CachedNetworkImage(
              imageUrl: widget.exercises.gif,
              placeholder: (context, url) => Image(
                image: AssetImage("assets/placeholder.jpg"),
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
              
              width: MediaQuery.of(context).size.width,
            ),):SafeArea(child:Container(
              alignment: Alignment.center,
              child:
          TypewriterAnimatedTextKit(
               speed: Duration(milliseconds: 200),
               totalRepeatCount: 1,
                text: [" Exercise successfully completed "],
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color:Color(0xFFC51161)),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
                onTap: (){
                  Navigator.of(context).pop();
                },
                
)
              
              )),

                  _isCompleted!=true?SafeArea(
                      child: Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 50.0),
              child: Text("$_stepSeconds/${widget.seconds} S",style: TextStyle(
                fontWeight: FontWeight.bold,
                color:Color(0xFFC51161),
                fontSize: 20,
              ),),
            ),
          ):Container(),



          
          ],
             
          ),
    );
  }
}