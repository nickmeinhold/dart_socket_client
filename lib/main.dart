import 'package:dart_socket_client/dart_socket_client.dart';
import 'package:dart_socket_client/dart_websocket_client.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Client',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _count = 0;
  final client = DartWebSocketClient();

  Future<void> initClient() async {}

  @override
  void initState() {
    super.initState();
    initClient();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dart Socket Client'),
      ),
      body: Center(
        child: Text('Client'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() => _count++);
        },
        tooltip: 'Connect',
        child: Icon(Icons.add),
      ),
    );
  }
}
