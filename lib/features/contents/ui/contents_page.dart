import 'package:flutter/material.dart';
import 'package:app_prototype/common/utils/colors.dart' as constants;

import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:app_prototype/models/ModelProvider.dart';
import 'package:app_prototype/amplifyconfiguration.dart';
import 'package:amplify_api/amplify_api.dart';

import 'package:amplify_flutter/amplify_flutter.dart';

class Contents extends StatelessWidget {
  Contents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Contents'),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              fetchCurrentUserAttributes();
              createContent();
            },
            child: Text('TextButton'),
          ),
        ],
      )),
    );
  }
}

Future<void> createContent() async {
  try {
    final content = Content(name: "test", weight: 0.5, type: 1);

    final request = ModelMutations.create(content);

    final response = await Amplify.API.mutate(request: request).response;

    final createdContent = response.data;

    if (createdContent == null) {
      safePrint('errors: ${response.errors}');

      return;
    }

    safePrint('Mutation result: ${createdContent.id}');
  } on ApiException catch (e) {
    safePrint('Mutation failed: $e');
  }
}

Future<void> fetchCurrentUserAttributes() async {
  try {
    final result = await Amplify.Auth.fetchUserAttributes();

    for (final element in result) {
      safePrint('key: ${element.userAttributeKey}; value: ${element.value}');
    }
  } on AuthException catch (e) {
    safePrint('Error fetching user attributes: ${e.message}');
  }
}
