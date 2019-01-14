import 'package:flutter/material.dart';
import 'package:rbk/config.dart';

class ContainerList extends StatelessWidget {
  ContainerList({this.children});

  final children;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(PADDING),
      children: children,
    );
  }
}
