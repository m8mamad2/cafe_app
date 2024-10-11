import 'package:bloc/bloc.dart';
import 'package:cafe_mobile/src/core/utils/data_respone_state.dart';
import 'package:cafe_mobile/src/view/data/model/order_model.dart';
import 'package:cafe_mobile/src/view/domain/use_case/auth_usecase.dart';
import 'package:cafe_mobile/src/view/domain/use_case/order_usecase.dart';
import 'package:meta/meta.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final AuthUseCase userUsecase;
  final OrderUsecase usecase;
  OrderBloc(this.usecase,this.userUsecase) : super(InitialOrderState()) {
    
    on<GetAllOrderEvent>((event, emit) async {
      emit(LoadingOrderState());
      try{
        await usecase.getAllOrders().then((e)=> 
          e is DataSuccess 
            ? emit(SuccessOrderState(e.data))
            : emit(FailOrderState(e.error ?? 'Error')) );
      }
      catch(e){ emit(FailOrderState(e.toString())); }
    });

    on<AddOrderEvent>((event, emit) async {
      emit(LoadingOrderState());
      try{
        await usecase.addToOrder(event.orderModel).then((e)=> 
          e is DataSuccess 
            ? emit(SuccessAddOrderState())
            : emit(FailOrderState(e.error ?? 'Error')) );
      }
      catch(e){ emit(FailOrderState(e.toString())); }
    });

    on<CompleteOrderEvent>((event, emit) async {
      emit(LoadingOrderState());
      try{
        await usecase.completeOrder(event.orderId).then((e)=> 
          e is DataSuccess 
            ? emit(SuccessOrderState(e.data))
            : emit(FailOrderState(e.error ?? 'Error')) );
      }
      catch(e){ emit(FailOrderState(e.toString())); }
    });

  }
}
