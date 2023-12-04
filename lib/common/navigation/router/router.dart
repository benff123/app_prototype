import 'package:app_prototype/common/navigation/router/routes.dart';
import 'package:app_prototype/features/trip/ui/trips_list/trips_list_page.dart';
import 'package:app_prototype/features/home/ui/home_page.dart';
import 'package:app_prototype/features/devices/ui/devices_page.dart';
import 'package:app_prototype/features/base/ui/base_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: "base",
      builder: (context, state) => const Base(),
    ),
    GoRoute(
      path: '/home',
      name: "home",
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: '/devices',
      name: "devices",
      builder: (context, state) => const Devices(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text(state.error.toString()),
    ),
  ),
);
