import 'package:flutter/material.dart';
import 'package:ventas_app/models/sucursal_model.dart';

class DetalleSucursalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final style = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    final SucursalResponse args = ModalRoute.of(context).settings.arguments;
    print(args.ventasCredito);
    return Scaffold(
      appBar: AppBar(
        title: Text(args.sucursal.nombre),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Monto de ventas en efectivo: ', style: style,),
              Text('\$${args.ventasEfectivo}', style: style)
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Monto de ventas en credito: ', style: style,),
              Text('\$${args.ventasCredito}', style: style)
            ],
          ),
          SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Total de ventas: ', style: style,),
              Text('\$${args.ventasCredito + args.ventasEfectivo}', style: style)
            ],
          )
        ],
      ),
    );
  }
}