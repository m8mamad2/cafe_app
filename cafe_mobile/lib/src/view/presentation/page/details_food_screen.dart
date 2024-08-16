import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/view/data/model/food_model.dart';
import 'package:cafe_mobile/src/view/presentation/widget/details_food_add_button_widget.dart';
import 'package:flutter/material.dart';

class DetailsFoodScreen<T> extends StatefulWidget {
  final FoodModel? data;
  const DetailsFoodScreen({super.key, required this.data});

  @override
  State<DetailsFoodScreen> createState() => _DetailsFoodScreenState();
}
class _DetailsFoodScreenState extends State<DetailsFoodScreen> {

  late String currentImage;
  changeCurrentImage(String image)=> setState(() => currentImage = image);
  
  @override
  void initState() {
    super.initState();
    currentImage = widget.data!.images![0];
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(  
              children: [
                
                Container(
                  width: context.width,
                  height: context.height*0.35 ,
                  padding: const EdgeInsets.all(15),
                  decoration:  BoxDecoration(
                    border: Border.symmetric(
                      vertical: BorderSide(color: Theme.of(context).primaryColor)
                    ),
                    color: Theme.of(context).cardColor,
                    borderRadius: const BorderRadius.only( bottomLeft: Radius.circular(1000), bottomRight: Radius.circular(1000), )),
                  child: Center(
                    child: Container(
                      decoration:  const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            offset: Offset(0, 2 ),
                            blurRadius: 10,
                            spreadRadius: 0.1,
                          )
                        ]
                      ),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        transitionBuilder: (child, animation) => ScaleTransition(scale: animation, child: child,),
                        child: Image.network( 
                          context.convertImageUrl(currentImage),
                          key: ValueKey(currentImage), ))),
                  ),),
                
                oneImageWidget(context,EdgeInsets.only(top: context.height*0.32), widget.data?.images?[1] ?? '',changeCurrentImage),
                oneImageWidget(context,EdgeInsets.only(top: context.height*0.38,left: context.width*0.36), widget.data?.images?[2] ?? '', changeCurrentImage),
                Align(
                  alignment: Alignment.centerRight,
                  child: oneImageWidget(context, EdgeInsets.only(top: context.height*0.32),widget.data?.images?[3] ?? '',changeCurrentImage ),
                ),
                
              
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    SizedBox(height: context.height*0.05),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('${widget.data?.title}🔥',style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 21)),
                        Container(
                          margin: const EdgeInsets.only(bottom: 6),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: '\$ ', style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Theme.of(context).primaryColor,fontSize: 35)),
                                TextSpan(text: widget.data?.price.toString(), style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w900,fontSize: 28)),
                              ]
                          )),
                        )
                      ],
                    ),
                    
                    SizedBox(height: context.height*0.02,),
                    
                    Text(widget.data?.description ?? '',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.grey),),
                    
                    const Spacer(),
                    
                    DetailsFoodAddButtonWidget(foodModel: widget.data!)
                  
                  ],
                ),),
            )
          ],
        )
      ),
    );
  }
}

oneImageWidget(BuildContext context,EdgeInsets margin,String imageUrl, Function(String image) changeCurrentImage)=> Container(
    margin: margin,
    width: context.width*0.26,
    height: context.height*0.12,
    padding: const EdgeInsets.all(2),
    decoration:  BoxDecoration(
      border: Border.all(color: Theme.of(context).primaryColor),
      shape: BoxShape.circle,
    ),
    child: InkWell(
      onTap: ()=> changeCurrentImage(imageUrl),
      child: Image.network(context.convertImageUrl(imageUrl))),
  );


