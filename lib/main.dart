import 'package:demo_hrpc/api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/airport_bloc.dart';
import 'screens/airport_screen.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => AirportBloc(repository: AirportRepository()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AirportScreen(),
      ),
    ),
  );
}
