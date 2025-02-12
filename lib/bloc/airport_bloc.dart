import 'package:demo_hrpc/component/global.dart';
import 'package:demo_hrpc/component/permission_check.dart';
import 'package:demo_hrpc/models/airport_email_model.dart';
import 'package:demo_hrpc/models/airport_model.dart';
import 'package:demo_hrpc/api/api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'airport_event.dart';
import 'airport_state.dart';

class AirportBloc extends Bloc<AirportEvent, AirportState> {
  final AirportRepository repository;
  List<Airport> _deployedAirports = [];

  AirportBloc({required this.repository}) : super(AirportInitial()) {
    on<FetchDeployedAirports>((event, emit) async {
      emit(AirportLoading());
      try {
        if (await internetCheck() == true) {
          _deployedAirports = await repository.fetchDeployedAirports();

          print("--------->fetchDeployedAirports");
          emit(AirportLoaded(_deployedAirports));
        } else {
          emit(AirportError(global.internetMSG));
        }
      } catch (e) {
        emit(AirportError(e.toString()));
      }
    });

    on<FetchAirportsByEmail>((event, emit) async {
      emit(AirportLoading());
      try {
        if (await internetCheck() == true) {
          List<Airport> temp = [];

          GetAirportListByEmailDomainModel? airports =
              await repository.getAirportsByEmail(event.email);

          if (airports.resultArray!.isEmpty) {
          } else {
            for (int i = 0; i < _deployedAirports.length; i++) {
              if (airports.resultArray![0].airportCodes!
                  .contains(_deployedAirports[i].airportCode)) {
                temp.add(Airport(
                    airportCode: _deployedAirports[i].airportCode,
                    airportName: _deployedAirports[i].airportName,
                    airportLogo: _deployedAirports[i].airportLogo));
              }
            }
          }

          print("-----------airports----->${_deployedAirports.length}");

          emit(AirportLoaded(temp));
        } else {
          emit(AirportError(global.internetMSG));
        }
      } catch (e) {
        emit(AirportError(e.toString()));
      }
    });
  }
}
