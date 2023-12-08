import 'package:flutter/material.dart';
import 'package:app_prototype/common/utils/colors.dart' as constants;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_prototype/provider.dart';

import 'package:app_prototype/features/home/ui/home_page.dart';
import 'package:app_prototype/features/devices/ui/devices_page.dart';
import 'package:app_prototype/features/contents/ui/contents_page.dart';

import 'package:app_prototype/common/navigation/router/routes.dart';

import 'package:go_router/go_router.dart';

class Base extends ConsumerWidget {
  const Base({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bodies = [
      Home(),
      Devices(),
      Contents(),
    ];
    final indexBottomNavbar = ref.watch(indexBottomNavbarProvider);
    return Scaffold(
      body: bodies[indexBottomNavbar],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexBottomNavbar,
        onTap: (value) {
          ref.read(indexBottomNavbarProvider.notifier).update((state) => value);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Devices'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Contents'),
        ],
      ),
    );
  }
}
