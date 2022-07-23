import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:io';
import 'FirebaseApi.dart';
import 'package:firebase_storage/firebase_storage.dart';

fetchdata(String url) async{
  http.Response response = await http.get(Uri.parse(url));
  return response.body;
}

upload_file(String filePath, String fileName,String function) async{
  final file = File(filePath);
  final destination = fileName;

  UploadTask? task =  FirebaseApi.uploadFile(destination, file);
  if (task == null) return;

  final snapshot = await task.whenComplete(() {});
  final urlDownload = await snapshot.ref.getDownloadURL();

  print('Download-Link: $urlDownload');

  String url = "http://10.0.2.2:5000/$function$fileName";
  var data = await fetchdata(url.toString());
  print("here");
  var decoded = jsonDecode(data);
  print("Done");
  print(decoded);
  return decoded;
}

