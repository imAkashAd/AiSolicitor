import 'package:flutter/material.dart';
import 'package:ryanlord/app.dart';
import 'package:ryanlord/services/call_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CallService.initialize();
  runApp(const RyanLord());
}