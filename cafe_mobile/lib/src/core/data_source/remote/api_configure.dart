
import 'package:cafe_mobile/src/core/data_source/remote/api_end_points.dart';
import 'package:cafe_mobile/src/core/data_source/remote/api_interceptor.dart';
import 'package:cafe_mobile/src/core/utils/data_respone_state.dart';
import 'package:dio/dio.dart';

class Api {

  static Dio dio = Dio(
    BaseOptions( 
      baseUrl: ApiEndPoints.kBaseUrl, 
      connectTimeout: const Duration(seconds: 20),) ) 
        ..interceptors.add(AuthCheckerInterceptor());

  Future<DataState> get(String path)async{
    try{
      final Response res = await dio.get(path);
      if( res.statusCode == 200 || res.statusCode == 201 ) return DataSuccess(res);
      else return DataFailed(res.data); 
    }
    on DioException catch(e){
      // final err = e.response?.data as Map<String, dynamic>;
      // if(e.response?.statusCode == 400) return { false : err.values.first?.toString() ?? errorFigureout( e.response?.statusCode ?? 0)};
      return DataFailed(e.response?.data ?? "There is a Problem with your Request ...!");
    }
    catch(e){ return DataFailed(e.toString()); }
  }
  
  Future<DataState> post(String path, dynamic reqModel )async{
    try{
      final Response res = await dio.post(path, data: reqModel);
      if( res.statusCode == 200 || res.statusCode == 201 )return DataSuccess(res);
      else return DataFailed(res.data);
    }
    on DioException catch(e){
      // final err = e.response?.data as Map<String, dynamic>;
      // if(e.response?.statusCode == 400) return { false : err.values.first?.toString() ?? errorFigureout( e.response?.statusCode ?? 0)};
      return DataFailed(e.response?.data ?? "There is a Problem with your Request ...!");
    }
    catch(e){ return DataFailed(e.toString()); }
  }
  
}


