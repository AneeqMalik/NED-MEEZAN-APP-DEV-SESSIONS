class ProductModel {
  final int _id;
  final String _name;
  final double _price;
  final String _category;
  final String _description;
  final String _image;

  ProductModel({
    required int id,
    required String name,
    required double price,
    required String category,
    required String description,
    required String image,
  })  : _id = id,
        _name = name,
        _price = price,
        _category = category,
        _description = description,
        _image = image;

  int get id => _id;
  String get name => _name;
  double get price => _price;
  String get category => _category;
  String get description => _description;
  String get image => _image;
}