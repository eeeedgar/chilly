import 'package:chilly/app/style/app_colors.dart';
import 'package:chilly/app/style/app_text_styles.dart';
import 'package:chilly/features/events/domain/event.dart';
import 'package:chilly/features/map/domain/map_point.dart';
import 'package:chilly/features/map/presentation/widgets/tag_box.dart';
import 'package:flutter/material.dart';

/// Содержимое модального окна с информацией о точке на карте
class ModalBodyView extends StatelessWidget {
  const ModalBodyView({super.key, required this.point, required this.event});

  final MapPoint point;
  final Event event;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              event.title,
              style: AppTextStyles.h1,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.place_outlined),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Адрес',
                      style: AppTextStyles.h3,
                    ),
                    Text(event.address)
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.access_time),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Время',
                      style: AppTextStyles.h3,
                    ),
                    Text(event.getDuration())
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Теги',
              style: AppTextStyles.h2,
            ),
            const SizedBox(height: 10),
            Wrap(
              direction: Axis.horizontal,
              children: [
                ...event.tags.map(
                  (e) => TagBox(tag: e),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.red,
                minimumSize: const Size.fromHeight(50), // NEW
              ),
              onPressed: () {},
              child: Text(
                'Пойду',
                style: AppTextStyles.h1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
