class FoodItemList{
  List<FoodItem> foodItems;

  FoodItemList({this.foodItems});
}

class FoodItem{

  int id;
  String title;
  String hotel;
  double price;
  String imgUrl;
  int quantity;


  FoodItem({
    this.id,
    this.title,
    this.hotel,
    this.price,
    this.imgUrl,
    this.quantity = 1    
  });

  void incrementQuantity(){
    quantity++;
  }

  void decrementQuantity(){
    if(quantity > 0)
      quantity--;
  }

}


//Model data
FoodItemList foodItemList = FoodItemList(foodItems: [
  FoodItem(
    id: 1,
    title: "Food 1",
    hotel: " Hotel name",
    price: 0,
    imgUrl: ""),
    FoodItem(
    id: 2,
    title: "",
    hotel: "",
    price: 0,
    imgUrl: ""),
    FoodItem(
    id: 3,
    title: "",
    hotel: "",
    price: 0,
    imgUrl: "")
    ]
    );