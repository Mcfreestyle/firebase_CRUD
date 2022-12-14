import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:session8_api/models/event_model.dart';
import 'package:session8_api/services/event_service.dart';
import 'package:session8_api/widgets/card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print('building HomePage');
    final eventService = Provider.of<EventService>(context);

    if (eventService.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eventos'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: eventService.events.length,
        itemBuilder: (BuildContext context, int index) {
          final event = eventService.events[index];
          return HomeEventsCard(
            name: event.name,
            date: event.date,
            place: event.place,
            image: event.image,
            onTap: () {
              eventService.selectEvent = event;
              Navigator.pushNamed(context, 'event_page');
            },
            deleteFunction: () {
              eventService.deleteEvent(event);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          eventService.selectEvent =
              Event(name: '', date: '', place: '', image: '');
          Navigator.pushNamed(context, 'event_page');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
