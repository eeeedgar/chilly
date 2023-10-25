import 'package:chilly/features/events/domain/event.dart';
import 'package:equatable/equatable.dart';

/// Модель точки на карте
class MapPoint extends Equatable {
  const MapPoint({required this.event, 
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  /// Название населенного пункта
  final String name;

  /// Широта
  final double latitude;

  /// Долгота
  final double longitude;

  final Event event;

  @override
  List<Object?> get props => [name, latitude, longitude];
}