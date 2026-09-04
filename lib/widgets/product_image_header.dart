// product_image_header.dart
//
// Sección "Imagen del producto": foto principal + botón de regresar
// (back) y botón de compartir (share), superpuestos con círculos
// semitransparentes, tal como en el diseño original.
//
// 100% responsiva: si se le da un `height` fijo, ocupa ese alto (uso
// típico en móvil/tablet, dentro de una Column). Si `height` es null,
// se expande para llenar todo el espacio disponible del padre (uso
// típico en web/desktop, dentro de un Row donde el padre ya limita
// el alto con Expanded/SizedBox). El ancho SIEMPRE es fluido
// (double.infinity), por lo que la imagen se ensancha o se achica
// junto con la pantalla en cualquier caso.

import 'package:flutter/material.dart';

class ProductImageHeader extends StatelessWidget {
  final String imageUrl;
  final VoidCallback? onBackTap;
  final VoidCallback? onShareTap;

  /// Alto fijo (móvil/tablet). Si es null, la imagen se expande para
  /// llenar el alto disponible del contenedor padre (desktop/web).
  final double? height;

  const ProductImageHeader({
    super.key,
    required this.imageUrl,
    this.onBackTap,
    this.onShareTap,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final content = Stack(
      fit: StackFit.expand,
      children: [
        // ---- IMAGEN DE FONDO (responsiva: siempre ancho completo) ----
        _buildImage(),

        // ---- BOTONES FLOTANTES (back / share) ----
        // Este es el "espacio de conexión": onBackTap se puede
        // sobreescribir desde fuera (ej. para volver a la lista de
        // productos). Si no se provee, por defecto hace pop().
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _CircleIconButton(
                  icon: Icons.arrow_back,
                  onTap: onBackTap ?? () => Navigator.maybePop(context),
                ),
                _CircleIconButton(
                  icon: Icons.ios_share_outlined,
                  onTap: onShareTap ?? () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );

    // Ancho siempre fluido. Alto fijo si se especifica, si no se
    // expande al 100% del espacio disponible del padre.
    if (height != null) {
      return SizedBox(
        height: height,
        width: double.infinity,
        child: content,
      );
    }
    return SizedBox.expand(child: content);
  }

  Widget _buildImage() {
    // Si la imagen viene de internet (http/https) usa Image.network,
    // si viene de assets locales usa Image.asset.
    if (imageUrl.startsWith('http')) {
      return Image.network(
        imageUrl,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return Container(
            color: const Color(0xFF2B2B33),
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: const Color(0xFF2B2B33),
            child: const Icon(Icons.broken_image_outlined,
                color: Colors.white54, size: 40),
          );
        },
      );
    }
    return Image.asset(imageUrl, fit: BoxFit.cover);
  }
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: const Color(0xFF1C1C1E), size: 20),
      ),
    );
  }
}
