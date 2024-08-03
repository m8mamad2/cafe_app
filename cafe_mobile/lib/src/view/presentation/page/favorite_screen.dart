import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: Theme.of(context).scaffoldBackgroundColor, ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            Container(
              margin: EdgeInsets.only(bottom: context.height*0.04),
              child: Text(
                "Your Favorites ✅",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 28),)),
        
            Expanded(
              child: GridView.builder(
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.6,
                  crossAxisCount: 2),
                itemBuilder: (context, index) {
        
                  double topPadding = index % 2 == 0 ? 10.0 : 20.0; // Example logic for dynamic top padding
                  double bottomPadding = index % 3 == 0 ? 20 : 10.0; // Example logic for dynamic bottom padding
        
                  return Padding(
                    padding: EdgeInsets.only(bottom: bottomPadding,top: topPadding),
                    child: favoriteOneCardWidget(context));
                }),
            )
        
          ],
        ),
      ),
    );
  }
}




Widget favoriteOneCardWidget(BuildContext context)=> Container(
  width: context.width * 0.38,
  margin: const EdgeInsets.symmetric(horizontal: 5),
  child: Container(
    padding: const EdgeInsets.only(left: 10,right: 10, bottom: 15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Theme.of(context).cardColor,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset('assets/food.png',),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Pitzaaa 1',style: TextStyle(color: Colors.white,fontSize: 14),),
            Text('Peperon one',style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white60),),
            const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$295',style: Theme.of(context).textTheme.labelLarge,),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: Icon(Icons.add),
                )
              ],
              )
          ],
        )
      ],
    ),
  ),
  
);