import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_static/shelf_static.dart';
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Service {
  Handler get handler {
    final router = Router();

    router.get('/getdemo', (r) {
      return Response.ok('body');
    });

    router.get('/getdemo<n|[1-9][0-9]+>', (r, String n) {
      return Response.ok(
        jsonEncode({'n': int.parse(n)}),
        headers: {'Content-Type': 'application/json'},
      );
    });

    router.post('/postdemo', (r) {
      Response.ok(
        jsonEncode({'aaa': '22222'}),
        headers: {'Content-Type': 'application/json'},
      );
    });

    // websocket
    var socket = webSocketHandler((webSocket) {
      webSocket.stream.listen((message) {
        webSocket.sink.add("echo $message");
      });
    });
    router.all('/ws', socket);

    // 静态文件
    router.all(
        '/<ignored|.*>',
        createStaticHandler(
          'public',
          defaultDocument: 'index.html',
        ));

    return router;
  }
}
