import 'package:auto_route/auto_route.dart';
import 'package:chilly/features/events/domain/event.dart';
import 'package:chilly/features/map/domain/map_point.dart';
import 'package:chilly/features/map/presentation/screens/modal_body_view.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

@RoutePage()
class TouchMapPage extends StatefulWidget {
  const TouchMapPage({super.key});

  @override
  State<TouchMapPage> createState() => _TouchMapPageState();
}

class _TouchMapPageState extends State<TouchMapPage> {
  late final YandexMapController _mapController;

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Yandex Mapkit Demo')),
      body: YandexMap(
        onMapCreated: (controller) async {
          _mapController = controller;
          // приближаем вид карты ближе к Европе
          await _mapController.moveCamera(
            CameraUpdate.newCameraPosition(
              const CameraPosition(
                target: Point(
                  latitude: 59.93,
                  longitude: 30.33,
                ),
                zoom: 10,
              ),
            ),
          );
        },
        mapObjects: _getPlacemarkObjects(context),
      ),
    );
  }
}

/// Метод для генерации точек на карте
List<MapPoint> _getMapPoints() {
  return [
    // MapPoint(name: 'Москва', latitude: 55.755864, longitude: 37.617698),
    // MapPoint(name: 'Лондон', latitude: 51.507351, longitude: -0.127696),
    // MapPoint(name: 'Рим', latitude: 41.887064, longitude: 12.504809),
    // MapPoint(name: 'Париж', latitude: 48.856663, longitude: 2.351556),
    // MapPoint(name: 'Стокгольм', latitude: 59.347360, longitude: 18.341573),
    MapPoint(
      name: 'Nevsky 1',
      latitude: 59.936888,
      longitude: 30.311951,
      event: Event(
        title: 'Посиделки с гитарой',
        dateTimeStart: DateTime(2023, 1, 13, 18),
        dateTimeEnd: DateTime(2023, 1, 13, 21),
        address: 'Невский проспект, дом 1',
        tags: ['Бесплатно', 'Музыка', 'Вечер'],
      ),
    ),
    MapPoint(
      name: 'Strelka Vas',
      latitude: 59.944035,
      longitude: 30.306605,
      event: Event(
        title: 'Делаем зарядку',
        dateTimeStart: DateTime(2023, 1, 15, 8),
        dateTimeEnd: DateTime(2023, 1, 15, 9),
        address: 'Стрелка Васильевского острова',
        tags: ['Бесплатно', 'Зарядка', 'Утро'],
      ),
    ),
    MapPoint(
      name: 'Football',
      latitude: 59.944678,
      longitude: 30.372364,
      event: Event(
        title: 'Играем в футбол',
        dateTimeStart: DateTime(2023, 5, 15, 15, 30),
        dateTimeEnd: DateTime(2023, 5, 15, 17),
        address: 'Стрелка Васильевского острова',
        tags: ['Спорт', 'Футбол', 'Под открытым небом'],
      ),
    ),
  ];
}

/// Метод для генерации объектов маркеров для отображения на карте
List<PlacemarkMapObject> _getPlacemarkObjects(BuildContext context) {
  return _getMapPoints()
      .map(
        (point) => PlacemarkMapObject(
          mapId: MapObjectId('MapObject $point'),
          point: Point(latitude: point.latitude, longitude: point.longitude),
          opacity: 1,
          icon: PlacemarkIcon.single(
            PlacemarkIconStyle(
              image: BitmapDescriptor.fromAssetImage(
                'assets/icons/map_point.png',
              ),
              scale: 2,
            ),
          ),
          onTap: (_, __) => showModalBottomSheet(
            context: context,
            builder: (context) =>
                ModalBodyView(point: point, event: point.event),
          ),
        ),
      )
      .toList();
}
