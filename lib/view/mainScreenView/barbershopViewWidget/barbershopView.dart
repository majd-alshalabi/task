import 'package:flutter/material.dart';
import 'package:task2/constant/constant.dart';
import 'package:task2/constant/reuseableWidget.dart';
import 'package:task2/model/barbersModel.dart';
import 'package:task2/model/barbershopModel.dart';
import 'package:provider/provider.dart';
import 'package:task2/shared/providerHelper.dart';
import 'package:task2/view/mainScreenView/barbershopViewWidget/barbershopViewWidget.dart';

class BarbershopView extends StatelessWidget {
  static final String id = 'barbershopView';

  @override
  Widget build(BuildContext context) {
    final BarbershopModel barbershopModel = context
        .watch<ProviderHelper>()
        .dataModel[context.read<ProviderHelper>().selectedBarberShopModel.id];

    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          body: TabBarView(
            children: [
              BarbersList(),
              Center(child: Text("Page 2")),
            ],
          ),
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) => [
            Container(
              child: SliverAppBar(
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertContainer();
                          });
                    },
                    icon: Icon(
                      Icons.book_outlined,
                    ),
                  ),
                ],
                iconTheme: IconThemeData(color: Colors.white),
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                pinned: true,
                expandedHeight: 300.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image(
                      image:
                          AssetImage('assets/images/${barbershopModel.image}'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: ShopFooter(),
            ),
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.grey[400],
              pinned: true,
              toolbarHeight: 25,
              flexibleSpace: TabBar(
                indicatorColor: firstColor,
                labelColor: firstColor,
                unselectedLabelColor: Colors.white,
                isScrollable: true,
                tabs: <Tab>[
                  Tab(
                    child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.425,
                        child: Text('Barbers')),
                  ),
                  Tab(
                    child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.42,
                        child: Text('Makeup')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AlertContainer extends StatefulWidget {
  @override
  _AlertContainerState createState() => _AlertContainerState();
}

class _AlertContainerState extends State<AlertContainer>
    with TickerProviderStateMixin {
  late Animation containerRadiusAnimation,
      containerSizeAnimation,
      containerColorAnimation;
  late AnimationController containerAnimationController;
  var selectedBarber;
  int selectedBarberIdx = 0;
  List barberTimeBookList = [];

  @override
  void initState() {
    super.initState();
    containerAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    containerRadiusAnimation = BorderRadiusTween(
            begin: BorderRadius.circular(100.0), end: BorderRadius.circular(20))
        .animate(CurvedAnimation(
            curve: Curves.ease, parent: containerAnimationController));

    containerSizeAnimation = Tween(begin: 0, end: 1).animate(CurvedAnimation(
        curve: Curves.bounceIn, parent: containerAnimationController));

    containerColorAnimation = ColorTween(begin: Colors.black, end: Colors.white)
        .animate(CurvedAnimation(
            curve: Curves.ease, parent: containerAnimationController));

    containerAnimationController.forward();
    selectedBarber =
        context.read<ProviderHelper>().selectedBarberShopModel.barbers[0];
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    barberTimeBookList = context
        .watch<ProviderHelper>()
        .dataModel[context.read<ProviderHelper>().selectedBarberShopModel.id]
        .barbers[selectedBarberIdx]
        .book;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Center(
            child: AnimatedBuilder(
              animation: containerAnimationController,
              builder: (context, child) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: containerRadiusAnimation.value,
                      color: containerColorAnimation.value),
                  width: containerAnimationController.value * size.width * 0.8,
                  height:
                      containerAnimationController.value * size.height * 0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (containerAnimationController.value * size.width > 400)
                        DropdownButton(
                          hint: Text("Select a barber"),
                          value: selectedBarber,
                          onChanged: (var newValue) {
                            setState(() {
                              selectedBarberIdx = context
                                  .read<ProviderHelper>()
                                  .selectedBarberShopModel
                                  .barbers
                                  .indexOf(newValue);
                              selectedBarber = newValue;
                            });
                          },
                          items: context
                              .read<ProviderHelper>()
                              .selectedBarberShopModel
                              .barbers
                              .map((var barber) {
                            return DropdownMenuItem(
                              value: barber,
                              child: Text(
                                barber.name,
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                        ),
                      containerAnimationController.value * size.width > 400
                          ? Container(
                              height: size.height * 0.6,
                              child: ListView.builder(
                                itemBuilder: (context, idx) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: (barberTimeBookList[idx]
                                                          ['book'] &&
                                                      barberTimeBookList[idx]
                                                              ['name'] ==
                                                          context
                                                              .read<
                                                                  ProviderHelper>()
                                                              .userModel
                                                              .email) ||
                                                  barberTimeBookList[idx]
                                                          ['book'] ==
                                                      false
                                              ? () {
                                                  context
                                                      .read<ProviderHelper>()
                                                      .updateBookTime(idx,
                                                          selectedBarberIdx);
                                                }
                                              : () {},
                                          icon: Icon(Icons.chair,
                                              size: 30,
                                              color: barberTimeBookList[idx]
                                                      ['book']
                                                  ? barberTimeBookList[idx]
                                                              ['name'] ==
                                                          context
                                                              .read<
                                                                  ProviderHelper>()
                                                              .userModel
                                                              .email
                                                      ? firstColor
                                                      : Colors.grey
                                                  : Colors.black),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(setTime(idx)),
                                      ],
                                    ),
                                  );
                                },
                                itemCount: barberTimeBookList.length,
                              ),
                            )
                          : Container(),
                      containerAnimationController.value * size.width > 400
                          ? MyButton(
                              buttonText: 'Done',
                              onTap: () {
                                Navigator.pop(context);
                              })
                          : Container(),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String setTime(int idx) {
    int x = ((idx * 30) ~/ 60);
    int m = (idx * 30) % 60;
    int h = (9 + x) % 12;
    if (h == 0) h = 12;
    String ret = '';
    if (h <= 9) {
      ret += '0';
      ret += h.toString();
    } else
      ret += h.toString();
    ret += ' : ';
    if (m <= 9) {
      ret += '0';
      ret += m.toString();
    } else
      ret += m.toString();
    return ret;
  }
}

class BarbersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List barberModelList = BarbershopModel.fromJson(context
            .read<ProviderHelper>()
            .data[context.read<ProviderHelper>().selectedBarberShopModel.id])
        .barbers;
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: barberModelList.length,
        itemBuilder: (context, int index) => ListItem(
          barberModel: barberModelList[index],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final BarberModel barberModel;

  const ListItem({Key? key, required this.barberModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/barber/${barberModel.image}',
                      ),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image(
                      image: AssetImage('assets/images/employee.png'),
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(barberModel.name),
                  ],
                ),
                Text(
                  '${barberModel.price.toString()} \$',
                  style: TextStyle(color: firstColor),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
