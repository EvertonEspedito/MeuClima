import 'package:shelf/shelf.dart';

Response healthCheck(Request request) {
  return Response.ok(
    '{"status":"online"}',
    headers: {
      'content-type': 'application/json',
    },
  );
}