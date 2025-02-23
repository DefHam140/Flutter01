import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class SmartDeviceBox extends StatelessWidget {
  final String smartDeviceName;
  final String iconPath;
  final bool powerOn;
  void Function(bool)? onChanged;

  SmartDeviceBox({
    super.key,
    required this.smartDeviceName,
    required this.iconPath,
    required this.powerOn,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 256,
      child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                iconPath,
                height: 65,
              ),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(smartDeviceName,
                        style: const TextStyle(fontSize: 12)),
                  )),
                  Transform.rotate(
                    angle: pi / 2,
                    child: CupertinoSwitch(
                      value: powerOn,
                      onChanged: onChanged,
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
