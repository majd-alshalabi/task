import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task2/constant/constant.dart';
import 'package:task2/model/barbershopModel.dart';
import 'package:task2/shared/providerHelper.dart';
import 'package:provider/provider.dart';

class ShopFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BarbershopModel barbershopModel =
        context.read<ProviderHelper>().selectedBarberShopModel;
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.6)),
      child: Row(
        children: [
          Row(
            children: [
              Container(
                width: 50,
                child: Image(
                  image: AssetImage('assets/images/scissors2.png'),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    barbershopModel.name,
                    style: TextStyle(color: firstColor, fontSize: 20),
                  ),
                  Text(
                    'Delevery price : 5000',
                    style: TextStyle(fontSize: 12),
                  )
                ],
              )
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    barbershopModel.connected
                        ? Row(
                            children: [
                              Text(
                                'Connected',
                                style: TextStyle(color: Colors.lightGreen),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              FaIcon(
                                FontAwesomeIcons.solidCircle,
                                size: 10,
                                color: Colors.lightGreen,
                              )
                            ],
                          )
                        : Row(
                            children: [
                              Text(
                                'Not connected',
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              FaIcon(
                                FontAwesomeIcons.circle,
                                size: 10,
                                color: Colors.red[300],
                              ),
                            ],
                          ),
                    Row(
                      children: [
                        Text(
                          '${barbershopModel.open} am - ${barbershopModel.close} pm',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
