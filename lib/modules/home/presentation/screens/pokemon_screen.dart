import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.addPostFrameCallback}) : super(key: key);
  final VoidCallback? addPostFrameCallback;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final _homeCubit = ServiceLocatorImp.I.get<HomeCubit>();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Text('Home Screen'),
        ),
      );
}
