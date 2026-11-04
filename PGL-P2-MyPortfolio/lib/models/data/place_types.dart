import 'dart:ui' show Color;

class PlaceTypes {
  static const types = [
    'Tipo de actividad', 'Playa', 'Caminata', 'Miradores', 'Acampadas', 'Tirolinas', 'Rutas coche', 'Lugares interesantes',
  ];

  static const levels = {
    'Dificultad': Color.fromARGB(255, 236, 238, 237),
    'Fácil': Color(0xFF6CCB9B),
    'Intermedio': Color(0xFFF2B94B),
    'Difícil': Color(0xFFE5675C),
  };

  static const islands = [
    'Isla', 'Tenerife', 'Gran Canaria', 'Lanzarote', 'Fuerteventura', 'La Palma', 'La Gomera', 'El Hierro',
  ];
}