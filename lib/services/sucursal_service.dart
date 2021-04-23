import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ventas_app/models/sucursal_model.dart';

class SucursalService with ChangeNotifier {
  List<SucursalResponse> sucursales = [];

  SucursalService() {
    this.getSucursales();
  }

  getSucursales() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final empresaId = prefs.getString('empresaId');
    
    final url = Uri.parse('https://dashboardb.visorus.com.mx/api/epu/xempresa/$empresaId?inicio=1575180000000&fin=1577772000000&order=asc');


    final resp = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${prefs.getString('token') }',
        'Content-Type': 'application/json'
      }
    );

    final sucursalResponse = sucursalResponseFromJson(resp.body);
    this.sucursales.addAll(sucursalResponse);
    notifyListeners();
  }
}