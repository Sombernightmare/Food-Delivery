class FoodItemList {
  List<FoodItem> foodItems;

  FoodItemList({this.foodItems});
}

class FoodItem {
  int id;
  String title;
  String restaurant;
  double price;
  String imgUrl;
  int quantity;

  FoodItem(
      {this.id,
      this.title,
      this.restaurant,
      this.price,
      this.imgUrl,
      this.quantity = 1});

  void incrementQuantity() {
    quantity++;
  }

  void decrementQuantity() {
    if (quantity > 0) quantity--;
  }
}

//Model data
FoodItemList foodItemList = FoodItemList(foodItems: [
  FoodItem(
      id: 1,
      title: "Food 1",
      restaurant: "Painted Bell Chophouse",
      price: 7.99,
      imgUrl:
          "https://cdn.pixabay.com/photo/2016/03/05/19/02/hamburger-1238246__340.jpg"),
  FoodItem(
      id: 2,
      title: "Food 2",
      restaurant: "Sage Platter Eats",
      price: 12.99,
      imgUrl:
          "https://cdn.pixabay.com/photo/2014/10/19/20/59/hamburger-494706__340.jpg"),
  FoodItem(
      id: 3,
      title: "Food 3",
      restaurant: "Azure Carrot Bistro",
      price: 9.99,
      imgUrl:
          "https://cdn.pixabay.com/photo/2016/11/18/15/03/burger-1835192__340.jpg"),
  FoodItem(
      id: 2,
      title: "Food 4",
      restaurant: "Boca Gourmand Cookery",
      price: 8.99,
      imgUrl:
          "https://cdn.pixabay.com/photo/2019/01/29/20/00/hamburger-3963181__340.jpg"),
  FoodItem(
      id: 3,
      title: "Food 5",
      restaurant: "Rolling Heron Roadhouse",
      price: 9.99,
      imgUrl:
          "https://cdn.pixabay.com/photo/2014/09/03/15/05/sandwich-434658__340.jpg")
]);
