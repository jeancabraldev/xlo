import 'package:mobx/mobx.dart';
import 'package:xlo/models/category.dart';
import 'package:xlo/repositories/category_repository.dart';

part 'category_store.g.dart';

class CategoryStore = _CategoryStore with _$CategoryStore;

abstract class _CategoryStore with Store {
  _CategoryStore() {
    _loadCategories();
  }

  ObservableList<Category> categoryList = ObservableList<Category>();

  //Criando uma categoria extra "Todas" que será exibita somente no app, essa
  //categoria servirá para filtros futuramente
  @computed
  List<Category> get allCategoryList => List.from(categoryList)
    ..insert(0, Category(id: '*', description: 'Todas'));

  @action
  setCategories(List<Category> categories) {
    categoryList.clear(); //limpando lista
    categoryList.addAll(categories); //adicionando categorias
  }

  @observable
  String error;

  @action
  void setError(String value) => error = value;

  //Salvando as categorias na memória do celular, será salvo sempre que o usuário
  //abrir o app
  Future<void> _loadCategories() async {
    try {
      //Obtendo a lista de categorias do Parse
      final categories = await CategoryRepository().getList();
      setCategories(categories);
    } catch (e) {
      setError(e);
    }
  }
}
