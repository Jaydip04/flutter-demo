import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget{
  const HomeView ({super.key});

  @override
  Widget build (BuildContext context){
    return Material(
      child: Container(
        color: Colors.deepOrange,
        child: const Center(
          child: Text("Hello World",style: TextStyle(
            fontSize: 40,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),),
        ),
      ),
    );
  }
}