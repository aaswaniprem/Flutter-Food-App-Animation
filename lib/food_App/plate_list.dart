class Plates {
  String image;
  String title;
  String price;
  String weight;

  Plates({this.image, this.title, this.price, this.weight});
}

List<Plates> plates = [
  Plates(
      image: "assets/chicken_salad.png",
      title: "Chicken salad",
      price: "₹ 70.00",
      weight: "350 g"),
  Plates(
      image: "assets/greek_Salad.png",
      title: "Greek salad",
      price: "₹ 50.00",
      weight: "450 g"),
  Plates(
      image: "assets/meat_Salad.png",
      title: "Meat salad",
      price: "₹ 85.00",
      weight: "400 g"),
];
