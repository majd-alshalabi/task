import 'package:flutter/material.dart';
import 'package:task2/model/barbershopModel.dart';
import 'package:task2/model/userModel.dart';
import 'package:task2/shared/fileHelper.dart';

class ProviderHelper extends ChangeNotifier {
  List<dynamic> data = [
    {
      'id': 0,
      'name': 'Altal barbershop',
      'connected': true,
      'open': '8 : 30',
      'close': '3 : 00',
      'image': 'firstshop.jpg',
      'delevery': 5000,
      'barbers': [
        {
          'name': 'Ahmad mohamad',
          'image': 'firstBarberImage.jpg',
          'price': 5000,
          'book': [
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
          ],
        },
        {
          'name': 'Mohamad Ahmad',
          'image': 'secondBarberImage.jpg',
          'price': 5500,
          'book': [
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
          ],
        },
        {
          'name': 'Samer Ahmad',
          'image': 'secondBarberImage.jpg',
          'price': 5500,
          'book': [
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
          ],
        },
      ],
    },
    {
      'id': 1,
      'name': 'Horna barbershop',
      'image': 'secondshop.jpg',
      'connected': false,
      'open': '10 : 00',
      'close': '12 : 00',
      'delevery': 2000,
      'barbers': [
        {
          'name': 'mohamad Ahmad',
          'image': 'secondBarberImage.jpg',
          'price': 5000,
          'book': [
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
          ],
        },
      ]
    },
    {
      'id': 2,
      'name': 'Horna barbershop',
      'image': 'thirdshop.jpg',
      'connected': false,
      'open': '10 : 00',
      'close': '12 : 00',
      'delevery': 7000,
      'barbers': [
        {
          'name': 'Mohamad Ahmad',
          'image': 'secondBarberImage.jpg',
          'price': 5000,
          'book': [
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
          ],
        },
      ]
    },
    {
      'id': 3,
      'name': 'Horna barbershop',
      'image': 'thirdshop.jpg',
      'connected': false,
      'open': '10 : 00',
      'close': '12 : 00',
      'delevery': 4000,
      'barbers': [
        {
          'name': 'Mohamad Ahmad',
          'image': 'secondBarberImage.jpg',
          'price': 5000,
          'book': [
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
          ],
        },
      ]
    },
    {
      'id': 4,
      'name': 'Horna barbershop',
      'image': 'secondshop.jpg',
      'connected': false,
      'open': '10 : 00',
      'close': '12 : 00',
      'delevery': 4500,
      'barbers': [
        {
          'name': 'Mohamad Ahmad',
          'image': 'secondBarberImage.jpg',
          'price': 5000,
          'book': [
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
          ],
        },
      ]
    },
    {
      'id': 5,
      'name': 'Horna barbershop',
      'image': 'secondshop.jpg',
      'connected': false,
      'open': '10 : 00',
      'close': '12 : 00',
      'delevery': 3400,
      'barbers': [
        {
          'name': 'Mohamad Ahmad',
          'image': 'secondBarberImage.jpg',
          'price': 5000,
          'book': [
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
            {'book': false, 'name': ''},
          ],
        },
      ]
    },
  ];

  late List<BarbershopModel> dataModel;

  late BarbershopModel selectedBarberShopModel;

  UserModel userModel = UserModel(
    id: -1,
    email: 'majd@gmail.com',
    password: 'password',
  );

  Future<void> updateBookTime(int idx, int barberIdx) async {
    if (dataModel[selectedBarberShopModel.id].barbers[barberIdx].book[idx]
            ['book'] ==
        false)
      dataModel[selectedBarberShopModel.id].barbers[barberIdx].book[idx]
          ['name'] = userModel.email;
    dataModel[selectedBarberShopModel.id].barbers[barberIdx].book[idx]['book'] =
        !dataModel[selectedBarberShopModel.id].barbers[barberIdx].book[idx]
            ['book'];

    FileHelper fileHlper = FileHelper();
    await fileHlper.setData(dataModel);
    notifyListeners();
  }
}
