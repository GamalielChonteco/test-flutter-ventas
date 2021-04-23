import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ventas_app/models/login_model.dart';

class AuthService with ChangeNotifier {
  String token = '';

  Future<bool> login( String username, String password ) async {
    final URL = Uri.parse('https://dashboardb.visorus.com.mx/api/login');

    final data = {
      'username': username,
      'password': password
    };

    final resp = await http.post(URL, 
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json'
      }
    );

    if ( resp.statusCode == 200 ) {
      final loginResponse = loginResponseFromJson( resp.body );
      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('token', loginResponse.accessToken);
      
      return true;
    } else {
      return false;
    }
  }
}