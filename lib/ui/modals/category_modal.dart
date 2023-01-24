import 'package:admin_dashboard_matuca/models/http/category.dart';
import 'package:admin_dashboard_matuca/providers/categories_provider.dart';
import 'package:admin_dashboard_matuca/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard_matuca/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard_matuca/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategorieModal extends StatefulWidget {
  final Categoria? categoria;

  const CategorieModal(Key? key, this.categoria) : super(key: key);

  @override
  State<CategorieModal> createState() => _CategorieModalState();
}

class _CategorieModalState extends State<CategorieModal> {
  String nombre = '';
  String? id;

  @override
  void initState() {
    id = widget.categoria?.id;
    nombre = widget.categoria?.nombre ?? '';
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider =
        Provider.of<CategoriesProvider>(context, listen: false);

    return Container(
      padding: EdgeInsets.all(20),
      height: 500,
      decoration: builBoxDeco(),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.categoria?.nombre ?? 'Nueva categoria',
              style: CustomLabels.h1.copyWith(color: Colors.white),
            ),
            IconButton(
              icon: Icon(Icons.close),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        Divider(
          color: Colors.white.withOpacity(0.3),
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          initialValue: widget.categoria?.nombre ?? '',
          onChanged: (value) {
            nombre = value;
          },
          decoration: CustomInputs.authInputDecoration(
              hint: 'Nombre de la categoria',
              label: 'Categoria',
              icon: Icons.new_releases_outlined),
          style: TextStyle(color: Colors.white),
        ),
        Container(
          margin: EdgeInsets.only(top: 30),
          alignment: Alignment.center,
          child: CustomOutlinedButton(
            onPressed: () async {
              if (id != null) {
              } else {
                await categoryProvider.newCategory(nombre);
              }
              Navigator.of(context).pop();
            },
            text: 'Guardar',
            color: Colors.white,
          ),
        )
      ]),
    );
  }

  BoxDecoration builBoxDeco() => BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Color(0xff092044),
      );
}
