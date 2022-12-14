import 'package:flutter/material.dart';
import 'package:session8_api/models/event_model.dart';

class EventFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Event event;
  EventFormProvider(this.event);

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }
}
