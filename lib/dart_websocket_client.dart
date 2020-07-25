import 'dart:io';

class DartWebSocketClient {
  WebSocket _ws;

  DartWebSocketClient() {
    //Open the websocket and attach the callbacks
    WebSocket.connect('ws://192.168.0.2').then((WebSocket socket) {
      _ws = socket;
      _ws.listen(_onMessage, onDone: connectionClosed);
    });
  }

  void _onMessage(String message) {
    print(message);
  }

  void connectionClosed() {
    print('Connection to server closed');
  }

  void add(String message) => _ws.add(message);
}
