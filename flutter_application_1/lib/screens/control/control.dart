import 'package:flutter/material.dart';

class Control extends StatefulWidget {
  const Control({super.key});

  @override
  State<Control> createState() => _ControlState();
}

class _ControlState extends State<Control> {
  final double horizontalPadding = 40.0;
  final double verticalPadding = 25.0;

  //list of smart devices
  List mySmartDevices = [
    ["Smart Light", "lib/icons/light_bulb.png", true],
    ["Smart AC", "lib/icons/calendar.png", true],
    ["Smart TV", "lib/icons/camera.png", true],
    ["Smart Fan", "lib/icons/fan_64.png", true],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //custom app bar
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: verticalPadding),
              child: Row(
                children: [
                  //menu icon
                  Image.asset('lib/icons.menu.png',
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.blue,
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
