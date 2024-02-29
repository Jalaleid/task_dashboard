import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_dashboard/features/home/manager/cubit/home_cubit.dart';
import 'package:task_dashboard/features/login/view/login_page.dart';
import '../../../core/utils/components/components.dart';
import '../../../core/utils/fonts/fontStyles.dart';
import 'widgets/show_details_all_device.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit()..getData(),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is HomesignOutSuccess) {
              NavigateAndFinish(context, LoginPage());
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Scaffold(
                  body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (state is HomeGetDataLoading)
                      Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 2,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: (MediaQuery.of(context).size.width - 30) /
                                    2),
                            child: const CircularProgressIndicator(),
                          ),
                        ],
                      ),
                    if (state is HomeGetDataError)
                      Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 2,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 2),
                            child: const Center(
                              child: Text('An error occurred!'),
                            ),
                          ),
                        ],
                      ),
                    if (state is HomeGetDataSuccess)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                            ShowDetailsAllDevice(
                              nameDevice: 'PlayStation 5',
                              count:
                                  context.read<HomeCubit>().devices.CountPS5!,
                              shortName: 'PS5',
                              pricePerHour: context
                                      .read<HomeCubit>()
                                      .devices
                                      .PricePerHourPS5 ??
                                  1,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Divider(),
                            ),
                            ShowDetailsAllDevice(
                              nameDevice: 'PlayStation 4',
                              count:
                                  context.read<HomeCubit>().devices.CountPS4!,
                              shortName: 'PS4',
                              pricePerHour: context
                                      .read<HomeCubit>()
                                      .devices
                                      .PricePerHourPS4 ??
                                  1,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Divider(),
                            ),
                            ShowDetailsAllDevice(
                              nameDevice: 'Computer Games',
                              count: context.read<HomeCubit>().devices.CountPC!,
                              shortName: 'PC',
                              pricePerHour: context
                                      .read<HomeCubit>()
                                      .devices
                                      .PricePerHourPC ??
                                  1,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            defualtButton(
                              title: 'signOut',
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (c) => AlertDialog(
                                          title: const Text("Warning"),
                                          content: const Text(
                                              'Do you want to signOut?'),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text("NO")),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  context
                                                      .read<HomeCubit>()
                                                      .signOut();
                                                },
                                                child: const Text("YES")),
                                          ],
                                        ));
                              },
                              color: Colors.deepOrange,
                            ),
                            const SizedBox(
                              height: 15,
                            )
                          ],
                        ),
                      )
                  ],
                ),
              )),
            );
          },
        ));
  }
}
