part of 'appointment_bloc.dart';

@immutable
sealed class AppointmentState {
  late ListAppointmentsResponse listAppointmentsResponse;
  AppointmentState({required this.listAppointmentsResponse});
}

final class AppointmentInitial extends AppointmentState {
  AppointmentInitial(): super(listAppointmentsResponse: ListAppointmentsResponse(appointments: [], status: null, message: null));
}
final class AppointmentLoading extends AppointmentState {
  AppointmentLoading(): super(listAppointmentsResponse:ListAppointmentsResponse(appointments: [], status: null, message: null));
}
final class AppointmentError extends AppointmentState {
  AppointmentError({required String message}): super(listAppointmentsResponse: ListAppointmentsResponse(appointments: [], status: null, message: message));
}
final class AppointmentUpdated extends AppointmentState {
  AppointmentUpdated({required ListAppointmentsResponse listAppointmentsResponse}): super(listAppointmentsResponse: listAppointmentsResponse);
}
