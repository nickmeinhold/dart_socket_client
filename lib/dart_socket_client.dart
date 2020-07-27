import 'dart:async';
import 'dart:io';

// class DartSocketClient {
//   DartSocketClient() {
//     // Check that we can connect to google
//     Socket.connect('google.com', 80).then((socket) {
//       print('Connected to google at: '
//           '${socket.remoteAddress.address}:${socket.remotePort}');
//       socket.destroy();
//     });

//     Socket.connect('192.168.0.2', 45448).then((socket) {
//       print(socket.runtimeType);
//       // data to server:
//       socket.write('Hello, World from a client!');
//       // data from server:
//       socket.listen(_onData);
//     });
//   }

//   _onData(List<int> data) {
//     print(String.fromCharCodes(data));
//   }
// }

class DartSocketClient {
  Socket _socket;

  DartSocketClient() {
    Socket.connect('192.168.0.6', 4567).then((Socket sock) {
      _socket = sock;
      _socket.listen(_dataHandler,
          onError: _errorHandler, onDone: _doneHandler, cancelOnError: false);
    }).catchError((e) {
      print("Unable to connect: $e");
      exit(1);
    });
  }

  void _dataHandler(data) {
    print(new String.fromCharCodes(data).trim());
  }

  void _errorHandler(error, StackTrace trace) {
    print(error);
  }

  void _doneHandler() {
    _socket.destroy();
    exit(0);
  }

  void send(String message) {
    _socket.write(message + '\n');
  }
}
