import 'dart:io';

class DartSocketClient {
  DartSocketClient() {
    // Check that we can connect to google
    Socket.connect('google.com', 80).then((socket) {
      print('Connected to google at: '
          '${socket.remoteAddress.address}:${socket.remotePort}');
      socket.destroy();
    });

    Socket.connect('192.168.0.2', 45448).then((socket) {
      print(socket.runtimeType);
      // data to server:
      socket.write('Hello, World from a client!');
      // data from server:
      socket.listen(_onData);
    });
  }

  _onData(List<int> data) {
    print(String.fromCharCodes(data));
  }
}
