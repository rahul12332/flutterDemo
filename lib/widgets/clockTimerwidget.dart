import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClockTimerWidget extends StatefulWidget {
  const ClockTimerWidget({super.key});

  @override
  State<ClockTimerWidget> createState() => _ClockTimerWidgetState();
}

class _ClockTimerWidgetState extends State<ClockTimerWidget> {
  int timer = 0;
  Future<void> startTimer ()async{
    for(int i = 0; i<=25; i++){
      await Future.delayed(Duration(seconds: 1));
      timer = i;
      setState(() {
        print("the value of time is $i");
      });
    }
    
  }

  @override
  void initState() {
    startTimer();
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      alignment: Alignment.center,
     decoration: BoxDecoration(
       color: Colors.grey.shade200,
       borderRadius: BorderRadius.circular(25),
       border: Border.all( width: 1, color: Colors.grey)
     ), 
      child: Text(timer.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),),
      
    );
  }
}
