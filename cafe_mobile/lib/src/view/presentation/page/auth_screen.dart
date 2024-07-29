import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/view/presentation/widget/auth_widgets/auth_login_widget.dart';
import 'package:cafe_mobile/src/view/presentation/widget/auth_widgets/auth_signup_widget.dart';
import 'package:cafe_mobile/src/view/presentation/widget/auth_widgets/auth_tab_bar_button.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin{

  late PageController _pageController;
  late TabController  _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _tabController = TabController(length: 2, vsync: this);
  }
  
  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _tabController.dispose();
  }

  void _onPageChange(int currentPageIndex) {
    _tabController.index = currentPageIndex;
    setState(() => _currentIndex = currentPageIndex );
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageController.animateToPage( index, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut,);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.height,
          child: Column(
            children: [
              Container(
                height: context.height * 0.5,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  )
                ),
                child: Column(
                  children: [
                    const Expanded(
                      flex: 6,
                      child: RiveAnimation.asset('assets/foodie.riv')),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          tabBarButton(context,'Login', _currentIndex == 0, ()=> _updateCurrentPageIndex(0)),
                          SizedBox(width: context.width*0.1,),
                          tabBarButton(context,'Sign up', _currentIndex == 1, ()=> _updateCurrentPageIndex(1)),
                        ],
                      )),
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: _onPageChange,
                  children: const [
                    AuthLoginWidget(),
                    AuthSignupWidget(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
