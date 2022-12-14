import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:session8_api/providers/event_provider.dart';
import 'package:session8_api/services/event_service.dart';
import 'package:session8_api/widgets/textformfield_widget.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    final eventService = Provider.of<EventService>(context);
    return ChangeNotifierProvider(
      create: (_) => EventFormProvider(eventService.selectEvent),
      child: const EventFormPage(),
    );
  }
}

class EventFormPage extends StatelessWidget {
  const EventFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    final eventForm = Provider.of<EventFormProvider>(context);
    final event = eventForm.event;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Evento'),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              CustomTextFormField(
                initialValue: event.name,
                hintText: 'Nombre del evento',
                onChanged: (value) => event.name = value,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                initialValue: event.date,
                hintText: 'Fecha del evento',
                onChanged: (value) => event.date = value,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                initialValue: event.place,
                hintText: 'Lugar del evento',
                onChanged: (value) => event.place = value,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                initialValue: event.image,
                hintText: 'URL de la imagen',
                onChanged: (value) => event.image = value,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final eventService =
              Provider.of<EventService>(context, listen: false);
          eventService.saveOrCreateEvent(event);
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
