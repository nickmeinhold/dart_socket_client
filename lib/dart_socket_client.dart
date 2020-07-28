import 'dart:io';

class DartSocketClient {
  Socket _socket;

  DartSocketClient() {
    Socket.connect('192.168.0.39', 4567).then((Socket sock) {
      _socket = sock;
      _socket.listen(_dataHandler,
          onError: _errorHandler, onDone: _doneHandler, cancelOnError: false);
    }).catchError((dynamic e) {
      print('Unable to connect: $e');
    });
  }

  void _dataHandler(List<int> data) {
    print(String.fromCharCodes(data).trim());
  }

  void _errorHandler(dynamic error, StackTrace trace) {
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
