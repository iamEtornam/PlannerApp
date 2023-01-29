import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HttpUtils {
  HttpUtils();

  static const baseUrl =
      'https://firestore.googleapis.com/v1/projects/applaudo-todo-app/databases/(default)/documents';

  Future<String?> getToken() async {
    final firebaseAuth = FirebaseAuth.instance;
    return await firebaseAuth.currentUser?.getIdToken();
  }

  Future<Map<String, dynamic>?> getData({required String path}) async {
    final token = await getToken();
    final res = await get(Uri.parse('$baseUrl/$path?key=$token'));
    debugPrint(res.request?.url.toString());
    if (res.statusCode == 200 || res.statusCode == 201) {
      return jsonDecode(res.body);
    }
    return null;
  }

  Future<Map<String, dynamic>?> postData(
      {required String path, required Map<String, dynamic> data}) async {
    final token = await getToken();
    final res = await post(Uri.parse('$baseUrl/$path?key=$token'), body: data);
    debugPrint(res.request?.url.toString());

    if (res.statusCode == 200 || res.statusCode == 201) {
      return jsonDecode(res.body);
    }
    return null;
  }

  Future<Map<String, dynamic>?> patchData(
      {required String path, required Map<String, dynamic> data}) async {
    final token = await getToken();
    final res = await patch(Uri.parse('$baseUrl/$path?key=$token'), body: data);
    debugPrint(res.request?.url.toString());

    if (res.statusCode == 200 || res.statusCode == 201) {
      return jsonDecode(res.body);
    }
    return null;
  }
}
