import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height :context.height*0.45,
            child: Stack(
              children: [

                Container(
                  height: context.height*0.3,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    image: const DecorationImage(image: AssetImage('assets/profile_bg.jpg',),fit: BoxFit.cover),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/user.jpeg'),
                        radius: 60,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text("Ali",style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 22),)),
                      Text("Ali@gmail.com",style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w300,fontSize: 15)),
                    ],
                  ),
                )
                
              ],
            ),
          ),
          SizedBox(height: context.height*0.06,),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              children: [
                profileOneCardWidget(context, "Your Name", "Mamaly"),
                profileOneCardWidget(context, "Phone number", "09193493"),
                profileOneCardWidget(context, "Your Address", "Blod-Ho-98Alley"),
                profileOneCardWidget(context, "Your Favorite", ">"),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget profileOneCardWidget(BuildContext context, String title, String subTitle)=> Container(
  width: double.infinity,
  height: context.height*0.08,
  decoration: BoxDecoration(
    color: Theme.of(context).cardColor,
    borderRadius: BorderRadius.circular(10)
  ),
  padding: const EdgeInsets.symmetric(horizontal: 20),
  margin: const EdgeInsets.symmetric(vertical: 8),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title, style: Theme.of(context).textTheme.labelSmall,),
      Text(subTitle,style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold,fontSize: 12)),
    ],
  ),
);