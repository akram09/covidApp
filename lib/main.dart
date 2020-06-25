
import 'package:covid_app/bloc/bloc_delegate.dart';
import 'package:covid_app/bloc/covid_bloc.dart';
import 'package:covid_app/data/covid_api.dart';
import 'package:covid_app/screens/screens.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final dio = Dio();
  // adding options you can add interceptor here  TODO:
  dio.options.baseUrl ="";
  dio.options.connectTimeout = 5000; //5s
  dio.options.receiveTimeout = 3000;
  dio.interceptors.add(PrettyDioLogger(
    requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90
  ));
  runApp(
    MyApp(client: CovidApiClient(dio: dio),)

  );
}
class MyApp extends StatelessWidget {
  final CovidApiClient client ; 
  const MyApp({Key key, this.client}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Covid App",
      theme: ThemeData(
        primaryColor: Color.fromRGBO(250, 128, 82,1)
      
      ),
      home:BlocProvider(create: (context){
        return CovidBloc(client: client)..add(LoadInitialData());
      },
      child: MainScreen(),
      
      )
    );
  }
}



