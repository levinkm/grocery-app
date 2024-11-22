import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocerygo/pages/cart.dart';
import 'package:grocerygo/pages/landing.dart';
import 'package:grocerygo/repository/category_repository.dart';
import 'package:grocerygo/repository/login_repository.dart';
import 'package:grocerygo/repository/products_repository.dart';
import 'package:grocerygo/repository/sign_up_repository.dart';

import 'modules/cart/cart_cubit.dart';
import 'modules/category/category_cubit.dart';
import 'modules/login/login_cubit.dart';
import 'modules/products/products_cubit.dart';
import 'modules/signup/sign_up_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(LoginRepository()),
        ),
        BlocProvider(
          create: (context) => SignUpCubit(SignUpRepository()),
        ),
        BlocProvider(
          create: (context) => CategoriesCubit(CategoryRepository()),
        ),
        BlocProvider(
          create: (context) => ProductsCubit(ProductsRepository()),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
          child: const CartPage(),
        ),
        // BlocProvider(
        //   create: (context) => CartCubit(),
        // )
      ],
      child: const MaterialApp(
        home: Landing(),
      ),
    );
  }

  // This widget is the root of your application.
  // @override
  // Widget build(BuildContext context) {
  //   return BlocProvider(create: (context)=> LoginCubit(LoginRepository()),
  //     child: const MaterialApp(
  //       home:  Landing(),
  //     ),
  //   );
  // }
}
