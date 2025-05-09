import 'dart:async';
import 'package:meta/meta.dart';
import 'package:streamsprac/models/modelsInput.dart';
import 'package:streamsprac/models/modelsResponse.dart';
import 'package:streamsprac/util/apiService.dart';

part 'appointment_state.dart';

class AppointmentBloc {

  ApiService apiService = new ApiService();

  StreamController<AppointmentState> streamController = StreamController();
  Stream<AppointmentState> get appointmentStream => streamController.stream;

  void eventCall(ListAppointmentsInput listAppointmentsInput) async{
    streamController.sink.add(AppointmentLoading());
    try{
      final data = await apiService.listAppointments(listAppointmentsInput);
      if(data["Status"] == 1){
        ListAppointmentsResponse listAppointmentsResponse = ListAppointmentsResponse.fromJson(data);
        streamController.sink.add(AppointmentUpdated(listAppointmentsResponse: listAppointmentsResponse));
      }
      else{
        String message = data["Message"];
        streamController.sink.add(AppointmentError(message: message));
      }
    }
    catch(e){
      print(e);
      streamController.sink.add(AppointmentError(message: e.toString()));
    }
  }

}
