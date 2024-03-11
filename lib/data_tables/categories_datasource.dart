import 'package:admin_dashboard_matuca/models/http/category.dart';
import 'package:admin_dashboard_matuca/providers/categories_provider.dart';
import 'package:admin_dashboard_matuca/services/notifications_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ui/modals/category_modal.dart';

class CategoriesDTS extends DataTableSource {
  final List<Categoria> categorias;
  final BuildContext context;

  CategoriesDTS(this.categorias, this.context);

  @override
  DataRow? getRow(int index) {
    final categoria = categorias[index];

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(categoria.id)),
      DataCell(Text(categoria.nombre)),
      DataCell(Text(categoria.usuario.nombre)),
      DataCell(Row(
        children: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (_) => CategorieModal(categoria));
              },
              icon: Icon(Icons.edit_outlined)),
          IconButton(
              onPressed: () {
                final dialog = AlertDialog(
                  title: Text('Estas seguro que quieres borrarlo?'),
                  content: Text('Borrar definitivamente ${categoria.nombre}?'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'No',
                          style: TextStyle(color: Colors.red),
                        )),
                    TextButton(
                        onPressed: () async {
                          await Provider.of<CategoriesProvider>(context,
                                  listen: false)
                              .deleteCategory(categoria.id);

                          NotificationService.showSnackBarError(
                              "${categoria.nombre} se ha eliminado.");

                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Si, Borrar',
                        ))
                  ],
                );

                showDialog(context: context, builder: (_) => dialog);
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red.withOpacity(0.8),
              ))
        ],
      )),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => categorias.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
