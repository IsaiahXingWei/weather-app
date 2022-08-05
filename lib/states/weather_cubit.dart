import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/models/weather_model.dart';
import 'package:flutter_project/services/weather_service.dart';
import 'package:flutter_project/states/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherLoading());

  Future<void> fetchWeather(String cityName) async {
    WeatherService weatherService = WeatherService();
    emit(WeatherLoading());

    try {
      WeatherModel weatherModel =
          await weatherService.fetchWeatherInformation(cityName);
      emit(
        WeatherLoaded(weatherModel: weatherModel),
      );
    } catch (e) {
      emit(WeatherError(
        errorMessage: e.toString()
      ));
    }
  }
}
