import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildContent(),
    );
  }

  AppBar _buildAppbar(BuildContext context) => AppBar(
        title: Text(AppLocalizations.of(context)!.app_name),
      );

  Widget _buildContent() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Center(
              child: Text('#$index'),
            ),
          );
        },
      );
}
