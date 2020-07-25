# dart_socket_client

Experimenting with Dart Sockets, using Flutter apps as client and server.

## Context 

Experimenting with sockets so that we can (potentially) use sockets to do video file transfer over a local network in [CrowdLeague](https://github.com/nickmeinhold/crowdleague).

## Command Line Chat App 

### Run the server 

To run the command line chat app `server`, download [dart_socket_server](https://github.com/nickmeinhold/dart_socket_server) and run:

```sh
dart chat_server.dart
```

### Run the client

To run a command line chat app `client`, download this repo and run:

```sh
dart chat_client.dart
```

Open at least 2 clients, send a message and you will see the message in the other client. 