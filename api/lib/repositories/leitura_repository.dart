
import 'package:postgres/postgres.dart';

import '../database/database.dart';
import '../models/leitura.dart';

class LeituraRepository {

  // Salvar uma nova leitura no PostgreSQL
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

  // Listar todas as leituras armazenadas
  Future<List<Leitura>> listar() async {
    final connection = await Database.connection;

    final results = await connection.execute(
      Sql.named('''
        SELECT
          device_id,
          bairro,
          temperatura,
          umidade,
          pressao,
          timestamp
        FROM leituras
        ORDER BY timestamp DESC
      '''),
    );

    return results.map((row) {
      return Leitura(
        deviceId: row[0] as String,
        bairro: row[1] as String,
        temperatura: double.parse(row[2].toString()),
        umidade: double.parse(row[3].toString()),
        pressao: double.parse(row[4].toString()),
        timestamp: row[5] as DateTime,
      );
    }).toList();
  }
}
