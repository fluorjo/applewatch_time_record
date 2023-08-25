import 'dart:math';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> runningButtons = [
      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
        onPressed: () {},
        child: Text(
          1 == 2 ? 'continue'.tr() : 'stop'.tr(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(20),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
        onPressed: () {},
        child: Text(
          'give up'.tr(),
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
      ),
    ];
    final List<Widget> stoppedButtons = [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: 1 == 2 ? Colors.green : Colors.blue,
        ),
        child: Text(
          'start'.tr(),
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        onPressed: () {},
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'pomodoro'.tr(),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.height * 0.6,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: 1 == 2 ? Colors.green : Colors.blue,
            ),
            child: const Center(
              child: Text(
                '00:00',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: 1 == 2
                ? const []
                : 1 == 2
                    ? stoppedButtons
                    : runningButtons,
          )
        ],
      ),
    );
  }
}
