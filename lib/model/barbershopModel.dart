import 'package:task2/model/barbersModel.dart';

class BarbershopModel {
  final int id;
  final String name;
  final bool connected;
  final String open;
  final String close;
  final String image;
  final int delevery;
  final List barbers;

  BarbershopModel(
      {required this.id,
      required this.name,
      required this.connected,
      required this.open,
      required this.close,
      required this.image,
      required this.delevery,
      required this.barbers});

  factory BarbershopModel.fromJson(dynamic parsedJson) {
    List<BarberModel> li = [];
    parsedJson['barbers'].forEach((e) {
      li.add(BarberModel.fromJson(e));
    });
    return BarbershopModel(
      id: parsedJson['id'],
      name: parsedJson['name'],
      connected: parsedJson['connected'],
      open: parsedJson['open'],
      close: parsedJson['close'],
      image: parsedJson['image'],
      delevery: parsedJson['delevery'],
      barbers: li,
    );
  }
  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> li = [];
    barbers.forEach((e) {
      li.add(BarberModel(
        book: e.book,
        name: e.name,
        image: e.image,
        price: e.price,
      ).toJson());
    });
    return {
      'id': id,
      'name': name,
      'connected': connected,
      'open': open,
      'close': close,
      'image': image,
      'delevery': delevery,
      'barbers': li,
    };
  }
}
