import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:task2/model/barbershopModel.dart';

class FileHelper {
  final filename = "local_user7";

  Future<String> getFilePath() async {
    return '${(await getApplicationDocumentsDirectory()).path}/$filename.json';
  }

  setData(List<BarbershopModel> li) async {
    String ret = '[';
    for (int i = 0; i < li.length; i++) {
      ret += json.encode(li[i].toJson());
      if (i < li.length - 1) ret += ',';
    }
    ret += ']';
    final file = File(await getFilePath());
    file.writeAsString(ret);
  }

  Future<List<dynamic>> getData() async {
    if (!await File(await getFilePath()).exists()) return [];
    final file = File(await getFilePath());
    List<dynamic> data = json.decode(await file.readAsString());

    return data;
  }
}
