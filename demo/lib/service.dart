import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_static/shelf_static.dart';

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

    router.all(
        '/<ignored|.*>',
        createStaticHandler(
          'public',
          defaultDocument: 'index.html',
        ));

    return router;
  }
}
