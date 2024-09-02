import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/core/shimmer/shimmers_widgets/profile_screen.dart';
import 'package:cafe_mobile/src/view/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:cafe_mobile/src/view/presentation/widget/profile_widgets/profile_one_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(CurrentUserEvent(false));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if(state is LoadingUserState)return profileShimmer(context);
          if(state is SuccessUserState) {
            final data = state.userModel;
            return Column(
              children: [
                SizedBox(
                  height: context.height * 0.45,
                  child: Stack(
                    children: [
                      Container(
                        height: context.height * 0.3,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          image: const DecorationImage(
                              image: AssetImage( 'assets/profile_bg.jpg', ),
                              fit: BoxFit.cover),
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
                            LottieBuilder.asset('assets/lottie/user_lottie.json',width: context.width*0.4,),
                            Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Text(
                                  data.name ?? "No Name",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(fontSize: 22),
                                )),
                            Text(data.email ?? "xxx@gmail.com",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: context.height * 0.04,
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    children: [
                      profileOneCardWidget(context, "Your Name",    data.name ?? "no name",         'name'),
                      profileOneCardWidget(context, "Your number",  data.phoneNumber ?? "no phone", 'phoneNumber'),
                      profileOneCardWidget(context, "Your Address", data.address_name ??  'no address',  'address'),
                      profileOneCardWidget(context, "Your Orders", "",''),
                    ],
                  ),
                )
              ],
            );
          }
          if(state is FailUserState) return Text(state.error, style: const TextStyle(color: Colors.white),);
          return Container();
        },
      ),
    );
  }
}
