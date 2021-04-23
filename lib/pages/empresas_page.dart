import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ventas_app/services/empresa_service.dart';

class EmpresasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final empresas = Provider.of<EmpresaService>(context).empresas;

    return Scaffold(
      appBar: AppBar(
        title: Text('Empresas'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: empresas.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(Icons.home_work_outlined),
              title: Text('${empresas[index].empresa.nombre}'),
              trailing: Icon(Icons.keyboard_arrow_right_sharp),
              onTap: () async {
                Navigator.pushNamed(context, 'sucursales');
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('empresaId', empresas[index].empresa.id);
              },
            );
          },
        ),
      )
    );
  }
}