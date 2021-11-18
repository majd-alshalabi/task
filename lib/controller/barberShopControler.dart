import 'package:task2/model/barbershopModel.dart';

class BarbershopController {
  static List getBarbershop(List<dynamic> data) {
    List<BarbershopModel> barberList = [];
    data.forEach((element) {
      barberList.add(BarbershopModel.fromJson(element));
    });
    return barberList;
  }
}
