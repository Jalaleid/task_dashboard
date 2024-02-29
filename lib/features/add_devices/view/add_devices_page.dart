// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_dashboard/core/utils/components/components.dart';
import 'package:task_dashboard/core/utils/fonts/fontStyles.dart';
import 'package:task_dashboard/features/add_devices/manager/cubit/add_devices_cubit.dart';
import 'package:task_dashboard/features/home/view/home_page.dart';

class AddDevicesPage extends StatelessWidget {
  AddDevicesPage({super.key});
  var CountPS5 = TextEditingController();
  var PricePerHourPS5 = TextEditingController();
  var CountPS4 = TextEditingController();
  var PricePerHourPS4 = TextEditingController();
  var CountPC = TextEditingController();
  var PricePerHourPC = TextEditingController();

  var fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AddDevicesCubit(),
        child: SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(
                key: fromKey,
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Dashboard',
                          style: Styles.textstyle32AndBold,
                        ),
                        Text(
                          'Devices',
                          style: Styles.textstyle24AndBold
                              .copyWith(color: Colors.grey.shade500),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'PlayStation 5',
                          style: Styles.textstyle16,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InputField(
                            controller: CountPS5,
                            keyboardType: TextInputType.number,
                            lable: 'Count Device',
                            validator: (p0) {
                              if (p0!.isEmpty) {
                                return 'Count PS5 must not empty';
                              }
                              return null;
                            },
                            prefixIconData: Icons.numbers),
                        const SizedBox(
                          height: 20,
                        ),
                        InputField(
                            controller: PricePerHourPS5,
                            keyboardType: TextInputType.number,
                            lable: 'Price Device Per Hour',
                            validator: (p0) {
                              if (p0!.isEmpty) {
                                return 'Price Per Hour PS5 must not empty';
                              }
                              return null;
                            },
                            prefixIconData: Icons.price_change_outlined),
                        const SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.grey.shade400,
                        ),
                        const Text(
                          'PlayStation 4',
                          style: Styles.textstyle16,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InputField(
                            controller: CountPS4,
                            keyboardType: TextInputType.number,
                            lable: 'Count Device',
                            validator: (p0) {
                              if (p0!.isEmpty) {
                                return 'Count PS54 must not empty';
                              }
                              return null;
                            },
                            prefixIconData: Icons.numbers),
                        const SizedBox(
                          height: 20,
                        ),
                        InputField(
                            controller: PricePerHourPS4,
                            keyboardType: TextInputType.number,
                            lable: 'Price Device Per Hour',
                            validator: (p0) {
                              if (p0!.isEmpty) {
                                return 'Price Per Hour PS5 must not empty';
                              }
                              return null;
                            },
                            prefixIconData: Icons.price_change_outlined),
                        const SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.grey.shade400,
                        ),
                        const Text(
                          'Computer',
                          style: Styles.textstyle16,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InputField(
                            controller: CountPC,
                            keyboardType: TextInputType.number,
                            validator: (p0) {
                              if (p0!.isEmpty) {
                                return 'Price Per Hour PC must not empty';
                              }
                              return null;
                            },
                            lable: 'Count Device',
                            prefixIconData: Icons.numbers),
                        const SizedBox(
                          height: 20,
                        ),
                        InputField(
                            controller: PricePerHourPC,
                            validator: (p0) {
                              if (p0!.isEmpty) {
                                return 'Price Per Hour PC must not empty';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            lable: 'Price Device Per Hour',
                            prefixIconData: Icons.price_change_outlined),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        BlocConsumer<AddDevicesCubit, AddDevicesState>(
                          listener: (context, state) {
                            if (state is AddDevicesSuccess) {
                              NavigateAndFinish(context, const HomePage());
                            }
                          },
                          builder: (context, state) {
                            if (state is! AddDevicesLoading) {
                              return defualtButton(
                                  title: 'Go To Home Page',
                                  onPressed: () {
                                    if (fromKey.currentState!.validate()) {
                                      context
                                          .read<AddDevicesCubit>()
                                          .AddDevices(
                                              // uId: user?.uId ?? '',
                                              CountPS5: CountPS5.text,
                                              PricePerHourPS5:
                                                  PricePerHourPS5.text,
                                              CountPS4: CountPS4.text,
                                              PricePerHourPS4:
                                                  PricePerHourPS4.text,
                                              CountPC: CountPC.text,
                                              PricePerHourPC:
                                                  PricePerHourPC.text);
                                    }
                                  });
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ]),
                ),
              ),
            ),
          ),
        ));
  }
}
