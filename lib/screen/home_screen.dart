import 'package:bloc_internet_checker/bloc/internet_bloc/internet_bloc.dart';
import 'package:bloc_internet_checker/bloc/internet_bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocConsumer<InternetBloc, InternetState>(
        builder: (context, state) {
          if (state is InternetGainedState) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Lottie.asset('assets/connected.json'),
                ),
                Text("Connected",
                    style: TextStyle(
                        color: Colors.white .withOpacity(0.7),
                        fontWeight: FontWeight.bold,
                        fontSize: 30)),
              ],
            ));
          } else if (state is InternetLostState) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Lottie.asset('assets/not_connected.json'),
                ),
                Text("Not Connected",
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 30)),
              ],
            ));
          } else {
           return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Lottie.asset('assets/loading.json'),
                ),
                // Text("Connected",
                //     style: TextStyle(
                //         color: Colors.grey[800],
                //         fontWeight: FontWeight.bold,
                //         fontSize: 30)),
              ],
            ));
          }
        },
        listener: (context, state) {
          if (state is InternetGainedState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.green,
                content: Text("Internet Connected")));
          } else if (state is InternetLostState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content: Text("Internet not Connected")));
          }
        },
      )

      // BlocBuilder<InternetBloc, InternetState>(
      //   builder: (context, state) {
      //     if (state is InternetGainedState) {
      //       return Center(child: Text("Connected"));
      //     } else if (state is InternetLostState) {
      //       return Text("Not Connected");
      //     } else {
      //       return Center(child: Text("Loading..."));
      //     }
      //   },
      // )
      ,
    );
  }
}
