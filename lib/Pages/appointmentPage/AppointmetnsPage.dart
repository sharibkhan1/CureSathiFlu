import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tpop/Appointment/Details.dart';
import 'package:tpop/Navbar/nav_menu.dart';
import 'package:tpop/provider/cartProvider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late DateTime? date;
  late TimeOfDay? time;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (arguments != null) {
      date = arguments['date'];
      time = arguments['time'];
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final finalList = provider.cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF51604F),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios,color: Colors.white,),
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const NavigationMenu(),
                  ),
                );
              },
            );
          },
        ),
        title: Text('Appointment',style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: finalList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigate to doctor's detail page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DocDetail(doctor: finalList[index]),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Slidable(
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              finalList[index].quantity = 1;
                              finalList.removeAt(index);
                              setState(() {});
                            },
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: "Cancel\n Appointment",
                          ),
                        ],
                      ),
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xFF51604F),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: ListTile(
                            title: Text(
                              finalList[index].title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            subtitle: Text(
                              'Date: 25/06/24\n Time:02:30',

                              //'Date: ${widget.date?.day}/${widget.date?.month}/${widget.date?.year}\nTime: ${widget.time?.hour}:${widget.time?.minute.toString().padLeft(2, '0')}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(finalList[index].image),
                              backgroundColor: Colors.red.shade100,
                            ),
                            trailing: Column(
                              // children: [
                              //   _buildProductQuantity(Icons.add, index),
                              //   Text(
                              //     finalList[index].quantity.toString(),
                              //     style: TextStyle(
                              //         fontSize: 10,fontWeight: FontWeight.bold
                              //     ),
                              //   ),
                              //   _buildProductQuantity(Icons.remove, index),
                              // ],
                            ),
                            tileColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                )),
          )
        ],
      ),
    );
  }
}
