import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bloc/cartlistBloc.dart';
import 'model/fooditem.dart';

class Cart extends StatelessWidget {
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  @override
  Widget build(BuildContext context) {
    List<FoodItem> foodItems;
    return StreamBuilder(
      stream: bloc.listStream,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          foodItems = snapshot.data;
          return Scaffold(
            body: SafeArea(
                child: Container(
              child: CartBody(foodItems),
            )),
          );
        }
      },
    );
  }
}

class CartBody extends StatelessWidget {
  final List<FoodItem> foodItems;

  CartBody(this.foodItems);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(35, 40, 25, 0),
      child: Column(
        children: <Widget>[
          CustomAppbar(),
          title(),
          Expanded(
            flex: 1,
            child: foodItems.length > 0 ? foodItemList() : emptyContainer(),
          )
        ],
      ),
    );
  }

  Widget title() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "My",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 35),
              ),
              Text(
                "Order",
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 35),
              )
            ],
          )
        ],
      ),
    );
  }

  ListView foodItemList(){
    return ListView.builder(
      itemCount: foodItems.length,
      itemBuilder: (builder, index) {
        return CarListItem(foodItem: foodItems[index]);
      },
    );
  }

  Container emptyContainer() {
    return Container(
      child: Center(
        child: Text(
          "Empty Cart",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey[300],
              fontSize: 20),
        ),
      ),
    );
  }
}

class CustomAppbar extends StatelessWidget {
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(5),
          child: GestureDetector(
            child: Icon(
              CupertinoIcons.back,
              size: 30,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        GestureDetector(
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Icon(
              CupertinoIcons.delete,
              size: 35,
            ),
          ),
        )
      ],
    );
  }
}

class CarListItem extends StatelessWidget{
  final FoodItem foodItem;

  CarListItem({this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: ItemContent(foodItem: foodItem),
    );
  }
}

class ItemContent extends StatelessWidget{
  final FoodItem foodItem;
  ItemContent({this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
          )
        ],
      ),
    );
  }
}
