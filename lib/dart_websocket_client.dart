import 'dart:io';

class DartWebSocketClient {
  WebSocket _ws;

  DartWebSocketClient() {
    //Open the websocket and attach the callbacks
    WebSocket.connect('ws://192.168.0.39').then((WebSocket socket) {
      _ws = socket;
      _ws.listen(_onMessage, onDone: connectionClosed);
    });
  }

  void _onMessage(dynamic message) {
    print(message);
  }

  void connectionClosed() {
    print('Connection to server closed');
  }

  void add(String message) => _ws.add(message);
}
