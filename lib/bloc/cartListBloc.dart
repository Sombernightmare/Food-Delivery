import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import '../model/fooditem.dart';
import 'provider.dart';

class CartListBloc extends BlocBase {
  CartProvider provider = CartProvider();

CartListBloc();

//Stream that receives a number and changes the count;
var _listController = BehaviorSubject<List<FoodItem>>.seeded([]);
//output
Stream<List<FoodItem>> get listStream => _listController.stream;
//input
Sink<List<FoodItem>> get listSink => _listController.sink;

//dispose will be called automatically by closing its streams
@override
void dispose() {
  _listController.close();
  super.dispose();
}

//business logic
addToList(FoodItem foodItem){
  listSink.add(provider.addToList(foodItem));
}

removeFromList(FoodItem foodItem){
  listSink.add(provider.removeFromList(foodItem));
}

}