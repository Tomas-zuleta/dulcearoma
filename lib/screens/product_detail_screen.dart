// product_detail_screen.dart
//
// Pantalla de detalle de producto. Responsiva: en pantallas angostas
// (celular/tablet) apila imagen arriba + info abajo con scroll único.
// En pantallas anchas (web/desktop) muestra imagen a la izquierda fija
// y la info a la derecha con su propio scroll, tipo layout de dos
// columnas.

import 'package:flutter/material.dart';
import 'home_screen.dart' show Product;
import '../theme/app_colors.dart';
import '../models/topping_model.dart';
import '../widgets/product_image_header.dart';
import '../widgets/product_header.dart';
import '../widgets/product_description.dart';
import '../widgets/portion_selector.dart';
import '../widgets/toppings_list.dart';
import '../widgets/product_bottom_bar.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  // Punto de quiebre: por debajo es layout móvil, por encima es desktop/web.
  static const double _desktopBreakpoint = 900;

  int quantity = 1;
  bool isFavorite = false;
  int selectedPortion = 0;

  final List<String> portions = ['4-6 Portions', '8-10 Portions'];

  // TODO: en un caso real esta lista debería venir del propio Product
  // (cada producto con sus toppings disponibles), no hardcodeada aquí.
  late final List<ToppingModel> toppings = [
    ToppingModel(name: 'Extra Strawberries', price: 3.00),
    ToppingModel(name: 'Chocolate Drizzle', price: 2.00),
  ];

  void _incrementQuantity() => setState(() => quantity++);

  void _decrementQuantity() {
    if (quantity > 1) setState(() => quantity--);
  }

  void _toggleFavorite() => setState(() => isFavorite = !isFavorite);

  void _onPortionSelected(int index) => setState(() => selectedPortion = index);

  void _onToppingChanged(int index, bool value) =>
      setState(() => toppings[index].selected = value);

  void _addToCart() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.product.name} x$quantity agregado al carrito'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final isDesktop = MediaQuery.of(context).size.width >= _desktopBreakpoint;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        top: false,
        child: isDesktop
            ? _buildDesktopLayout(product)
            : _buildMobileLayout(product),
      ),
      bottomNavigationBar: isDesktop
          ? Row(
              children: [
                const Expanded(flex: 5, child: SizedBox()),
                Expanded(
                  flex: 6,
                  child: ProductBottomBar(
                    quantity: quantity,
                    onIncrement: _incrementQuantity,
                    onDecrement: _decrementQuantity,
                    onAddToCart: _addToCart,
                    contentMaxWidth: double.infinity,
                  ),
                ),
              ],
            )
          : ProductBottomBar(
              quantity: quantity,
              onIncrement: _incrementQuantity,
              onDecrement: _decrementQuantity,
              onAddToCart: _addToCart,
            ),
    );
  }

  // ==========================================================
  // LAYOUT MÓVIL / TABLET ANGOSTA
  // ==========================================================

  Widget _buildMobileLayout(Product product) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImageHeader(imageUrl: product.image, height: 320),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
            child: _buildInfoColumn(product),
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // LAYOUT DESKTOP / WEB ANCHA
  // ==========================================================

  Widget _buildDesktopLayout(Product product) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: ProductImageHeader(imageUrl: product.image, height: null),
        ),
        Expanded(
          flex: 6,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(32, 32, 32, 24),
            child: _buildInfoColumn(product),
          ),
        ),
      ],
    );
  }

  // ==========================================================
  // COLUMNA DE INFO (compartida entre ambos layouts)
  // ==========================================================

  Widget _buildInfoColumn(Product product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductHeader(
          title: product.name,
          tag: product.subtitle,
          price: product.price,
          isFavorite: isFavorite,
          onFavoriteTap: _toggleFavorite,
        ),
        const SizedBox(height: 18),
        ProductDescription(text: product.description),
        const SizedBox(height: 20),
        const Divider(color: AppColors.border),
        const SizedBox(height: 12),
        PortionSelector(
          portions: portions,
          selectedIndex: selectedPortion,
          onSelected: _onPortionSelected,
        ),
        const SizedBox(height: 20),
        const Divider(color: AppColors.border),
        const SizedBox(height: 4),
        ToppingsList(toppings: toppings, onChanged: _onToppingChanged),
        // Espacio extra para que el contenido no quede pegado a la
        // barra inferior fija al hacer scroll.
        const SizedBox(height: 12),
      ],
    );
  }
}
