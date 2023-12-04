import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:app_prototype/common/navigation/router/router.dart';
import 'package:app_prototype/common/utils/colors.dart' as constants;
import 'package:flutter/material.dart';

import 'package:app_prototype/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppPrototype extends ConsumerWidget {
  const AppPrototype({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Authenticator(
      child: MaterialApp.router(
        routerConfig: router,
        builder: Authenticator.builder(),
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch(primarySwatch: constants.primaryColor)
                  .copyWith(
            background: const Color(0xff82CFEA),
          ),
        ),
      ),
    );
  }
}
