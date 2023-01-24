import 'package:admin_dashboard_matuca/models/http/category.dart';
import 'package:flutter/material.dart';

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
          IconButton(onPressed: () {}, icon: Icon(Icons.edit_outlined)),
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
                        onPressed: () {
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
