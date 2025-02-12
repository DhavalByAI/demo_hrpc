abstract class AirportEvent {
  @override
  List<Object?> get props => [];
}

class FetchDeployedAirports extends AirportEvent {}

class FetchAirportsByEmail extends AirportEvent {
  final String email;
  FetchAirportsByEmail(this.email);

  @override
  List<Object?> get props => [email];
}
