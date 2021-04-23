import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventas_app/services/auth_service.dart';
import 'package:ventas_app/widgets/input_widget.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _Logo(),
            _Form(),
            Text('Términos y condiciones de uso')
          ],
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Icon(Icons.monetization_on_outlined, color: Colors.blue,size: 150,),
            Text('Ventas', style: TextStyle(color: Colors.black54, fontSize: 25, fontWeight: FontWeight.w500))
          ]
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  @override
  Widget build(BuildContext context) {

    final userController = TextEditingController();
    final passwordController = TextEditingController();

    final authService = Provider.of<AuthService>(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          InputWidget(
            icon: Icons.person,
            placeholder: 'Username',
            textController: userController
          ),
          InputWidget(
            icon: Icons.lock_outline,
            placeholder: 'Password',
            textController: passwordController,
            isPassword: true,
          ),

          ElevatedButton(
            onPressed: () async {
              final info = await authService.login(userController.text, passwordController.text);
              
              if (info) {
                Navigator.popAndPushNamed(context, '/');
              } else {
                showDialog(context: context, builder: (_) => AlertDialog(
                  title: Text('Login incorrecto'),
                  content: Text('Credenciales no validas'),
                  actions: [
                    MaterialButton(
                      child: Text('Ok'),
                      elevation: 5,
                      textColor: Colors.blue,
                      onPressed: () => Navigator.pop(context)
                    )
                  ],
                ));
              }
            },
            child: Text('Login'),
          )
        ]
      ),
    );
  }
}