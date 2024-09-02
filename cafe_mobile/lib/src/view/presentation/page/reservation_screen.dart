
import 'package:cafe_mobile/src/core/constans/value_notifier.dart';
import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/core/shimmer/shimmers_widgets/reservation_shimmer.dart';
import 'package:cafe_mobile/src/view/presentation/bloc/reservation_bloc/reservation_bloc.dart';
import 'package:cafe_mobile/src/view/presentation/widget/reservation_widgets/reservation_appbar_widget.dart';
import 'package:cafe_mobile/src/view/presentation/widget/reservation_widgets/reservation_background_widget.dart';
import 'package:cafe_mobile/src/view/presentation/widget/reservation_widgets/reservation_one_table_widget.dart';
import 'package:cafe_mobile/src/view/presentation/widget/reservation_widgets/reservation_schedul_reserve_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

    context.read<ReservationBloc>().add(GetAllTableReservationEvent());
    
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
    return PopScope(
      onPopInvokedWithResult: (didPop, result) => selectedTableId.value = null,
      child: Scaffold(
        body: Stack(
          children: [
            reservationBackgroundsWidget(context, _scrollController1),
            BlocBuilder<ReservationBloc, ReservationState>(
              builder: (context, state) {
                if(state is LoadingReservationState)return reservationShimmer(context);
                if(state is SuccessReservationState){
                  
                  final data = state.reservationModel;
                  data.sort((a, b) => int.parse(a.table).compareTo(int.parse(b.table)));
      
                  return  ValueListenableBuilder<int?>(
                    valueListenable: selectedTableId,
                    builder:(context, value, child) => Container(
                        height: context.height*0.75,  
                        padding: EdgeInsets.only(top: context.height *0.1),
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data.length,
                          reverse: true,
                          controller: _scrollController2,
                          padding: const EdgeInsets.only(top: 20),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(mainAxisExtent: context.width * 0.45,crossAxisCount: 2), 
                          itemBuilder: (context, index) {
                            return data[index].is_reserver 
                                ? reservationOneTableWidget(context, true, true, data[index].id )
                                : value != null  
                                  ? value == data[index].id 
                                    ? reservationOneTableWidget(context,  true, false, data[index].id)
                                    : reservationOneTableWidget(context,  false,false, data[index].id)
                                  : reservationOneTableWidget(context,    false, false, data[index].id); 
                              
                        }),
                      ),
                  );
                }
                if(state is FailReservationState) return Text(state.error , style: const TextStyle(color: Colors.white),);
                return Container();
              },
            ),
            reservationAppbarWidget(context),
            const ReservationScheduleReserveWidget(),
          ],
        ),
      ),
    );
  }
}


