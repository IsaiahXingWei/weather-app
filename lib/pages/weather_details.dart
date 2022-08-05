import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/states/weather_cubit.dart';
import 'package:flutter_project/states/weather_state.dart';
import 'package:flutter_project/widget/weather_information.dart';

class WeatherDetail extends StatelessWidget {
  const WeatherDetail({required this.cityName, Key? key}) : super(key: key);

  final String cityName;

  @override
  Widget build(BuildContext context) {
    WeatherCubit cubit = BlocProvider.of<WeatherCubit>(context)
    ..fetchWeather(cityName);

    return Scaffold(
      appBar: AppBar(
        title: Text(cityName),
      ),
      body: Center(
        child: BlocBuilder<WeatherCubit, WeatherState>(
          bloc: cubit,
          builder: (context, state) {
            if (state is WeatherLoading) {
              return const CircularProgressIndicator();
            }

            if (state is WeatherLoaded) {
              return WeatherInformation(weatherModel: state.weatherModel);
            }

            return Text(
              state is WeatherError ?
                state.errorMessage : 'No results for $cityName, try inputting a different city'
            );
          },
        ),
      ),
    );
  }
}
