import 'package:flutter/material.dart';
import 'package:fooddelivoryapp/data/data.dart';
import 'package:fooddelivoryapp/models/restaurant.dart';
import 'package:fooddelivoryapp/screens/cart_screen.dart';
import 'package:fooddelivoryapp/screens/restaurant_screen.dart';
import 'package:fooddelivoryapp/widgets/rating_stars.dart';
import 'package:fooddelivoryapp/widgets/recent_orders.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildRestaurants(){
    List<Widget> restaurantList = [];
    restaurants.forEach((Restaurant restaurant) {
      restaurantList.add(
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_)=>RestaurantScreen(restaurant: restaurant))),
            child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
      decoration:BoxDecoration(
            color: Colors.white,
        borderRadius: BorderRadius.circular(15.0,),
        border: Border.all(
            width: 1.0,
            color: Colors.grey,
        )
      ) ,
        child: Row(children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Hero(
                tag: restaurant.imageUrl?? 'default_image_path',
                child: Image(
                  height: 150.0,
                  width: 150.0,
                  image: AssetImage(restaurant.imageUrl ?? 'default_image_url'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget> [
                Text(restaurant.name ?? '',
                style: TextStyle(fontSize: 20.0,
                fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                ),
                RatingStars(restaurant.rating ?? 0),

                SizedBox(height: 4.0),
                Text(restaurant.address ?? '',
                     style: TextStyle(
                       fontSize: 16.0,
                       fontWeight: FontWeight.w600,
                     ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.0),
                Text('0.2 miles away',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,),

              ],
            ),

            )
        ],),
      ),
          ));
    });
    return Column(children: restaurantList);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          iconSize: 30.0,
          onPressed: () {},
        ),
        title: Center(
          child: Text('Food Delivery'),
        ),
        actions: <Widget>[
          TextButton(

            onPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (_)=>CartScreen(),
            ),
            ),
            child: Text('Cart (${currentUser.cart?.length})',
            style: TextStyle(color: Colors.white,fontSize: 16.0,
              fontWeight: FontWeight.w600,),
            ),

          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(width: 0.8),
                ),
                enabledBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(width: 0.8, color: Theme.of(context).primaryColor),
                ),
                hintText: 'Search Food or Restaurants',
                prefixIcon: Icon(
                  Icons.search,
                  size: 30,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          RecentOrders(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('Nearby Restaurants',style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),),
            ),
              _buildRestaurants(),
          ],),
        ],
      ),
    );
  }
}
