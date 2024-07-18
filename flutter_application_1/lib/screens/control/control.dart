import 'package:flutter/material.dart';
import 'package:flutter_application_1/util/smart_device_box.dart';

class Control extends StatefulWidget {
  const Control({super.key});

  @override
  State<Control> createState() => _ControlState();
}

class _ControlState extends State<Control> {
  final double horizontalPadding = 24.0;

  final double verticalPadding = 34.0;

  //list of smart devices
  List mySmartDevices = [
    ["Smart Light", "lib/icons/light_bulb.png", true],
    ["Smart AC", "lib/icons/calendar.png", true],
    ["Smart TV", "lib/icons/camera.png", false],
    ["Smart Fan", "lib/icons/fan_64.png", true],
  ];

  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //custom app bar
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: verticalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //menu icon
                  Image.asset('lib/icons/menu.png',
                      height: 45, color: Colors.grey[800]),

                  //account icon
                  Icon(Icons.person, size: 45, color: Colors.grey[800]),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //welcome home
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome,'),
                  Text(
                    'Nottingham',
                    style: TextStyle(fontSize: 40),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //smart defvices + grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: const Text('Smart devices'),
            ),
            Expanded(
                child: GridView.builder(
                    itemCount: mySmartDevices.length,
                    
                    padding: const EdgeInsets.all(24.0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, ),
                    itemBuilder: (context, index) {
                      return SmartDeviceBox(
                        smartDeviceName: mySmartDevices[index][0],
                        iconPath: mySmartDevices[index][1],
                        powerOn: mySmartDevices[index][2],
                        onChanged: (value) => powerSwitchChanged(value, index),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
