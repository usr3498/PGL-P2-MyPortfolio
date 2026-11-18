import 'dart:ui' show Color;

class PlaceTypes {
  static const types = [
    'Playa', 'Caminata', 'Miradores', 'Acampadas', 'Tirolinas', 'Rutas coche', 'Lugares interesantes',
  ];

  static const levels = {
    'Fácil': Color(0xFF6CCB9B),
    'Intermedio': Color(0xFFF2B94B),
    'Difícil': Color(0xFFE5675C),
  };

  static const islands = [
    'Tenerife', 'Gran Canaria', 'Lanzarote', 'Fuerteventura', 'La Palma', 'La Gomera', 'El Hierro',
  ];
}