import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:app_prototype/app_prototype.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'amplifyconfiguration.dart';
import 'package:amplify_api/amplify_api.dart';
import 'models/ModelProvider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await _configureAmplify();
  } on AmplifyAlreadyConfiguredException {
    debugPrint('Amplify configuration failed.');
  }

  runApp(
    const ProviderScope(
      child: AppPrototype(),
    ),
  );
}

Future<void> _configureAmplify() async {
  final api = AmplifyAPI(modelProvider: ModelProvider.instance);
  await Amplify.addPlugins([
    AmplifyAuthCognito(),
    api,
  ]);
  await Amplify.configure(amplifyconfig);
}
