import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo/screens/category/category_screen.dart';
import 'package:xlo/stores/create_store.dart';

class CategoryField extends StatelessWidget {
  CategoryField(this.createStore);

  final CreateStore createStore;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ListTile(
        title: createStore.category == null
            ? Text(
                'Categoria',
                style: TextStyle(
                  color: Colors.grey,
                ),
              )
            : Text(
                'Categoria',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
        subtitle: createStore.category == null
            ? null
            : Text(
                '${createStore.category.description}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
        trailing: Icon(Icons.keyboard_arrow_down),
        onTap: () async {
          final category = await showDialog(
            context: context,
            builder: (_) => CategoryScreen(
              showAll: false,
              selected: createStore.category,
            ),
          );
          if (category != null) {
            createStore.setCategory(category);
          }
        },
      );
    });
  }
}
