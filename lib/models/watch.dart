class Watches{
  final String image;
  final int price;
  double rating;

  Watches({
     required this.image,
     required this.price,
     required this.rating,
  });
}

final WatchesList = [
  Watches(
    image: "images/2.png",
    price: 150,
    rating: 4.5,
  ),

  Watches(
    image: "images/1.png",
    price: 140,
    rating: 4.8,
  ),

  Watches(
    image: "images/3.png",
    price: 120,
    rating: 3.5,
  ),

  Watches(
    image: "images/4.png",
    price: 170,
    rating: 3,
  ),

];