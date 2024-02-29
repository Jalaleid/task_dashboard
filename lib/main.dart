// ignore_for_file: library_private_types_in_public_api
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_dashboard/core/utils/components/components.dart';
import 'package:task_dashboard/features/home/view/home_page.dart';
import 'core/utils/local/cache_helper.dart';
import 'package:task_dashboard/features/home/manager/cubit/home_cubit.dart';
import 'bloc_observe.dart';
import 'features/login/view/login_page.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyDduBHKfe-veAxjuM41yY-6ViO-joRSL0w',
        appId: '1:661558724636:android:3aa4cf3aa2a265d0c177d9',
        messagingSenderId: '661558724636',
        projectId: 'task-dashboard-d34e3'),
  );
  await CacheHelper.init();
  userID = await CacheHelper.getData(key: 'userID') ?? "";
  Widget startWidget =
      userID == null || userID == "" ? LoginPage() : const HomePage();
  runApp(MyApp(
    startWidget: startWidget,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.startWidget});
  final Widget startWidget;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark(useMaterial3: true),
        theme: ThemeData.light(useMaterial3: true),
        home: startWidget,
      ),
    );
  }
}

// class TimerWidget extends StatelessWidget {
//   const TimerWidget({super.key});

//   // int timerPerSec = 0;
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => TimerCubit(),
//       child: BlocBuilder<TimerCubit, TimerStates>(
//         builder: (context, state) {
//           return Scaffold(
//             body: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     '${context.read<TimerCubit>().timerPerSec}',
//                     style: const TextStyle(fontSize: 48.0),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           // timerStart();
//                           context.read<TimerCubit>().timerStart();
//                           if (kDebugMode) {
//                             print('start button pressed');
//                           }
//                         },
//                         child: const Text('Start'),
//                       ),
//                       const SizedBox(width: 16.0),
//                       ElevatedButton(
//                         onPressed: () {
//                           context.read<TimerCubit>().isStop = true;
//                           if (kDebugMode) {
//                             print('stop button pressed');
//                           }
//                         },
//                         child: const Text('Stop'),
//                       ),
//                       const SizedBox(width: 16.0),
//                       ElevatedButton(
//                         onPressed: () {},
//                         child: const Text('Reset'),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
