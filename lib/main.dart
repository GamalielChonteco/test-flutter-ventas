import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventas_app/pages/detalle_sucursal_page.dart';
import 'package:ventas_app/services/auth_service.dart';

import 'package:ventas_app/services/empresa_service.dart';

import 'package:ventas_app/pages/login_page.dart';
import 'package:ventas_app/pages/empresas_page.dart';
import 'package:ventas_app/pages/sucursales_page.dart';
import 'package:ventas_app/services/sucursal_service.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new EmpresaService()),
        ChangeNotifierProvider(create: (_) => new AuthService()),
        ChangeNotifierProvider(create: (_) => new SucursalService())
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: 'login',
        routes: {
          '/': (_) => EmpresasPage(),
          'login': (_) => LoginPage(),
          'sucursales': (_) => SucursalesPage(),
          'detalle': (_) => DetalleSucursalPage()
        },
      ),
    );
  }
}