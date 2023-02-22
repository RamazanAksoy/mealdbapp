import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealdbapp/view/cubit_Example/cubit/testt_cubit.dart';
import 'package:mealdbapp/view/cubit_Example/cubit/testt_state.dart';

class TesttScreen extends StatelessWidget {
  const TesttScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: BlocProvider<TesttCubit>(
          create: (context) => TesttCubit(),
          child: BlocConsumer<TesttCubit, TestState>(
              listener: (context, state) {},
              buildWhen: (previous, current) => previous.isLoading != current.isLoading,
              builder: (contextt, state) {
                print("Bütün sayfa");
                return state.isLoading == true
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("veriler geldi"),
                          BlocConsumer<TesttCubit, TestState>(
                              listener: (context, state) {},
                              buildWhen: (previous, current) => previous.sayac != current.sayac,
                              builder: (tt, state2) {
                                print("buton ");
                                return ElevatedButton(
                                    onPressed: () {
                                      tt.read<TesttCubit>().sayacArttir();
                                    },
                                    child: Text(state2.sayac.toString()));
                              })
                        ],
                      )
                    : const CircularProgressIndicator();
              })),
    ));
  }
}
