import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xlo/models/city.dart';
import 'package:xlo/models/uf.dart';

class IBGERepository {
  //Lista de estados
  Future<List<UF>> getUFList() async {
    final preferences = await SharedPreferences.getInstance();

    //Verificando a existência de uma chave de listas de estados salva no dispositivo
    if (preferences.containsKey('UF_LIST')) {
      //convertendo a lista de estados para json
      final j = json.decode(preferences.get('UF_LIST'));

      return j.map<UF>((j) => UF.fromJson(j)).toList()
        ..sort((UF a, UF b) =>
            a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    }
    const endpoint =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados';

    try {
      final response = await Dio().get<List>(endpoint);

      //Salvando a lista de estados no preferences
      preferences.setString('UF_LIST', json.encode(response.data));

      return response.data.map<UF>((j) => UF.fromJson(j)).toList()
        ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    } on DioError {
      return Future.error('Erro ao carregar os Estados, verifique sua conexão');
    }
  }

  //Lista de cidades por estado
  Future<List<City>> getCityListFromAPI(UF uf) async {
    final String endpoint =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados/${uf.id}/municipios';

    try {
      final response = await Dio().get<List>(endpoint);

      final cityList = response.data.map<City>((j) => City.fromJson(j)).toList()
        ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

      return cityList;
    } on DioError {
      return Future.error('Erro ao carregar as cidades, verifique sua conexão');
    }
  }
}
