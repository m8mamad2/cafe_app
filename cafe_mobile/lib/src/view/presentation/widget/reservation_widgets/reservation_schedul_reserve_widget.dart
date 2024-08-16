import 'package:cafe_mobile/src/core/constans/value_notifier.dart';
import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/core/widgets/is_exist_in_cart_widget.dart';
import 'package:cafe_mobile/src/view/data/model/reservation_model.dart';
import 'package:cafe_mobile/src/view/presentation/bloc/reservation_bloc/reservation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ReservationScheduleReserveWidget extends StatefulWidget {
  const ReservationScheduleReserveWidget({super.key});

  @override
  State<ReservationScheduleReserveWidget> createState() => ReservationScheduleReserveWidgetState();
}
class ReservationScheduleReserveWidgetState extends State<ReservationScheduleReserveWidget> {

  Theme customThemeForPicker(BuildContext context, Widget? child) =>Theme(
    data: ThemeData.dark().copyWith(
      dialogBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
      scaffoldBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
      colorScheme: ColorScheme.dark(primary: Theme.of(context).primaryColor)
    ),
    child: child!,
  ); 

  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
        builder: (context, child)=> customThemeForPicker(context, child),
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
  
  TimeOfDay selectedTime = TimeOfDay.now();
  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker( context: context, builder:(context, child)=> customThemeForPicker(context, child), initialTime: selectedTime);
    if (picked != null && picked != selectedTime) {
      setState(() => selectedTime = picked );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return  Align(
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
                        child: InkWell(
                          onTap: () => _selectDate(),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Theme.of(context).primaryColor)
                            ),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(4),
                            child: Text("${selectedDate.toLocal()}".split(' ')[0], style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14, fontWeight: FontWeight.w500),)
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Expanded(
                        child: InkWell(
                          onTap: () => _selectTime(),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Theme.of(context).primaryColor)
                            ),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(4),
                            child: Text("${selectedTime.hour}:${selectedTime.minute}", style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14, fontWeight: FontWeight.w500),)
                          ),
                        ),
                      ),
                    ],
                  ),
                  ValueListenableBuilder(
                    valueListenable: selectedTable,
                    builder: (context, value, child) => InkWell(
                      onTap: (){ 
                        if(value != null){
                          String date = '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}';
                          String hour = '${selectedTime.hour}:${selectedTime.minute}';
                          String table=  value.toString();

                          ReservationModel reservationModel = ReservationModel(table,6,true,date,hour);
                          context.read<ReservationBloc>().add(CreateTableReservationEvent(reservationModel));
                        }
                        else ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('first choese table')));
                      },
                      child: Container(
                        width: context.width,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Theme.of(context).primaryColor
                        ),
                        alignment: Alignment.center,
                        child: const Text('Book Table'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}