import 'package:flutter/material.dart';
import 'package:game_app/provider/provider_status.dart';

class ProviderStatusView extends StatelessWidget {
  final ProviderStatusType status;
  const ProviderStatusView({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(status.text));
  }
}
