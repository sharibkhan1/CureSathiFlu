import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tpop/Appointment/Details.dart';
import 'package:tpop/provider/favprovider.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final finalList = provider.favorites;
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Color(0xFF51604F),
            height: 90,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0,left: 20),
              child: Row(
                children: [
                  Text(
                    "Favourite Doctor",
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: finalList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8),
                  child: Slidable(
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            finalList.removeAt(index);
                            setState(() {});
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.favorite_border_outlined,
                          label: "Dislike",
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DocDetail(doctor: finalList[index]),
                          ),
                        );
                      },
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
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            subtitle: Text(
                              finalList[index].subtitle,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white60,
                              ),
                            ),
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(finalList[index].image),
                              backgroundColor: Colors.red.shade100,
                            ),
                            trailing: Text(
                              "\$${finalList[index].price}",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
