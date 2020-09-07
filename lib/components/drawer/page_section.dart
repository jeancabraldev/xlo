import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo/components/drawer/page_tile.dart';
import 'package:xlo/stores/page_store.dart';

// ignore: use_key_in_widget_constructors
class PageSection extends StatelessWidget {
  final PageStore pageStore = GetIt.I<PageStore>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTile(
          label: 'Anúncios',
          icon: FontAwesomeIcons.list,
          onTap: () => pageStore.setPage(0),
          highLighted: pageStore.page == 0,
        ),
        PageTile(
          label: 'Inserir Anúncio',
          icon: FontAwesomeIcons.edit,
          onTap: () => pageStore.setPage(1),
          highLighted:  pageStore.page == 1,
        ),
        PageTile(
          label: 'Chat',
          icon: FontAwesomeIcons.comments,
          onTap: () => pageStore.setPage(2),
          highLighted:  pageStore.page == 2,
        ),
        PageTile(
          label: 'Favoritos',
          icon: FontAwesomeIcons.heart,
          onTap: () => pageStore.setPage(3),
          highLighted:  pageStore.page == 3,
        ),
        PageTile(
          label: 'Minha Conta',
          icon: FontAwesomeIcons.user,
          onTap: () => pageStore.setPage(4),
          highLighted:  pageStore.page == 4,
        ),
      ],
    );
  }
}