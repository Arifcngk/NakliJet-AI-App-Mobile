import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void manageHttpResponse({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSucces,
}) {
  switch (response.statusCode) {
    case 200: // Başarılı Giriş
      onSucces();
      break;

    case 400: // Başarısız Giriş
      showSnackBar(context, json.decode(response.body)['message']);
      break;
    case 500: // Başarısız Server Girişi
      showSnackBar(context, json.decode(response.body)['error']);
      break;
    case 201: // Başarısız Server Girişi
      onSucces();
      break;
  }
}

void showSnackBar(BuildContext context, String title) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
}
