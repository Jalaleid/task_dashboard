import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_dashboard/core/timer_cubit/timer_cubit.dart';
import 'package:task_dashboard/core/timer_cubit/timer_states.dart';

import '../../../../core/utils/fonts/fontStyles.dart';
import 'show_one_device.dart';

class ShowDetailsAllDevice extends StatelessWidget {
  const ShowDetailsAllDevice(
      {super.key,
      required this.nameDevice,
      required this.shortName,
      required this.count,
      required this.pricePerHour});
  final String nameDevice;
  final String shortName;
  final num count;
  final num pricePerHour;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          nameDevice,
          style: Styles.textstyle16,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: count.toInt() % 2 == 0
              ? count.toInt() * 120
              : count.toInt() * 120 + 120,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: count.toInt(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: .8,
                mainAxisExtent: 220,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              return BlocProvider(
                create: (context) => TimerCubit(),
                child: BlocBuilder<TimerCubit, TimerStates>(
                  builder: (context, state) {
                    var timeCubit = context.read<TimerCubit>();
                    String sec = timeCubit.timerPerSec <= 9
                        ? '0${timeCubit.timerPerSec}'
                        : '${timeCubit.timerPerSec}';
                    String min = timeCubit.timerPerMin <= 9
                        ? '0${timeCubit.timerPerMin}'
                        : '${timeCubit.timerPerMin}';
                    String hour = timeCubit.timerPerHour <= 9
                        ? '0${timeCubit.timerPerHour}'
                        : '${timeCubit.timerPerHour}';
                    return ShowOneDevice(
                      name: shortName,
                      price: pricePerHour.toDouble(),
                      time: '$hour:$min:$sec',
                      isAvaiable: context.read<TimerCubit>().isAvailabe,
                      onPressed: () {
                        if (!timeCubit.isRunning) {
                          showDialog(
                              context: context,
                              builder: (c) => AlertDialog(
                                    title: const Text("Warning Timer"),
                                    content: const Text(
                                        "Do you want to start timer?"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            timeCubit.timerStart();
                                            timeCubit.isRunning = true;
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Start")),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Exit"))
                                    ],
                                  ));
                        } else {
                          showDialog(
                              context: context,
                              builder: (c) => AlertDialog(
                                    title: const Text("Warning Timer"),
                                    content: const Text(
                                        "Do you want to Stop Timer?"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            if (kDebugMode) {
                                              print(
                                                  '$hour:$min:$sec\ntotal price:');
                                            }
                                            timeCubit.stop = true;
                                            timeCubit.isRunning = false;
                                            var h = double.parse(hour);
                                            var m = double.parse(min) / 60;
                                            var s = double.parse(sec) / 3600;
                                            var totalPrice =
                                                pricePerHour * (h + m + s);
                                            String price =
                                                totalPrice.toString();
                                            if (kDebugMode) {
                                              print(
                                                  '$h:$m:$s\ntotal price:$totalPrice');
                                            }
                                            Navigator.pop(context);
                                            showDialog(
                                                context: context,
                                                builder: (c) => AlertDialog(
                                                      title: const Text(
                                                          "Invoice details"),
                                                      content: Text(
                                                          "Device Name is: $nameDevice \nTtotal time is: $hour:$min:$sec \nTotal Price is: ${price.substring(0, 4)}\$"),
                                                      actions: [
                                                        TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Text(
                                                                "Exit"))
                                                      ],
                                                    ));
                                          },
                                          child: const Text("Stop")),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Exit"))
                                    ],
                                  ));
                        }
                      },
                    );
                  },
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
