class Doctor {
  final int id;
  final String image;
  final String title;
  final String subtitle;
  final String diftitle;
  final int price;
  final String specialty;
  final String address;
  final double rating;
 // bool liked;
  int quantity;

  Doctor({
    required this.id,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.diftitle,
    required this.price,
    required this.specialty,
    required this.address,
    required this.rating,
  //  this.liked = false,
    required this.quantity,

  });

  factory Doctor.fromMap(Map<String, dynamic> map) {
    return Doctor(
      id: map['id'],
      image: map['image'],
      title: map['title'],
      subtitle: map['subtitle'],
      diftitle: map['diftitle'],
      price: map['price'],
      specialty: map['specialty'],
      address: map['address'],
      rating: map['rating'],
   //   liked: map['liked'] ?? false,
      quantity:map['quantity'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'subtitle': subtitle,
      'diftitle': diftitle,
      'price': price,
      'specialty': specialty,
      'address': address,
      'rating': rating,
   //   'liked': liked,
      'quantity':quantity,
    };
  }
}
