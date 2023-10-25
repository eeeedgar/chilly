import 'package:auto_route/auto_route.dart';
import 'package:chilly/app/routing/router.gr.dart';
import 'package:chilly/app/style/app_colors.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        TouchMapRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(
              label: 'Карта',
              icon: const Icon(
                Icons.map_outlined,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.map,
                color: AppColors.red,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Профиль',
              icon: const Icon(
                Icons.account_circle_outlined,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.account_circle,
                color: AppColors.red,
              ),
            ),
          ],
        );
      },
    );
  }
}
