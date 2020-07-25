import 'dart:io';

class DartSocketClient {
  Socket _socket;

  DartSocketClient();

  Future<Socket> init() async => Socket.connect('0.0.0.0', 6677);

  void add(String value) => _socket.write(value);
}
