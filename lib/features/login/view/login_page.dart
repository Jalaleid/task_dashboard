// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_dashboard/features/home/view/home_page.dart';
import '../../../core/utils/components/components.dart';
import '../../../core/utils/fonts/fontStyles.dart';
import '../../signup/view/signup_page.dart';
import '../manager/cubit/login_cubit.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  var fromKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            // context.read<HomeCubit>().getData();

            NavigateAndFinish(context, const HomePage());
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Form(
                  key: fromKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Welcome',
                        style: Styles.textstyle32AndBold,
                      ),
                      Text(
                        'Back',
                        style: Styles.textstyle28Andw800
                            .copyWith(color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InputField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        lable: 'Email Address',
                        prefixIconData: Icons.email_outlined,
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return 'email address mustn\'t empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InputField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        isPassword: context.read<LoginCubit>().isPassword,
                        lable: 'Password',
                        prefixIconData: Icons.lock_outline,
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return 'password mustn\'t empty';
                          } else if (p0.length <= 5) {
                            return 'password is short';
                          }
                          return null;
                        },
                        suffixIconData: context.read<LoginCubit>().suffix,
                        onPressed: () {
                          context.read<LoginCubit>().changePasswoedVisibility();
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      if (state is! LoginLoding)
                        defualtButton(
                          title: 'Login',
                          onPressed: () {
                            if (fromKey.currentState!.validate()) {
                              context.read<LoginCubit>().login(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                        ),
                      if (state is LoginLoding)
                        const Center(
                          child: CircularProgressIndicator(),
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text('if you don\'t have an account '),
                          InkWell(
                            onTap: () {
                              //context.read<LoginCubit>().close();
                              NavigateTo(context, SignupPage());
                            },
                            child: Text(
                              'SignUp',
                              style:
                                  TextStyle(color: Colors.deepPurple.shade300),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
