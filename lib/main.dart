import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealdbapp/view/categories/cubit/categories_cubit.dart';
import 'package:mealdbapp/view/search/cubit/search_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'core/init/di/di.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return BlocProvider<SearchCubit>(
          create: (context) => SearchCubit(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: NavigationRoute.instance.generateRoute,
            navigatorKey: NavigationService.instance.navigatorKey,
          ));
    });
  }
}
