import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VehicleForm extends StatefulWidget {
  const VehicleForm({super.key});

  @override
  State<VehicleForm> createState() => _VehicleFormState();
}

class _VehicleFormState extends State<VehicleForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(child: Center(child: Column(children: [],),),)
    );
  }
}