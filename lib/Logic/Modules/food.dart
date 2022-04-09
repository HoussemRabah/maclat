class Food {
  String name;
  String price;
  String disc;
  String image;
  Store store;
  Food(
      {required this.name,
      required this.price,
      required this.disc,
      required this.image,
      required this.store});
}

class Store {
  String name;
  String rate;
  Store({required this.name, required this.rate});
}
