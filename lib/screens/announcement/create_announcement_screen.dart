import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xlo/components/drawer/drawer_widget.dart';
import 'package:xlo/screens/announcement/components/images_field.dart';

import 'components/text_form_field_announcement.dart';

class CreateAnnouncementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labelStyle = TextStyle(
      color: Colors.grey,
      fontSize: 16,
    );

    final contentPAdding = const EdgeInsets.fromLTRB(16, 10, 12, 10);
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: const Text('Criar Anúncio'),
        centerTitle: true,
      ),
      body: Card(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImagesField(),
            TextFormFieldAnnouncement(labelText: 'Título'),
            TextFormFieldAnnouncement(
              labelText: 'Descrição',
              maxLines: null,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                RealInputFormatter(centavos: true),
              ],
            ),
            TextFormFieldAnnouncement(
              labelText: 'Valor',
              prefixText: 'R\$ ',
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                RealInputFormatter(centavos: true),
              ],
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }
}
