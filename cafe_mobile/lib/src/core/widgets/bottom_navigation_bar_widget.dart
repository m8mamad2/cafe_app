import 'package:cafe_mobile/src/core/constans/bottom_navigation_bar_items.dart';
import 'package:cafe_mobile/src/core/constans/value_notifier.dart';
import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/view/presentation/page/reservation_screen.dart';
import 'package:flutter/material.dart';


class BottomNavigationBarWidget extends StatelessWidget {

  final int selected;
  // final Function(int selectedIndex) changeScreen;
  const BottomNavigationBarWidget({super.key, required this.selected });
  
  @override
  Widget build(BuildContext context) {

    Color isSelected(int index)=> selected == index ? Theme.of(context).primaryColor :  Colors.white70;

    return Positioned(
      bottom: 0,
      child: SizedBox(
        width: context.width,
        height: 70,
        child: Stack(
          children: [
              
            CustomPaint(
              painter: _CurvedPainter(context),
              size: Size(
                context.width,
                80,
              ),
            ),
          
            Center(
              heightFactor: 0.4,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius:const BorderRadius.all(Radius.circular(180)),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).primaryColor.withOpacity(0.4),
                      blurRadius: 3,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: FloatingActionButton(
                  backgroundColor: Theme.of(context).primaryColor,
                  elevation: 2.0,
                  mini: false,
                  onPressed: () => context.navigate(const ReservationScreen()),
                  shape: const CircleBorder(),
                  child: const Icon( Icons.table_bar_outlined, ),
                ),
              ),
            ),
          
            Container(
              height: 90,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: bottomNavigationBarItmes.map(
                  (e)=> !e.title.contains('reserve') 
                    ? IconButton(
                        onPressed: ()=> bottomNavigationIndex.value = e.index, 
                        icon: Icon(
                          e.icon, 
                          shadows: [ BoxShadow(color: selected == e.index ? Theme.of(context).primaryColor : const Color.fromARGB(255, 43, 42, 42), blurRadius: 25) ],
                          color: isSelected(e.index) ))
                    : SizedBox(width:  context.width * 0.20,)).toList(),
              ),
            )
          
          ],
        ),
      ),
    );
  }
}

class _CurvedPainter extends CustomPainter {
  final BuildContext  context;
  _CurvedPainter(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromARGB(255, 43, 42, 42)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 5); //! Start
    path.quadraticBezierTo(size.width * 0.10, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20), radius: const Radius.elliptical(6, 4), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 5);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, -30);
    canvas.drawShadow(path, Colors.white54, 10.0, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
  
}

