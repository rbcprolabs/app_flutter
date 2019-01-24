import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rbk/model/views/ViewModel.dart';
import 'package:rbk/widgets/home/Input.dart';


class AddItem extends StatefulWidget {
  final ViewModel model;

  AddItem(this.model);

  @override
  Input createState() => Input();
}