import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tpop/Compo/doctormodel.dart';

class FavoriteProvider extends ChangeNotifier{
  final List<Doctor> _favorites =[];
  List<Doctor> get favorites => _favorites;

  void toggleFavorite(Doctor product){
    if(_favorites.contains(product)){
      _favorites.remove(product);
    } else {
      _favorites.add(product);
    }
    notifyListeners();
  }

  bool isExist(Doctor product){
    final isExist = _favorites.contains(product);
    return isExist;
  }

  static FavoriteProvider of(
      BuildContext context,{
        bool listen = true,
      }){
    return Provider.of<FavoriteProvider>(
      context,
      listen:listen,
    );
  }
}