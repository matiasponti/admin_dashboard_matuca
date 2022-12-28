import 'package:admin_dashboard_matuca/providers/auth_provider.dart';
import 'package:admin_dashboard_matuca/providers/login_form_provider.dart';
import 'package:admin_dashboard_matuca/providers/register_form_provider.dart';
import 'package:admin_dashboard_matuca/router/router.dart';
import 'package:admin_dashboard_matuca/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard_matuca/ui/buttons/link_text.dart';
import 'package:admin_dashboard_matuca/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => RegisterFormProvider(),
        child: Builder(
          builder: (context) {
            final registerFormProvider =
                Provider.of<RegisterFormProvider>(context, listen: false);
            return Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 370),
                  child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: registerFormProvider.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                            onChanged: (value) =>
                                registerFormProvider.name = value,
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return 'Ingrese su contrasña';
                              return null; //Valido
                            },
                            style: TextStyle(color: Colors.white),
                            decoration: CustomInputs.authInputDecoration(
                                hint: 'Ingrese su nombre',
                                label: 'Nombre',
                                icon: Icons.person)),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onChanged: (value) =>
                              registerFormProvider.email = value,
                          validator: (value) {
                            if (!EmailValidator.validate(value ?? ' '))
                              return 'Email no valido';
                            return null;
                          },
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
                          onChanged: (value) =>
                              registerFormProvider.password = value,
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
                            final validForm =
                                registerFormProvider.validateForm();
                            if (!validForm) return;
                            final authProvider = Provider.of<AuthProvider>(
                                context,
                                listen: false);
                            authProvider.register(
                                registerFormProvider.email,
                                registerFormProvider.password,
                                registerFormProvider.name);
                          },
                          text: 'Crear cuenta',
                          isFilled: true,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        LinkText(
                          text: 'Ingreso',
                          onTap: () {
                            Navigator.pushNamed(
                                context, Flurorouter.loginRoute);
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
