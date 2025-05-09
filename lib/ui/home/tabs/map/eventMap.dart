class CityEvent {
  final int id;
  final String name;
  final double lat;
  final double log;

  CityEvent({
    required this.id,
    required this.name,
    required this.lat,
    required this.log,
  });
}

 List<CityEvent> ListEventCity = [
  CityEvent(id: 1, name: 'Cairo', lat: 30.0444, log: 31.2357),
  CityEvent(id: 2, name: 'Alexandria', lat: 31.2001, log: 29.9187),
  CityEvent(id: 3, name: 'Giza', lat: 30.0131, log: 31.2089),
  CityEvent(id: 4, name: 'Luxor', lat: 25.6872, log: 32.6396),
  CityEvent(id: 5, name: 'Aswan', lat: 24.0889, log: 32.8998),
  CityEvent(id: 6, name: 'Sharm El-Sheikh', lat: 27.9158, log: 34.3290),
  CityEvent(id: 7, name: 'Hurghada', lat: 27.2579, log: 33.8116),
  CityEvent(id: 8, name: 'Mansoura', lat: 31.0379, log: 31.3815),
];
