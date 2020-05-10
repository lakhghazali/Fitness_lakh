import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_lakh/screens/hub_json.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import 'exercise_detail_screen.dart';


class ExerciceScreen extends StatefulWidget {
  final Exercises exercises;
  ExerciceScreen({this.exercises});

  @override
  _ExerciceScreenState createState() => _ExerciceScreenState();
}

class _ExerciceScreenState extends State<ExerciceScreen> {
    int seconds = 10;
    final RoundedLoadingButtonController _btnController = new RoundedLoadingButtonController();



  @override
  void dispose() { 
  
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return 

       Scaffold(
                body: Container(
                                   height:MediaQuery.of(context).size.height,
                                   width: MediaQuery.of(context).size.width,
                  child: Stack(
                     children: <Widget>[     
                            CachedNetworkImage(
                           imageUrl: widget.exercises.thumbnail,
                                        placeholder: (context, url) => Image(
                                          image: AssetImage("assets/placeholder.jpg"),
                                          fit: BoxFit.cover,
                                          height:MediaQuery.of(context).size.height,
                                          width: MediaQuery.of(context).size.width,
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                        fit: BoxFit.cover,
                                        height: MediaQuery.of(context).size.height,
                                        width: MediaQuery.of(context).size.width,
                            ),
                            
                           //  ),
                              Positioned(
                              bottom: 10,
                              left: 100,
                              
                              child: SleekCircularSlider(
                                appearance: CircularSliderAppearance(
                                        spinnerMode: false,
                                            ),
                                min: 10.0,
                                initialValue: 30,
                                max: 60.0,
                              onChange: (double value) {
                                  seconds=value.toInt();
                                    } ,
                       innerWidget: (double value) {
                         return Container(
                           alignment: Alignment.center,
                           child: Text("${value.toInt()} S",style: TextStyle(
                             color: Color(0xFFC51161),
                             fontSize: 20,
                             fontWeight:FontWeight.bold 
                           ),),
                         );

                                    }

                              )
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: RoundedLoadingButton(
                                color:Color(0xFFC51161),
                             child: Text(' Start ', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                             controller: _btnController,
                             onPressed: _doSomething,
),

                            ),
                            
                            ] ,
                    ),
         ),
       );
  }
  void _doSomething() async{
       Timer(Duration(seconds: 5), () {
      _btnController.success();
      
    } 
    );
    
    await  fetchDetailScreen();
    
   

 
}


Future<void> fetchDetailScreen() {
  // Imagine that this function is fetching user info from another service or database
  return Future.delayed(Duration(seconds: 6), ()=> 
   Navigator.of(context).push(
                           MaterialPageRoute(builder: (context) => ExerciseDetailScreen(exercises: widget.exercises,
                          seconds: seconds,)))
  
  );
}
}