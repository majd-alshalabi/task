class BarberModel {
  final String name;
  final String image;
  final int price;
  final List<Map<String, dynamic>> book;

  BarberModel(
      {required this.book,
      required this.name,
      required this.image,
      required this.price});

  factory BarberModel.fromJson(Map<String, dynamic> parsedJson) {
    List<Map<String, dynamic>> li = [];
    parsedJson['book'].forEach((e) {
      li.add(e);
    });
    return BarberModel(
      name: parsedJson['name'],
      image: parsedJson['image'],
      price: parsedJson['price'],
      book: li,
    );
  }
  Map<String, dynamic> toJson() => {
        'name': name,
        'image': image,
        'price': price,
        'book': book,
      };
}
