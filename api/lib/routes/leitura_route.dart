import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../models/leitura.dart';
import '../repositories/leitura_repository.dart';

final leituraRepository = LeituraRepository();

Future<Response> criarLeitura(Request request) async {
  try {
    final body = await request.readAsString();

    final json = jsonDecode(body);

    final leitura = Leitura.fromJson(json);

    await leituraRepository.salvar(leitura);

    return Response(
      201,
      body: jsonEncode({
        'message': 'Leitura salva com sucesso',
        'data': leitura.toJson(),
      }),
      headers: {
        'content-type': 'application/json',
      },
    );
  } catch (e) {
    return Response(
      400,
      body: jsonEncode({
        'error': 'Não foi possível salvar a leitura',
        'message': e.toString(),
      }),
      headers: {
        'content-type': 'application/json',
      },
    );
  }
}