import 'package:flutter/material.dart';
import 'package:icm_app/application/providers/global_provider.dart';
import 'package:provider/provider.dart';
import 'infrastructure/sources/api_repository_impl.dart';

class Injector extends StatelessWidget {
  final Widget? router;

  const Injector({Key? key, this.router}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GlobalProvider>(
            create: (_) => GlobalProvider(ApiRepositoryImpl()))
      ],
      child: router,
    );
  }
}
