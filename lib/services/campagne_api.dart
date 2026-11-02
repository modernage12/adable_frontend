import 'package:http/http.dart' as http;

import 'dart:convert';

Future<List<dynamic>> recuperaCampagne() async {
  final risposta = await http.get(
    Uri.parse('http://localhost:8000/api/campagne/'),
  );

  if (risposta.statusCode != 200) {
    throw Exception("Errore nel recupero delle campagne.");
  }

  final campagne = jsonDecode(risposta.body);
  return campagne;
}

Future<void> creaCampagna({
  required String nome,
  required String piattaforma,
  required String budget,
  required int clienteId,
}) async {
  final dati = {
    'nome': nome,
    'piattaforma': piattaforma,
    'budget': budget,
    'cliente': clienteId,
  };

  final risposta = await http.post(
    Uri.parse('http://localhost:8000/api/campagne/'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(dati),
  );

  if (risposta.statusCode != 201) {
    throw Exception("Errore nella creazione: ${risposta.body}");
  }
}

Future<void> eliminaCampagna({required int id}) async {
  final risposta = await http.delete(
    Uri.parse('http://localhost:8000/api/campagne/$id/'),
  );

  if (risposta.statusCode != 204) {
    throw Exception("Errore durante la cancellazione della campagna.");
  }
}
