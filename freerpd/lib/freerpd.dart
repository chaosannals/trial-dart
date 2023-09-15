import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_static/shelf_static.dart';

Response respond(Object? data) {
  return Response.ok(jsonEncode(data));
}

class FreerpServer {
  Handler get handler {
    final router = Router();

    router.all(
        '/<n>',
        createStaticHandler(
          'pub',
          defaultDocument: 'index.html',
        ));
    return router;
  }
}
