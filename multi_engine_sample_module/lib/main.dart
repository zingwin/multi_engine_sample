import 'package:flutter/material.dart';
import 'package:multi_engine_sample_module/detail_page.dart';
import 'package:multi_engine_sample_module/home_page.dart';

@pragma('vm:entry-point')
void main() => runApp(const HomePage());

@pragma('vm:entry-point')
void mainDetail() => runApp(const DetailPage());
