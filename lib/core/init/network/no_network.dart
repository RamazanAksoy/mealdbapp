import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:context_holder/context_holder.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NoNetworkManager {
  final VoidCallback? onRetry;
  final bool isEnable;

  NoNetworkManager({required this.onRetry, this.isEnable = false});

  Future<void> show() async {
    if (!isEnable) return;
    if (await _checkConnectivity()) return;

    await showModalBottomSheet<void>(
        context: ContextHolder.currentContext,
        builder: (BuildContext context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.refresh,
                        size: 23.sp,
                      ),
                      onPressed: () {
                        onRetry?.call();
                      }),
                  Text(
                    "İnternet bağlantınızı kontrol ediniz",
                  )
                ],
              ),
            ],
          );
        });
/*
    await GetBottomSheet.bottomshet(onRety: () {
      Get.back();
      onRetry?.call();
    });*/
  }

  Future<bool> _checkConnectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) return false;
    return true;
  }
}
