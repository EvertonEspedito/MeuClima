import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';

import '../lib/routes/health_route.dart';
import '../lib/routes/leitura_route.dart';

void main() async {
  print('DB_HOST: ${const String.fromEnvironment('DB_HOST')}');
  print('DB_PORT: ${const String.fromEnvironment('DB_PORT')}');
  print('DB_NAME: ${const String.fromEnvironment('DB_NAME')}');
  print('DB_USER: ${const String.fromEnvironment('DB_USER')}');

  final senha = const String.fromEnvironment('DB_PASSWORD');
  print('DB_PASSWORD informado: ${senha.isNotEmpty}');
  print('Tamanho da senha: ${senha.length}');
  print('Último caractere: ${senha.isNotEmpty ? senha[senha.length - 1] : 'VAZIO'}');


  final router = Router();

  router.get('/api/health', healthCheck);
  router.get('/api/v1/leituras', listarLeituras);
  router.post('/api/v1/leituras', criarLeitura);

  final handler = const Pipeline()
      .addMiddleware(logRequests())
      .addHandler(router.call);

  final server = await shelf_io.serve(
    handler,
    '0.0.0.0',
    8080,
  );

  print(
    'API rodando em http://${server.address.host}:${server.port}',
  );
}