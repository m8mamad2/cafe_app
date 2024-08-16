import 'package:bloc/bloc.dart';
import 'package:cafe_mobile/src/core/utils/data_respone_state.dart';
import 'package:cafe_mobile/src/view/data/model/cart_model.dart';
import 'package:cafe_mobile/src/view/domain/use_case/cart_usecase.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {

  final CartUsecase usecase;
  CartBloc(this.usecase) : super( InitialCartState() ) {
    
        
    on<GetAllCartsEvent>((event, emit) async{
      emit(LoadingCartState());
      try{
        await usecase.getAllCart()
          .then((value) => value is DataSuccess
            ? emit(SuccessCartState(value.data))
            : emit(FailCartState(value.error ?? "error")));
      }
      catch(e){ emit(FailCartState(e.toString())); }
     });

    on<AddToCartsEvent>((event, emit) async{
      emit(LoadingCartState());
      try{
        await usecase.addToCart(event.cartModel)
          .then((value) => value is DataSuccess
            ? emit(SuccessCartState( value.data ))
            : emit(FailCartState(value.error ?? "error")));
      }
      catch(e){ print("IN BLoc ${e.toString()}"); emit(FailCartState(e.toString())); }
     });

    on<ClearCartModel>((event, emit) async{
      try{
        await usecase.clearCarts()
          .then((value) => value is DataSuccess
            ? emit(SuccessCartState(value.data))
            : emit(FailCartState(value.error ?? "error")));
      }
      catch(e){ emit(FailCartState(e.toString())); }
     });

    on<DeleteFromCartsEvent>((event, emit) async{
      try{
        await usecase.removeFromCart(event.id)
          .then((value) => value is DataSuccess
            ? emit(SuccessCartState(value.data))
            : emit(FailCartState(value.error ?? "error")));
      }
      catch(e){ emit(FailCartState(e.toString())); }
     });
    
    on<IncCartEvent>((event, emit) async{
      emit(LoadingCartState());
      try{
        await usecase.incCart(event.id, event.isInc)
          .then((value) => value is DataSuccess
            ? emit(SuccessCartState(value.data))
            : emit(FailCartState(value.error ?? "error")));
      }
      catch(e){ emit(FailCartState(e.toString())); }
     });
    
  }
}
