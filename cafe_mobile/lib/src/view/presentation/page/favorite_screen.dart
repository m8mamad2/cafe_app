import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/core/shimmer/shimmers_widgets/favorite_shimmer.dart';
import 'package:cafe_mobile/src/core/widgets/empty_widget.dart';
import 'package:cafe_mobile/src/view/presentation/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:cafe_mobile/src/view/presentation/widget/favorite_widgets/favorite_one_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}
class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteBloc>().add(GetAllFavoriteEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(  horizontal: 10, ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: context.height * 0.06,bottom: context.height * 0.02),
                    child: Text(
                      "Your Favorites ✅",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 28),
                    )),
                  Container(
                    margin: const EdgeInsets.only(bottom: 13),
                    child: IconButton(
                      onPressed: ()=> context.read<FavoriteBloc>().add(ClearAllFavoriteEvent()), 
                      icon: const Icon(Icons.delete_outline, color: Colors.white,size: 32,)),
                  ),
                ],
              ),
            ),
            
            Expanded(
              child: BlocBuilder<FavoriteBloc, FavoriteState>(
                builder: (context, state) {
                  if(state is LoadingFavoriteState) return favoriteShimmer(context);
                  if(state is SuccessFavoriteState){
                    final data = state.favoriteData;
                    return data != null && data.isNotEmpty 
                      ? Container(
                        margin: const EdgeInsets.only(bottom: 70),
                        child: GridView.builder(
                            itemCount: data.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 10,
                                    childAspectRatio: 0.6,
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              double topPadding = index % 2 == 0 ? 10.0 : 20.0;
                              double bottomPadding = index % 3 == 0 ? 20 : 10.0; 
                              return Padding(
                                  padding: EdgeInsets.only(bottom: bottomPadding, top: topPadding),
                                  child: favoriteOneCardWidget(context, data[index]));
                            }),
                      )
                      : emptyWidget(context, (){},false, 'The Favorite is Empty');
                  };
                  if(state is FailFavoriteState) return emptyWidget(context, (){}, true ,state.error);
                  return Container();
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
