import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tpop/Compo/NetwokManager.dart';

class GeneralBindings extends Bindings{
  @override
  void dependencies(){
    Get.put(NetworkManager());
  }
}