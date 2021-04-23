import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ventas_app/models/empresa_model.dart';

class EmpresaService with ChangeNotifier {
  List<EmpresaResponse> empresas = [];

  EmpresaService() {
    this.getEmpresas();
  }

  getEmpresas() async {
    final url = Uri.parse('https://dashboardb.visorus.com.mx/api/epu?inicio=1575180000000&fin=1577772000000&order=asc');

    SharedPreferences prefs = await SharedPreferences.getInstance();

    final resp = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${prefs.getString('token') }',
        'Content-Type': 'application/json'
      }
    );

    final empresasResponse = empresaResponseFromJson(resp.body);
    this.empresas.addAll(empresasResponse);
    notifyListeners();
  }
}