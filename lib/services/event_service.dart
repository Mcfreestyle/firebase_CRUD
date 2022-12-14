import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:session8_api/models/event_model.dart';

class EventService extends ChangeNotifier {
  final String baseURL =
      'https://api-flutter-2c208-default-rtdb.firebaseio.com';
  final List<Event> events = [];
  late Event selectEvent;
  bool isLoading = true;
  bool isSaving = false;

  EventService() {
    showEvents();
  }

  Future<List<Event>> showEvents() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse('$baseURL/events.json');
    final response = await http.get(url);
    final Map<String, dynamic> eventsMap = json.decode(response.body);
    print('Map of events: $eventsMap');

    eventsMap.forEach((key, value) {
      final event = Event.fromMap(value);
      event.id = key;
      events.add(event);
    });

    isLoading = false;
    notifyListeners();

    return events;
  }

  Future saveOrCreateEvent(Event event) async {
    isSaving = true;
    notifyListeners();

    if (event.id == null) {
      await createEvent(event);
    } else {
      await updateEvent(event);
    }
    isSaving = false;
    notifyListeners();
  }

  Future<String> updateEvent(Event event) async {
    final url = Uri.parse('$baseURL/events/${event.id}.json');
    final response = await http.put(url, body: event.toJson());
    print(response.body);
    final index = events.indexWhere((element) => element.id == event.id);

    events[index] = event;
    return event.id!;
  }

  Future<String> createEvent(Event event) async {
    final url = Uri.parse('$baseURL/events.json');
    final response = await http.post(url, body: event.toJson());
    final decodedData = json.decode(response.body);
    print(decodedData);

    event.id = decodedData[
        'name']; //firebase generates an id('name') for the new event
    events.add(event);
    return event.id!;
  }

  Future<String> deleteEvent(Event event) async {
    final url = Uri.parse('$baseURL/events/${event.id}.json');
    final response = await http.delete(url);
    print(response.body);

    final index = events.indexWhere((element) => element.id == event.id);
    events.removeAt(index);

    notifyListeners();
    return event.id!;
  }
}
