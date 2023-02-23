import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealdbapp/view/cubit_Example2/cubit/test2_cubit.dart';

class Testt2Screen extends StatelessWidget {
  const Testt2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: BlocProvider<Test2Cubit>(
          create: (context) => Test2Cubit(),
          child: BlocConsumer<Test2Cubit, Test2State>(
              buildWhen: (previous, current) => current is Test2Loading,
              listener: (context, state) {},
              builder: (contextt, state) {
                print("Bütün sayfa");
                return contextt.read<Test2Cubit>().isLoading == true
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("veriler geldi"),
                          BlocConsumer<Test2Cubit, Test2State>(
                              buildWhen: (previous, current) => current is Test2Count,
                              listener: (context, state) {},
                              builder: (contextt, state2) {
                                print("buton ");
                                return ElevatedButton(
                                    onPressed: () {
                                      contextt.read<Test2Cubit>().sayacArttir();
                                    },
                                    child: Text(contextt.read<Test2Cubit>().sayac.toString()));
                              })
                        ],
                      )
                    : const CircularProgressIndicator();
              })),
    ));
  }
}
