class ItemModel {
  late final int id;
  final String title;
  final String description;
  final num price;
  final String image;
  final num? rate;

  ItemModel( {required this.id, required this.title, required this.description,
    required this.price, required this.image, this.rate});
}

final List<ItemModel> items = [
  ItemModel(
    id: 1,
    title: "Cheeseburger Wendy's Burger",
    description: "The Cheeseburger Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, it's topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles.",
    price: 29.99,
    image: "assets/images/product1.png",
    rate: 4.5,
  ),
  ItemModel(
    id: 2,
    title: "Hamburger Veggie Burger",
    description: "Enjoy our delicious Hamburger Veggie Burger, made with a savory blend of fresh vegetables and herbs, topped with crisp lettuce, juicy tomatoes, and tangy pickles, all served on a soft, toasted bun.",
    price: 19.99,
    image: "assets/images/product2.png",
    rate: 3.8,
  ),

  ItemModel(
    id: 3,
    title: "Margherita Pizza",
    description: "A classic Italian Margherita Pizza made with a crispy thin crust, topped with fresh tomato sauce, mozzarella cheese, and fresh basil leaves.",
    price: 24.99,
    image: "assets/images/pizza1.png",
    rate: 4.7,
  ),
  ItemModel(
    id: 4,
    title: "Pepperoni Pizza",
    description: "Delicious Pepperoni Pizza topped with spicy pepperoni slices, mozzarella cheese, and tangy tomato sauce on a perfectly baked crust.",
    price: 26.99,
    image: "assets/images/pizza2.png",
    rate: 4.6,
  ),
  // New Meal Items
  ItemModel(
    id: 5,
    title: "Grilled Chicken Meal",
    description: "A healthy Grilled Chicken Meal served with steamed vegetables, mashed potatoes, and a side of tangy BBQ sauce.",
    price: 34.99,
    image: "assets/images/chicken.png",
    rate: 4.9,
  ),
  ItemModel(
    id: 6,
    title: "Beef Steak Meal",
    description: "Juicy Beef Steak Meal served with creamy mashed potatoes, sautéed green beans, and a rich mushroom gravy.",
    price: 39.99,
    image: "assets/images/beefmeal.png",
    rate: 4.8,
  ),
];
