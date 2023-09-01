import 'package:flutter/material.dart';

class MyHomePage3 extends StatefulWidget {
  const MyHomePage3({Key? key}) : super(key: key);

  @override
  _MyHomePage3State createState() => _MyHomePage3State();
}

class _MyHomePage3State extends State<MyHomePage3> {
  var _selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TimePicker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Future<TimeOfDay?> selectedTime = showTimePicker(
                    context:
                        context, // context 는 Future 타입으로 TimeOfDay 타입의 값을 반환 합니다
                    initialTime: TimeOfDay.now(), // 프로퍼티에 초깃값을 지정합니다.
                  );
                  selectedTime.then((value) {
                    setState(() {
                      _selectedTime = '${value?.hour} : ${value?.minute}';
                    });
                  });
                },
                child: const Text('Time Picker'),
              ),
              Text('$_selectedTime'),
            ],
          ),
        ),
      ),
    );
  }
}
