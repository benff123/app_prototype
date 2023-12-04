import 'package:flutter/material.dart';
import 'package:app_prototype/common/utils/colors.dart' as constants;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_prototype/provider.dart';
import 'package:app_prototype/features/devices/ui/devices_page.dart';

class Home extends ConsumerWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
