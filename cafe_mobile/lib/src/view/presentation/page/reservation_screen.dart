import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/view/presentation/widget/reservation_widgets/reservation_appbar_widget.dart';
import 'package:cafe_mobile/src/view/presentation/widget/reservation_widgets/reservation_background_widget.dart';
import 'package:cafe_mobile/src/view/presentation/widget/reservation_widgets/reservation_one_table_widget.dart';
import 'package:flutter/material.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}
class _ReservationScreenState extends State<ReservationScreen> {

  final ScrollController _scrollController1 = ScrollController();
  final ScrollController _scrollController2 = ScrollController();

  @override
  void initState() {
    super.initState();
    
    _scrollController1.addListener(() {
      if (_scrollController1.offset != _scrollController2.offset) {
        _scrollController2.jumpTo(_scrollController1.offset);
      }
    });

    _scrollController2.addListener(() {
      if (_scrollController2.offset != _scrollController1.offset) {
        _scrollController1.jumpTo(_scrollController2.offset);
      }
    });
  }

  @override
  void dispose() {
    _scrollController1.dispose();
    _scrollController2.dispose();
    super.dispose();
  }
  
  
  
  @override
  Widget build(BuildContext context,) {
    return Scaffold(
      
      body: Stack(
        children: [
          Container(
              height: context.height*0.75,  
              padding: EdgeInsets.only(top: context.height *0.1),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                reverse: true,
                controller: _scrollController2,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemBuilder: (context, index) {
                  return index == 0 ||  index == 4 
                    ? oneColumnTable(context) 
                    : Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: reservationOneTableWidget(context, 0, 3));
                },
              ),
            ),
          reservationBackgroundsWidget(context, _scrollController1),
          reservationAppbarWidget(context),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: context.height*0.25,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Schedule a Visit', style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 22),),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Theme.of(context).primaryColor)
                          ),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(4),
                          child: Text('22 Jun 2023', style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14, fontWeight: FontWeight.w500),)
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Theme.of(context).primaryColor)
                          ),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(4),
                          child: Text('22 Jun 2023', style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14, fontWeight: FontWeight.w500),)
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: context.width,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Theme.of(context).primaryColor
                    ),
                    alignment: Alignment.center,
                    child: const Text('Book Table'),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}




Widget oneColumnTable(BuildContext context)=> Column(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    reservationOneTableWidget(context, 0.4,2),
    reservationOneTableWidget(context,-0.4,2),
  ],
);
