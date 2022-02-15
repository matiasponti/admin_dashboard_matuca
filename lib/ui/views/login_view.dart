import 'package:admin_dashboard_matuca/router/router.dart';
import 'package:admin_dashboard_matuca/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard_matuca/ui/buttons/link_text.dart';
import 'package:admin_dashboard_matuca/ui/inputs/custom_inputs.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 370),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  //validator: ,
                  style: TextStyle(color: Colors.white),
                  decoration: CustomInputs.authInputDecoration(
                      hint: 'Ingrese su corre',
                      label: 'Email',
                      icon: Icons.email_outlined),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  //validator: ,
                  style: TextStyle(color: Colors.white),
                  decoration: CustomInputs.authInputDecoration(
                      hint: 'xxxxxxxx',
                      label: 'Contraseña',
                      icon: Icons.lock_clock_outlined),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomOutlinedButton(
                  onPressed: () {},
                  text: 'Ingresar',
                  isFilled: true,
                ),
                SizedBox(
                  height: 20,
                ),
                LinkText(
                  text: 'Nueva cuenta',
                  onTap: () {
                    Navigator.pushNamed(context, Flurorouter.registerRoute);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
