String errorFigureout(int statusMessage){
  switch(statusMessage){
    case 400 : return ' 400 - مشکلی از سمت کاربر پیش آمده';
    case 401 : return ' 401 - شما احراز هویت نشده اید';
    case 404 : return ' 404 - درخواست شما پیدا نشد';
    case 500: return '  500 - مشکلی از سمت سرور پیش آمده.لطفا دوباره تلاش کنید';
    default: return 'مشکلی پیش آمده. لطفا دوباره تلاش کنید !';
  }
}