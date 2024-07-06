import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tpop/Compo/doctormodel.dart';

class CartProvider extends ChangeNotifier {
  final List<Doctor> _cart = [];
  List<Doctor> get cart => _cart;

  void toggleProduct(Doctor product) {
    if (_cart.contains(product)) {
      for (Doctor element in _cart) {
        element.quantity++;
      }
    } else {
      _cart.add(product);
    }

    notifyListeners();
  }

  incrementQuantity(int index) => _cart[index].quantity++;
  decrementQuantity(int index) => _cart[index].quantity--;

  getTotalPrice(){
    double total =0.0;
    for(Doctor element in _cart){
      total += element.price * element.quantity;
    }
    return total;
  }
  static CartProvider of(
      BuildContext context,{
        bool listen = true,
      }){
    return Provider.of<CartProvider>(
      context,
      listen:listen,
    );
  }
}
