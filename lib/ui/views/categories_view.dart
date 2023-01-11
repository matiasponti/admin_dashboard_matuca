import 'package:admin_dashboard_matuca/data_tables/categories_datasource.dart';
import 'package:admin_dashboard_matuca/providers/categories_provider.dart';
import 'package:admin_dashboard_matuca/ui/buttons/custom_icon_button.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard_matuca/ui/labels/custom_labels.dart';
import 'package:provider/provider.dart';

import '../cards/white_card.dart';

class CategoriesView extends StatefulWidget {
  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CategoriesProvider>(context, listen: false).getCategories();
  }

  int _rowsperpage = PaginatedDataTable.defaultRowsPerPage;

  @override
  Widget build(BuildContext context) {
    final categorias = Provider.of<CategoriesProvider>(context).categories;

    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            'Categorias',
            style: CustomLabels.h1,
          ),
          SizedBox(
            height: 10,
          ),
          PaginatedDataTable(
            columns: [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Categorias')),
              DataColumn(label: Text('Creado por')),
              DataColumn(label: Text('Acciones')),
            ],
            rowsPerPage: _rowsperpage,
            onRowsPerPageChanged: (value) {
              setState(() {
                _rowsperpage = value ?? 10;
              });
            },
            source: CategoriesDTS(categorias),
            header: Text(
              'Esta es la lista de todas las categorias disponibles',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            actions: [
              CustomIconButton(onPressed: () {}, text: 'Crear', icon: Icons.add)
            ],
          )
        ],
      ),
    );
  }
}
