import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:time_record/screens/circular_countdown_timer_practice.dart';
import 'package:time_record/screens/countdown_timer2.dart';
import 'package:time_record/screens/gauge_practice.dart';
import 'package:time_record/screens/numberPicker_practice.dart';
import 'package:time_record/screens/timePicker_practice.dart';
import 'package:time_record/screens/timer_screen.dart';
import 'package:time_record/screens/timer_practice.dart';

// 앱에서 지원하는 언어 리스트 변수
final supportedLocales = [const Locale('en', 'US'), const Locale('ko', 'KR')];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // easylocalization 초기화!
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        // 지원 언어 리스트
        supportedLocales: supportedLocales,
        //path: 언어 파일 경로
        path: 'assets/translations',
        //fallbackLocale supportedLocales에 설정한 언어가 없는 경우 설정되는 언어
        fallbackLocale: const Locale('en', 'US'),

        //startLocale을 지정하면 초기 언어가 설정한 언어로 변경됨
        //만일 이 설정을 하지 않으면 OS 언어를 따라 기본 언어가 설정됨
        //startLocale: Locale('ko', 'KR')

        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'time record',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home:  MyHomePage(title: 'Flutter Demo Home Page'),
      //home: const TimerScreen(),
      //home: Homepage(),
      //home: numberpick(),
      home: CountdownPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(Localizations.localeOf(context));
    return Localizations.override(
      context: context,
      locale: const Locale("ko"),
      child: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('tttt'),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("test").tr(),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              OutlinedButton.icon(
                onPressed: () {
                  // 영어로 언어 변경
                  // 이후 앱을 재시작하면 영어로 동작
                  EasyLocalization.of(context)!
                      .setLocale(const Locale('en', 'US'));
                },
                icon: const Icon(Icons.language_outlined),
                label: Text(
                  'english'.tr(),
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {
                  // 한국어로 언어 변경
                  // 이후 앱을 재시작하면 한국어로 동작
                  EasyLocalization.of(context)!
                      .setLocale(const Locale('ko', 'KR'));
                },
                icon: const Icon(Icons.language_outlined),
                label: Text(
                  'korean'.tr(),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
