import 'package:demo/constants/app_color.dart';
import 'package:demo/features/Home/bloc/home_bloc.dart';
import 'package:demo/features/Home/repo/homerepo.dart';
import 'package:demo/widgets/homeCardwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    context.read<HomeBloc>().add(OnHomePressEvent());
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange,
        title: Text("Home", style: TextStyle(color: AppColors.buttonText),),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if(state is HomeLoading){
            return Center(
              child: Container(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
              ),
            );
          }
          if(state is HomeLoaded){
            return HomeCardWidget(userList: state.userList!);

          }
          if(state is HomeFailed){
            return Center(
              child: Text("Opps something wents wrong"),
            );
          }
          return Center(
            child: Text("Somethings wents wrong"),
          );
        },
      ),
    );
  }
}
