import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});


  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  int a = 0;
  int b = 0;
  num c = 0;

  late final AppLifecycleListener _listener;

  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();

  @override
  void initState() {
    super.initState();

    displayOneController.text = a.toString();
    displayTwoController.text = b.toString();

    _listener = AppLifecycleListener(
      onShow: _onShow,
      onHide: _onHide,
      onResume: _onResume,
      onDetach: _onDetach,
      onInactive: _onInactive,
      onPause: _onPause,
      onRestart: _onRestart,
      onStateChange: _onStateChanged,
      // onExitRequested: _onExitRequested,
    );
  }

  void _onShow() => print("onShow Called");
  void _onHide() => print("onHide Called");
  void _onResume() => print("onResume Called");
  void _onDetach() => print("onDetach Called");
  void _onInactive() => print("onInactive Called");
  void _onPause() => print("onPause Called");
  void _onRestart() => print("onRestart Called");
  void _onStateChanged(AppLifecycleState value) {
    print("onStateChanged Called with state : $value");
  }


  @override
  void dispose() {
    displayOneController.dispose();
    displayTwoController.dispose();
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          CalculatorDisplay(
              key: Key("displayOne"),
              hint: "Enter First Number", controller: displayOneController),
          const SizedBox(height: 30),
          CalculatorDisplay(
              key: Key("displayTwo"),
              hint: "Enter Second Number", controller: displayTwoController),
          const SizedBox(height: 30),
          Text(
            key:Key("result"),
            c.toString(),
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    c = num.tryParse(displayOneController.text)! +
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: Icon(CupertinoIcons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    c = num.tryParse(displayOneController.text)! -
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: Icon(CupertinoIcons.minus),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    c = num.tryParse(displayOneController.text)! *
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: Icon(CupertinoIcons.multiply),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    c = num.tryParse(displayOneController.text)! /
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: Icon(CupertinoIcons.divide),
              ),
            ],
          ),
          SizedBox(height: 10,),
          FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                a = 0;
                b = 0;
                c = 0 ;
                displayOneController.clear();
                displayTwoController.clear();
              });
            },
            label: Text("Clear"),
          ),
        ],
      ),
    );
  }


}

class CalculatorDisplay extends StatelessWidget {
  const CalculatorDisplay(
      {super.key, this.hint = "Enter A Number", required this.controller});

  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 3.0),
              borderRadius: BorderRadius.circular(10)),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.black)),
    );
  }
}
