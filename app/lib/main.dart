import 'package:app/services/product/p_services.dart';
import 'package:app/view/HomeView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:sizer/sizer.dart';
import 'logic/Collection/collection_cubit.dart';
import 'logic/Product/product_cubit.dart';
import 'services/CollectionAPI/services.dart';

void main() {
  runApp(const Pizza());
}

class Pizza extends StatelessWidget {
  const Pizza({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => CollectionCubit(Services())..Collection()),
          BlocProvider(
              create: (context) =>
                  ProductCubit(P_services())..ProductGetfunction())
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          getPages: [GetPage(name: "/", page: () => HomeView())],
        ),
      );
    });
  }
}
