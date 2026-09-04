import 'package:flutter/material.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  // ==========================================================
  // COLORES
  // ==========================================================

  static const Color primaryPink = Color(0xFFE72D70);
  static const Color lightPink = Color(0xFFF06496);
  static const Color softPink = Color(0xFFF8B6CC);
  static const Color white = Color(0xFFFFFFFF);
  static const Color warmWhite = Color(0xFFFFFCFA);
  static const Color softBlack = Color(0xFF24242A);
  static const Color darkGray = Color(0xFF55555C);
  static const Color mediumGray = Color(0xFF96969B);
  static const Color lightGray = Color(0xFFE8E8EA);
  static const Color palePink = Color(0xFFFCE7EF);

  // ==========================================================
  // VARIABLES
  // ==========================================================

  int selectedCategory = 0;
  int selectedNav = 0;

  final List<String> categories = ['Breads', 'Cakes', 'Pastries', 'Coffee'];

  final List<Product> products = [
    Product(
      name: 'Strawberry Cream Cake',
      subtitle: 'Premium Bakery',
      price: 24.99,
      image:
          'https://images.unsplash.com/photo-1565958011703-44f9829ba187?w=900&auto=format&fit=crop&q=80',
      description:
          'A light and fluffy sponge cake layered with fresh organic '
          'strawberries and rich whipped cream. Perfect for any '
          'celebration or a sweet afternoon treat. Crafted with '
          'Madagascar vanilla and locally sourced dairy.',
    ),
    Product(
      name: 'Chocolate Bread',
      subtitle: 'Freshly baked',
      price: 4.50,
      image: 'https://images.unsplash.com/photo-1509440159596-0249088772ff',
      description:
          'Pan de chocolate horneado a diario con trozos de chocolate '
          'belga fundido en cada mordida. Corteza crocante por fuera y '
          'suave, esponjoso por dentro. // TODO: reemplaza por tu '
          'descripción real.',
    ),
    Product(
      name: 'Chocolate Cake',
      subtitle: 'Sweet & delicious',
      price: 6.80,
      image: 'https://images.unsplash.com/photo-1578985545062-69928b1d9587',
      description:
          'Torta de chocolate húmeda, cubierta con un ganache brillante '
          'y un relleno cremoso que combina perfecto con un café. '
          '// TODO: reemplaza por tu descripción real.',
    ),
    Product(
      name: 'Croissant',
      subtitle: 'French recipe',
      price: 3.20,
      image: 'https://images.unsplash.com/photo-1555507036-ab1f4038808a',
      description:
          'Croissant elaborado con receta francesa tradicional, hojaldrado '
          'a mano, mantequilla de la mejor calidad y horneado hasta lograr '
          'un dorado perfecto. // TODO: reemplaza por tu descripción real.',
    ),
    Product(
      name: 'Berry Cake',
      subtitle: 'Fresh berries',
      price: 7.50,
      image: 'https://images.unsplash.com/photo-1533134242443-d4fd215305ad',
      description:
          'Torta ligera decorada con una selección de frutos rojos '
          'frescos de temporada y un toque de crema chantilly. '
          '// TODO: reemplaza por tu descripción real.',
    ),
    Product(
      name: 'Sweet Roll',
      subtitle: 'Soft & fresh',
      price: 4.00,
      image: 'https://images.unsplash.com/photo-1509365465985-25d11c17e812',
      description:
          'Panecillo dulce recién horneado, suave y esponjoso, ideal '
          'para acompañar tu desayuno o merienda. '
          '// TODO: reemplaza por tu descripción real.',
    ),
    Product(
      name: 'Pancakes',
      subtitle: 'Sweet breakfast',
      price: 5.40,
      image: 'https://images.unsplash.com/photo-1528207776546-365bb710ee93',
      description:
          'Pancakes esponjosos servidos en torre, perfectos con miel, '
          'fruta fresca o el topping que más te guste. '
          '// TODO: reemplaza por tu descripción real.',
    ),
  ];

  // ==========================================================
  // BUILD PRINCIPAL
  // ==========================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: warmWhite,

      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                _buildHeader(),

                _buildCategories(),

                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),

                    child: Column(
                      children: [
                        _buildBanner(),

                        const SizedBox(height: 20),

                        _buildSectionTitle(),

                        const SizedBox(height: 14),

                        _buildProductGrid(),

                        const SizedBox(height: 25),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Positioned(right: 18, bottom: 18, child: _buildFloatingCart()),
        ],
      ),

      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Widget _buildFloatingCart() {
    return Material(
      color: primaryPink,
      elevation: 8,
      shadowColor: primaryPink.withOpacity(0.35),
      shape: const CircleBorder(),
      child: InkWell(
        onTap: () {},
        customBorder: const CircleBorder(),
        child: const SizedBox(
          width: 64,
          height: 64,
          child: Icon(Icons.shopping_cart_rounded, color: white, size: 32),
        ),
      ),
    );
  }

  // ==========================================================
  // HEADER
  // ==========================================================

  Widget _buildHeader() {
    return Container(
      height: 104,
      decoration: const BoxDecoration(
        color: white,
        border: Border(bottom: BorderSide(color: palePink, width: 2)),
      ),
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: const Icon(Icons.menu_rounded, color: primaryPink, size: 30),
          ),
          const Spacer(),
          const Text(
            'Dulce Aroma',
            style: TextStyle(
              color: softBlack,
              fontWeight: FontWeight.w800,
              fontSize: 25,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: primaryPink,
              size: 29,
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // CATEGORIAS
  // ==========================================================

  Widget _buildCategories() {
    return Container(
      height: 76,
      color: white,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(categories.length, (index) {
          final bool isSelected = selectedCategory == index;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedCategory = index;
                });
              },

              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),

                curve: Curves.easeInOut,

                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 12),

                decoration: BoxDecoration(
                  color: white,
                  border: Border(
                    bottom: BorderSide(
                      color: isSelected ? primaryPink : Colors.transparent,
                      width: 3,
                    ),
                  ),
                ),

                child: Text(
                  categories[index],

                  style: TextStyle(
                    color: isSelected ? primaryPink : darkGray,

                    fontSize: 18,

                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  // ==========================================================
  // BANNER
  // ==========================================================

  Widget _buildBanner() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 12, 18, 0),

      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0.90, end: 1),

        duration: const Duration(milliseconds: 700),

        curve: Curves.easeOutBack,

        builder: (context, value, child) {
          return Transform.scale(scale: value, child: child);
        },

        child: Container(
          width: double.infinity,
          height: 176,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),

            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,

              colors: [lightPink, primaryPink],
            ),

            boxShadow: [
              BoxShadow(
                color: primaryPink.withOpacity(0.25),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),

          child: Stack(
            children: [
              // ==================================================
              // CIRCULOS DECORATIVOS
              // ==================================================
              Positioned(
                right: -40,
                top: -45,

                child: Container(
                  width: 170,
                  height: 170,

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,

                    color: Colors.white.withOpacity(0.10),
                  ),
                ),
              ),

              Positioned(
                right: 20,
                bottom: -60,

                child: Container(
                  width: 130,
                  height: 130,

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,

                    color: Colors.white.withOpacity(0.08),
                  ),
                ),
              ),

              Positioned(
                left: -30,
                bottom: -50,

                child: Container(
                  width: 110,
                  height: 110,

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,

                    color: Colors.white.withOpacity(0.05),
                  ),
                ),
              ),

              // ==================================================
              // TEXTO DEL BANNER
              // ==================================================
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 16,
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    const Text(
                      'Sweet moments',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 6),

                    const Text(
                      'Freshly baked\nfor you!',
                      style: TextStyle(
                        color: white,
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        height: 1.08,
                      ),
                    ),

                    const SizedBox(height: 14),

                    GestureDetector(
                      onTap: () {},

                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 9,
                        ),

                        decoration: BoxDecoration(
                          color: white,

                          borderRadius: BorderRadius.circular(18),
                        ),

                        child: const Text(
                          'Order now',

                          style: TextStyle(
                            color: primaryPink,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ==========================================================
  // TITULO DE PRODUCTOS
  // ==========================================================

  Widget _buildSectionTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),

      child: Row(
        children: [
          Text(
            'Popular Products',

            style: TextStyle(
              color: softBlack,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),

          Spacer(),

          Text(
            'See all',

            style: TextStyle(
              color: primaryPink,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // GRID DE PRODUCTOS
  // ==========================================================

  Widget _buildProductGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),

      child: GridView.builder(
        shrinkWrap: true,

        physics: const NeverScrollableScrollPhysics(),

        itemCount: products.length,

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,

          crossAxisSpacing: 14,

          mainAxisSpacing: 16,

          childAspectRatio: 0.70,
        ),

        itemBuilder: (context, index) {
          return ProductCard(product: products[index], index: index);
        },
      ),
    );
  }

  // ==========================================================
  // BOTTOM NAVIGATION
  // ==========================================================

  Widget _buildBottomNavigation() {
    return Container(
      height: 70,

      decoration: const BoxDecoration(
        color: white,

        border: Border(top: BorderSide(color: lightGray, width: 1)),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: [
          _navItem(Icons.storefront_rounded, 'SHOP', 0),

          _navItem(Icons.search_rounded, 'SEARCH', 1),

          _navItem(Icons.receipt_long_rounded, 'ORDERS', 2),

          _navItem(Icons.person_outline_rounded, 'PROFILE', 3),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, int index) {
    final bool isSelected = selectedNav == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedNav = index;
        });
      },

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),

        curve: Curves.easeInOut,

        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),

        decoration: BoxDecoration(
          color: isSelected ? palePink : Colors.transparent,

          borderRadius: BorderRadius.circular(18),
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            AnimatedScale(
              duration: const Duration(milliseconds: 250),

              scale: isSelected ? 1.08 : 1,

              child: Icon(
                icon,

                color: isSelected ? primaryPink : mediumGray,

                size: 23,
              ),
            ),

            const SizedBox(height: 2),

            Text(
              label,

              style: TextStyle(
                color: isSelected ? primaryPink : mediumGray,

                fontSize: 9,

                letterSpacing: 0.8,

                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================================
// MODELO PRODUCTO
// ==========================================================

class Product {
  final String name;
  final String subtitle;
  final double price;
  final String image;
  final String description;

  Product({
    required this.name,
    required this.subtitle,
    required this.price,
    required this.image,
    required this.description,
  });

  /// Precio formateado para mostrar en la UI, ej. "$4.50".
  String get priceLabel => '\$${price.toStringAsFixed(2)}';
}

// ==========================================================
// TARJETA DE PRODUCTO
// ==========================================================

class ProductCard extends StatefulWidget {
  final Product product;
  final int index;

  const ProductCard({super.key, required this.product, required this.index});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),

      duration: Duration(milliseconds: 400 + (widget.index * 100)),

      curve: Curves.easeOutCubic,

      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 25 * (1 - value)),

          child: Opacity(opacity: value, child: child),
        );
      },

      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ProductDetailScreen(product: widget.product),
            ),
          );
        },

        onTapDown: (_) {
          setState(() {
            isPressed = true;
          });
        },

        onTapUp: (_) {
          setState(() {
            isPressed = false;
          });
        },

        onTapCancel: () {
          setState(() {
            isPressed = false;
          });
        },

        child: AnimatedScale(
          duration: const Duration(milliseconds: 150),

          scale: isPressed ? 0.96 : 1,

          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,

              borderRadius: BorderRadius.circular(20),

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 5),
                ),
              ],
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                // ==============================================
                // IMAGEN
                // ==============================================
                Expanded(
                  flex: 6,

                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(19),
                      topRight: Radius.circular(19),
                    ),

                    child: Stack(
                      fit: StackFit.expand,

                      children: [
                        Image.network(
                          widget.product.image,

                          fit: BoxFit.cover,

                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: const Color(0xFFFCE7EF),

                              child: const Icon(
                                Icons.bakery_dining,
                                color: Color(0xFFE72D70),
                                size: 42,
                              ),
                            );
                          },
                        ),

                        // DEGRADADO INFERIOR
                        Align(
                          alignment: Alignment.bottomCenter,

                          child: Container(
                            height: 50,

                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,

                                end: Alignment.bottomCenter,

                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.20),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // ==============================================
                // INFORMACION
                // ==============================================
                Expanded(
                  flex: 4,

                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(7, 9, 9, 9),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          widget.product.name,

                          maxLines: 1,

                          overflow: TextOverflow.ellipsis,

                          style: const TextStyle(
                            color: Color(0xFF24242A),

                            fontSize: 13,

                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        const SizedBox(height: 3),

                        Text(
                          widget.product.subtitle,

                          maxLines: 1,

                          overflow: TextOverflow.ellipsis,

                          style: const TextStyle(
                            color: Color(0xFF96969B),

                            fontSize: 10,
                          ),
                        ),

                        const Spacer(),

                        Row(
                          children: [
                            Text(
                              widget.product.priceLabel,

                              style: const TextStyle(
                                color: Color(0xFFE72D70),

                                fontWeight: FontWeight.w800,

                                fontSize: 14,
                              ),
                            ),

                            const Spacer(),

                            GestureDetector(
                              onTap: () {},

                              child: Container(
                                width: 33,
                                height: 33,

                                decoration: const BoxDecoration(
                                  color: Color(0xFFE72D70),
                                  shape: BoxShape.circle,
                                ),

                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
