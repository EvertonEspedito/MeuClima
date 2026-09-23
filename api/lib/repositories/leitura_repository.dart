import 'package:postgres/postgres.dart';

import '../database/database.dart';
import '../models/leitura.dart';

class LeituraRepository {
  Future<void> salvar(Leitura leitura) async {
    final connection = await Database.connection;

    await connection.execute(
      Sql.named('''
        INSERT INTO leituras (
          device_id,
          bairro,
          temperatura,
          umidade,
          pressao,
          timestamp
        )
        VALUES (
          @device_id,
          @bairro,
          @temperatura,
          @umidade,
          @pressao,
          @timestamp
        )
      '''),
      parameters: {
        'device_id': leitura.deviceId,
        'bairro': leitura.bairro,
        'temperatura': leitura.temperatura,
        'umidade': leitura.umidade,
        'pressao': leitura.pressao,
        'timestamp': leitura.timestamp,
      },
    );
  }
}