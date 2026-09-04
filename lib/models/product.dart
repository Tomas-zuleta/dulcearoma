class Product {
  final String name;
  final String price;
  final String category;
  final String imageUrl;

  const Product({
    required this.name,
    required this.price,
    required this.category,
    required this.imageUrl,
  });
}

final List<Product> breadProducts = [
  const Product(
    name: 'Sourdough Loaf',
    price: '\$8.50',
    category: 'ARTISANAL BREAD',
    imageUrl: 'https://images.unsplash.com/photo-1585478259715-4d3a5f3a5f3a?w=600',
  ),
  const Product(
    name: 'Chocolate Fudge',
    price: '\$35.00',
    category: 'DECORATED CAKE',
    imageUrl: 'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?w=600',
  ),
  const Product(
    name: 'French Croissant',
    price: '\$4.25',
    category: 'CLASSIC PASTRY',
    imageUrl: 'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=600',
  ),
  const Product(
    name: 'Strawberry Tart',
    price: '\$6.50',
    category: 'FRESH FRUIT',
    imageUrl: 'https://images.unsplash.com/photo-1519915028121-7d3463d20b13?w=600',
  ),
  const Product(
    name: 'Macaron Box',
    price: '\$12.00',
    category: 'SWEET TREATS',
    imageUrl: 'https://images.unsplash.com/photo-1569864358642-9d1684040f43?w=600',
  ),
  const Product(
    name: 'Choco Cookies',
    price: '\$3.75',
    category: 'FRESH BAKED',
    imageUrl: 'https://images.unsplash.com/photo-1499636136210-6f4ee915583e?w=600',
  ),
];