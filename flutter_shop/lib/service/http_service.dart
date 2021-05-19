import 'dart:convert';
import 'dart:io';
import 'package:flutter_shop/utils/token_util.dart';

class HttpService {
  static Future<Map<String, dynamic>> get(String url, {Map<String, dynamic> param}) async {
    if (url.indexOf('?') < 0) {
      url += '?';
    }

    if (param != null) {
      param.forEach((key, value) {
        url += (key + '=' + value.toString() + '&');
      });
    }

    url = url.substring(0, url.length - 1);

    HttpClient httpClient;
    HttpClientRequest request;
    HttpClientResponse response;

    try {
      httpClient = HttpClient();
      request = await httpClient.getUrl(Uri.parse(url));
      await setHeader(request);
      response = await request.close();
      String body = await response.transform(utf8.decoder).join();
      if (response.statusCode == 200) {
        Map<String, dynamic> resBody = json.decode(body);
        return resBody;
      }else {
        print('请求失败');
      }

    } finally {
      if (request != null) {
        request.close();
      }
      if (httpClient != null) {
        httpClient.close();
      }
    }
    return null;
  }
  
  static Future<Map<String, dynamic>> post(String url, {Map<String, dynamic> param}) async {
    HttpClient httpClient;
    HttpClientRequest request;
    HttpClientResponse response;

    try {
      httpClient = HttpClient();
      request = await httpClient.postUrl(Uri.parse(url));
      await setHeader(request);
      if (param != null) {
        request.add(utf8.encode(json.encode(param)));
      }
      response = await request.close();
      String body = await response.transform(utf8.decoder).join();
      if (response.statusCode == 200) {
        Map<String, dynamic> resBody = json.decode(body);
        return resBody;
      }else {
        print('请求失败');
      }

    } finally {
      if (request != null) {
        request.close();
      }
      if (httpClient != null) {
        httpClient.close();
      }
    }
    return null;
  }
  
  static void setHeader(HttpClientRequest request) async {
    request.headers.set(HttpHeaders.contentTypeHeader, 'application/json;charset=UTF-8');
    // 设置token
    String token = await TokenUtil.getToken();
    request.headers.set('Authorization', token);
  }
}
