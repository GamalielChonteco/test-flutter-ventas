import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventas_app/services/sucursal_service.dart';

class SucursalesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final sucursales = Provider.of<SucursalService>(context).sucursales;

    return Scaffold(
      appBar: AppBar(
        title: Text('Sucursales'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: sucursales.length,
          itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.home_work_outlined),
            title: Text('${sucursales[index].sucursal.nombre}'),
            trailing: Icon(Icons.keyboard_arrow_right_sharp),
            onTap: () {
              Navigator.pushNamed(context, 'detalle', arguments: sucursales[index]);
            },
          );
         },
        ),
      )
    );
  }
}