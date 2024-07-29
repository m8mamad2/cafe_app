import 'package:cafe_mobile/src/core/extenstion/extencions.dart';
import 'package:cafe_mobile/src/core/utils/error_dialog.dart';
import 'package:cafe_mobile/src/view/data/model/auth_model/auth_signup_req_model.dart';
import 'package:cafe_mobile/src/view/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:cafe_mobile/src/view/presentation/page/home_screen.dart';
import 'package:cafe_mobile/src/view/presentation/widget/auth_widgets/auth_submit_widget.dart';
import 'package:cafe_mobile/src/view/presentation/widget/auth_widgets/auth_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthSignupWidget extends StatefulWidget {
  const AuthSignupWidget({super.key});

  @override
  State<AuthSignupWidget> createState() => _AuthSignupWidgetState();
}

class _AuthSignupWidgetState extends State<AuthSignupWidget> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  
  bool isHide = false;
  handleHideTap()=> setState(()=> isHide = !isHide);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          
              Padding(
                padding: EdgeInsets.only(bottom: context.height*0.02,top: context.height*0.06),
                child: Text('Login To Your Account', style: Theme.of(context).textTheme.titleLarge,),
              ),
              
              authTextFieldWidget(context,emailController,"Email", false, false, (){}),
              authTextFieldWidget(context,passwordController,"Password",true, isHide, handleHideTap),
          
              const Spacer(),
          
              BlocConsumer<AuthBloc, AuthState>( 
                listener: (context, state) {
                  if(state is AuthStateSuccess) context.navigate(const HomeScreen());
                  if(state is AuthStateFail) errorDialog(context, state.error ?? 'There is A problem \n please Try Again');
                 },
                builder: (context, state) {
                  
                  onTap(){
                    AuthSignupReqModel model = AuthSignupReqModel(
                      email: emailController.text,
                      password: passwordController.text,
                      userName: usernameController.text
                    );
                    context.read<AuthBloc>().add(AuthenticationEvent(null, model, false));
                  }

                  if(state is AuthStateLoading) return authSubmitWidget(context,(){}, true);
                  if(state is AuthStateInitial || state is AuthStateSuccess) return authSubmitWidget(context, onTap, false);
                  if(state is AuthStateFail)return authSubmitWidget(context, onTap, false);
                  return Container();
                },
              )
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.only(right: context.width*0.25,top: context.height*0.035),
              child: RotatedBox(
                quarterTurns: 3,
                child: Image.asset(
                  'assets/arrow2.png', 
                  color: Theme.of(context).primaryColor,
                  width: context.width*0.2,),
              ),
            ),
          )
        ],
      ),
    );
  }
}