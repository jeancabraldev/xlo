import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo/models/category.dart';
import 'package:xlo/repositories/parse_errors.dart';
import 'package:xlo/repositories/table_keys.dart';

class CategoryRepository {
  //Retornando as categorias do bando de dados
  Future<List<Category>> getList() async {
    final queryBuilder = QueryBuilder(ParseObject(keyCategoryTable))
      ..orderByAscending(keyCategoryDescription);

    //Executando query
    final response = await queryBuilder.query();

    //Verificando se a query retornou true
    if (response.success) {
      //transformando o objeto do ParseObject em um objeto do tipo Category
      return response.results.map((p) => Category.fromParse(p)).toList();
    } else {
      //retornando erro
      throw ParseErrors.getDescription(response.error.code);
    }
  }
}
