import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RadioLoginWedgit extends StatefulWidget {
  // const RadioLoginWedgit({Key? key}) : super(key: key);
  Object? value;
  VoidCallback? function;
  // ignore: use_key_in_widget_constructors
  RadioLoginWedgit(Object? value, VoidCallback? function) {
    // ignore: prefer_initializing_formals
    this.value = value;
    // ignore: prefer_initializing_formals
    this.function = function;
  }
  @override
  State<RadioLoginWedgit> createState() => _RadioLoginWedgitState();
}

class _RadioLoginWedgitState extends State<RadioLoginWedgit> {
  Object? val = -1;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Radio(
            value: widget.value!,
            groupValue: val,
            onChanged: (value) {
              setState(() {
                val = value;
              });
            },
            activeColor: Colors.green,
          ),
          const Text("مشرف وزارة"),
        ],
      ),
    );
  }
}
