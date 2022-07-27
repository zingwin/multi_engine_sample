import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  late MethodChannel _channel;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();

    _channel = const MethodChannel('multi_engine_sample_channel');
    _channel.setMethodCallHandler((call) async {
      if (call.method == "setCount") {
      } else {
        throw Exception('not implemented ${call.method}');
      }
    });
  }

  void goWebTap() {
    _channel.invokeMethod<void>("goweb", {"url": "https://baidu.com"});
  }

  void goDetailTap() {
    _channel.invokeMethod<void>("godetail", {"id": "123"});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Home Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Home Page"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
              ElevatedButton(onPressed: goWebTap, child: const Text('go web')),
              ElevatedButton(
                  onPressed: goDetailTap, child: const Text('go detail')),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), //
      ),
    );
  }
}
