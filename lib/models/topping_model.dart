class ToppingModel {
  final String name;
  final double price;
  bool selected;

  ToppingModel({
    required this.name,
    required this.price,
    this.selected = false,
  });
}
