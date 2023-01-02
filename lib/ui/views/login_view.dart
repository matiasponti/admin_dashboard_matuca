import 'package:admin_dashboard_matuca/providers/auth_provider.dart';
import 'package:admin_dashboard_matuca/providers/login_form_provider.dart';
import 'package:admin_dashboard_matuca/router/router.dart';
import 'package:admin_dashboard_matuca/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard_matuca/ui/buttons/link_text.dart';
import 'package:admin_dashboard_matuca/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return ChangeNotifierProvider(
        create: (_) => LoginFormProvider(),
        child: Builder(
          builder: (BuildContext context) {
            final loginFormProvider =
                Provider.of<LoginFormProvider>(context, listen: false);
            return Container(
              margin: EdgeInsets.only(top: 100),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 370),
                  child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: loginFormProvider.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (!EmailValidator.validate(value ?? ' '))
                              return 'Email no valido';
                            return null;
                          },
                          style: TextStyle(color: Colors.white),
                          onChanged: (value) => loginFormProvider.email = value,
                          decoration: CustomInputs.authInputDecoration(
                              hint: 'Ingrese su corre',
                              label: 'Email',
                              icon: Icons.email_outlined),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onChanged: (value) =>
                              loginFormProvider.password = value,
                          onFieldSubmitted: (v) {
                            final isValid = loginFormProvider.validateForm();
                            if (isValid) {
                              authProvider.login(loginFormProvider.email,
                                  loginFormProvider.password);
                            }
                          },
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Ingrese su contrasña';
                            if (value.length < 6)
                              return 'La contraseña debe tener 6 caracteres';
                            return null; //Valido
                          },
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
                          onPressed: () {
                            final isValid = loginFormProvider.validateForm();
                            if (isValid) {
                              authProvider.login(loginFormProvider.email,
                                  loginFormProvider.password);
                            }
                          },
                          text: 'Ingresar',
                          isFilled: true,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        LinkText(
                          text: 'Nueva cuenta',
                          onTap: () {
                            Navigator.pushNamed(
                                context, Flurorouter.registerRoute);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
