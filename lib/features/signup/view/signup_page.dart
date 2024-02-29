// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_dashboard/features/add_devices/view/add_devices_page.dart';
import '../../../core/utils/components/components.dart';
import '../../../core/utils/fonts/fontStyles.dart';
import '../../login/view/login_page.dart';
import '../cubit/signup_cubit.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  var fromKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var repasswordController = TextEditingController();
  var phoneController = TextEditingController();
  var PCController = TextEditingController();
  var PS4Controller = TextEditingController();
  var PS5Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            NavigateAndFinish(context, AddDevicesPage());
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Center(
                  child: Form(
                    key: fromKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Hello',
                            style: Styles.textstyle32AndBold,
                          ),
                          Text(
                            'And Welcome',
                            style: Styles.textstyle28Andw800
                                .copyWith(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InputField(
                            controller: nameController,
                            keyboardType: TextInputType.text,
                            lable: 'Name',
                            prefixIconData: Icons.person_2_outlined,
                            validator: (p0) {
                              if (p0!.isEmpty) {
                                return 'name must not empty';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InputField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            lable: 'Phone',
                            prefixIconData: Icons.call,
                            validator: (p0) {
                              if (p0!.isEmpty) {
                                return 'phone must not empty';
                              }
                              return null;
                            },
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
                                return 'email address must not empty';
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
                            isPassword: context.read<SignUpCubit>().isPassword,
                            lable: 'Password',
                            prefixIconData: Icons.lock_outline,
                            validator: (p0) {
                              if (p0!.isEmpty) {
                                return 'password must not empty';
                              } else if (p0.length <= 5) {
                                return 'password is short';
                              }
                              return null;
                            },
                            suffixIconData: context.read<SignUpCubit>().suffix,
                            onPressed: () {
                              context
                                  .read<SignUpCubit>()
                                  .changePasswordVisibility();
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InputField(
                            controller: repasswordController,
                            keyboardType: TextInputType.visiblePassword,
                            isPassword:
                                context.read<SignUpCubit>().isrePassword,
                            lable: 'Re-Password',
                            prefixIconData: Icons.lock_outline,
                            validator: (p0) {
                              if (p0!.isEmpty) {
                                return 'password must not empty';
                              } else if (p0.length <= 5) {
                                return 'password is short';
                              }
                              return null;
                            },
                            suffixIconData:
                                context.read<SignUpCubit>().resuffix,
                            onPressed: () {
                              context
                                  .read<SignUpCubit>()
                                  .changeRePasswordVisibility();
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          if (state is! SignUpLoading)
                            defualtButton(
                              title: 'Signup',
                              onPressed: () {
                                if (fromKey.currentState!.validate()) {
                                  context.read<SignUpCubit>().SignUp(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );
                                }
                              },
                            ),
                          if (state is SignUpLoading)
                            const Center(child: CircularProgressIndicator()),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text('if you have an account '),
                              InkWell(
                                onTap: () {
                                  // context.read<SignUpCubit>().close();
                                  NavigateAndFinish(context, LoginPage());
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.deepPurple.shade300),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
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
