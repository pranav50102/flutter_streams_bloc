import 'dart:convert';


class LoginResponse {
  int? status;
  String? message;
  UserInfo? userDetails;

  LoginResponse({
    required this.status,
    required this.message,
    required this.userDetails,
  });

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json["Status"];
    message = json["Message"];
    userDetails = json["UserDetails"] != null ? UserInfo.fromJson(json["UserDetails"]) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["Status"] = status;
    data["Message"] = message;
    data["UserDetails"] = userDetails?.toJson();
    return data;
  }
}
class UserInfo{
  int? userId;
  int? hospitalId;
  int? fiscalYearId;
  String? firstName;
  String? lastName;

  UserInfo({
    required this.userId,
    required this.hospitalId,
    required this.fiscalYearId,
    required this.firstName,
    required this.lastName,
  });
  UserInfo.fromJson(Map<String, dynamic> json) {
    userId = json["UserId"];
    hospitalId = json["HospitalId"];
    fiscalYearId = json["FiscalYearId"];
    firstName = json["FirstName"];
    lastName = json["LastName"];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["UserId"] = userId;
    data["HospitalId"] = hospitalId;
    data["FiscalYearId"] = fiscalYearId;
    data["FirstName"] = firstName;
    data["LastName"] = lastName;
    return data;
  }
}

class ForgotPwdResponse{
  int? OTP;
  int? status;
  String? message;

  ForgotPwdResponse({
    required this.OTP,
    required this.status,
    required this.message,
  });
  ForgotPwdResponse.fromJson(Map<String, dynamic> json) {
    OTP = json["OTP"];
    status = json["Status"];
    message = json["Message"];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["OTP"] = OTP;
    data["Status"] = status;
    data["Message"] = message;
    return data;
  }
}

class ListAppointmentsResponse{
  late List<AppointmentInfo> appointments;
  int? status;
  String? message;

  ListAppointmentsResponse({
    required this.appointments,
    required this.status,
    required this.message,
  });
  ListAppointmentsResponse.fromJson(Map<String, dynamic> json) {
    appointments = (json["Appointments"] as List).map((i) => AppointmentInfo.fromJson(i)).toList();
    status = json["Status"];
    message = json["Message"];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    List list  = [];
    appointments.forEach((val){
      list.add(val.toJson());
    });
    data["Appointments"] = list;
    data["Status"] = status;
    data["Message"] = message;
    return data;
  }
}

class AppointmentInfo{
  int? id;
  String? patientName;
  String? mobileNo;
  String? specialization;
  String? MRNO;
  double? age;
  String? time;
  String? apptStatus;

  AppointmentInfo({
    required this.id,
    required this.patientName,
    required this.mobileNo,
    required this.specialization,
    required this.MRNO,
    required this.age,
    required this.time,
    required this.apptStatus,
  });

  AppointmentInfo.fromJson(Map<String, dynamic> json) {
    id = json["Id"];
    patientName = json["PatientName"];
    mobileNo = json["MobileNo"];
    specialization = json["Specialization"];
    MRNO = json["MRNO"];
    age = json["Age"];
    time = json["Time"];
    apptStatus = json["ApptStatus"];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["Id"] =id;
    data["PatientName"] = patientName;
    data["MobileNo"] = mobileNo;
    data["Specialization"] = specialization;
    data["MRNO"] = MRNO;
    data["Age"] = age;
    data["Time"] = time;
    data["ApptStatus"] = apptStatus;
    return data;
  }
}

class SearchPatientsApptResponse{
  late List<AppointmentInfo> appointments;
  int? status;
  String? message;

  SearchPatientsApptResponse({
    required this.appointments,
    required this.status,
    required this.message,
  });

  SearchPatientsApptResponse.fromJson(Map<String, dynamic> json) {
    appointments = (jsonDecode(json["Appointments"]) as List).map((i) =>
        AppointmentInfo.fromJson(i)).toList();
    status = json["Status"];
    message = json["Message"];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    List list  = [];
    appointments.forEach((val){
      list.add(val.toJson());
    });
    data["Appointments"] = list;
    data["Status"] = status;
    data["Message"] = message;
    return data;
  }
}

class ListPatientsResponse{
  late List<PatientInfo> patients;
  int? status;
  String? message;

  ListPatientsResponse({
    required this.patients,
    required this.status,
    required this.message,
  });

  ListPatientsResponse.fromJson(Map<String, dynamic> json) {
    patients = (jsonDecode(json["Patients"]) as List).map((i) =>
        PatientInfo.fromJson(i)).toList();
    status = json["Status"];
    message = json["Message"];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    List list  = [];
    patients.forEach((val){
      list.add(val.toJson());
    });
    data["Patients"] = list;
    data["Status"] = status;
    data["Message"] = message;
    return data;
  }
}

class PatientInfo{
  int? id;
  String? patientName;
  String? mobileNo;
  String? MRNO;
  int? age;
  String? specialization;

  PatientInfo({
    required this.id,
    required this.patientName,
    required this.mobileNo,
    required this.MRNO,
    required this.age,
    required this.specialization,
  });

  PatientInfo.fromJson(Map<String, dynamic> json) {
    id = json["Id"];
    patientName = json["PatientName"];
    mobileNo = json["MobileNo"];
    MRNO = json["MRNO"];
    age = json["Age"];
    specialization = json["Specialization"];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["Id"] =id;
    data["PatientName"] = patientName;
    data["MobileNo"] = mobileNo;
    data["MRNO"] = MRNO;
    data["Age"] = age;
    data["Specialization"] = specialization;
    return data;
  }
}

class ListPatientsConsultationResponse{
  late List<PatientConsulInfo> patientConsultations;
  int? status;
  String? message;

  ListPatientsConsultationResponse({
    required this.patientConsultations,
    required this.status,
    required this.message,
  });

  ListPatientsConsultationResponse.fromJson(Map<String, dynamic> json) {
    patientConsultations = (jsonDecode(json["PatientConsultations"]) as List).map((i) =>
        PatientConsulInfo.fromJson(i)).toList();
    status = json["Status"];
    message = json["Message"];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    List list  = [];
    patientConsultations.forEach((val){
      list.add(val.toJson());
    });
    data["PatientConsultations"] = list;
    data["Status"] = status;
    data["Message"] = message;
    return data;
  }
}

class PatientConsulInfo{
  int? patientId;
  DateTime? consultationDate;
  String? phyisician;
  String? specialization;
  String? illness;

  PatientConsulInfo({
    required this.patientId,
    required this.consultationDate,
    required this.phyisician,
    required this.specialization,
    required this.illness,
  });

  PatientConsulInfo.fromJson(Map<String, dynamic> json) {
    patientId = json["PatientId"];
    consultationDate = json["ConsultationDate"];
    phyisician = json["Phyisician"];
    specialization = json["Specialization"];
    illness = json["Illness"];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["PatientId"] =patientId;
    data["ConsultationDate"] = consultationDate;
    data["Phyisician"] = phyisician;
    data["Specialization"] = specialization;
    data["Illness"] =  illness;
    return data;
  }
}

class OTResponse{
  int? admitted;
  int? advised;
  late List<OTInfo> otInfos;
  int? status;
  String? message;

  OTResponse({
    required this.admitted,
    required this.advised,
    required this.otInfos,
    required this.status,
    required this.message,
  });
  OTResponse.fromJson(Map<String, dynamic> json) {
    admitted = json["Admitted"];
    advised = json["Advised"];
    otInfos = json["OTInfos"];
    status = json["Status"];
    message = json["Message"];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["Admitted"] =admitted;
    data["Advised"] = advised;
    data["OTInfos"] = otInfos;
    data["Status"] = status;
    data["Message"] =  message;
    return data;
  }
}

class OTInfo{
  int? id;
  String? patientName;
  String? mobileNo;
  String? specialization;
  String? MRNO;
  double? age;
  String? time;
  int? otStatus;

  OTInfo({
    required this.id,
    required this.patientName,
    required this.mobileNo,
    required this.specialization,
    required this.MRNO,
    required this.age,
    required this.time,
    required this.otStatus,
  });

  OTInfo.fromJson(Map<String, dynamic> json) {
    id = json["Id"];
    patientName = json["PatientName"];
    mobileNo = json["MobileNo"];
    specialization = json["Specialization"];
    MRNO = json["MRNO"];
    age = json["Age"];
    time = json["Time"];
    otStatus = json["OTStatus"];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["Id"] = id;
    data["PatientName"] = patientName;
    data["MobileNo"] = mobileNo;
    data["Specialization"] = specialization;
    data["MRNO"] =  MRNO;
    data["Age"] =  age;
    data["Time"] =  time;
    data["OTStatus"] =  otStatus;
    return data;
  }
}

class OpReceiptsResponse{
  double? totalReceipts;
  double? totalPayments;
  double? totalPending;
  OPReceiptsInfo? opReceipts;
  int? status;
  String? message;

  OpReceiptsResponse({
    required this.totalReceipts,
    required this.totalPayments,
    required this.totalPending,
    required this.opReceipts,
    required this.status,
    required this.message,
  });

  OpReceiptsResponse.fromJson(Map<String, dynamic> json) {
    totalReceipts = json["TotalReceipts"];
    totalPayments = json["TotalPayments"];
    totalPending = json["TotalPending"];
    opReceipts = json["OPReceipts"] != null ? OPReceiptsInfo.fromJson(json["OPReceipts"]) : null;
    status = json["Status"];
    message = json["Message"];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["TotalReceipts"] = totalReceipts;
    data["TotalPayments"] = totalPayments;
    data["TotalPending"] = totalPending;
    data["OPReceipts"] = opReceipts?.toJson();
    data["Status"] =  status;
    data["Message"] =  message;
    return data;
  }
}

class OPReceiptsInfo {
  double? consultation;
  double? procedure;
  double? others;
  double? lab;
  double? investigation;
  double? pending;

  OPReceiptsInfo({
    required this.consultation,
    required this.procedure,
    required this.others,
    required this.lab,
    required this.investigation,
    required this.pending,
  });

  OPReceiptsInfo.fromJson(Map<String, dynamic> json) {
    consultation = json["Consultation"];
    procedure = json["Procedure"];
    others = json["Others"];
    lab = json["Lab"];
    investigation = json["Investigation"];
    pending = json["Pending"];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["Consultation"] = consultation;
    data["Procedure"] = procedure;
    data["Others"] = others;
    data["Lab"] = lab;
    data["Investigation"] =  investigation;
    data["Pending"] =  pending;
    return data;
  }

}

class IPReceiptsResponse{
  double? surgeryPackage;
  double? surgeryPending;
  int? status;
  String? message;

  IPReceiptsResponse({
    required this.surgeryPackage,
    required this.surgeryPending,
    required this.status,
    required this.message,
  });

  IPReceiptsResponse.fromJson(Map<String, dynamic> json) {
    surgeryPackage = json["SurgeryPackage"];
    surgeryPending = json["SurgeryPending"];
    status = json["Status"];
    message = json["Message"];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["SurgeryPackage"] = surgeryPackage;
    data["SurgeryPending"] = surgeryPending;
    data["Status"] = status;
    data["Message"] = message;
    return data;
  }

}

class AdvanceResponse{
  double? advanceReceipts;
  double? advanceReturn;
  int? status;
  String? message;

  AdvanceResponse({
    required this.advanceReceipts,
    required this.advanceReturn,
    required this.status,
    required this.message,
  });

  AdvanceResponse.fromJson(Map<String, dynamic> json) {
    advanceReceipts = json["AdvanceReceipts"];
    advanceReturn = json["AdvanceReturn"];
    status = json["Status"];
    message = json["Message"];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["AdvanceReceipts"] = advanceReceipts;
    data["AdvanceReturn"] = advanceReturn;
    data["Status"] = status;
    data["Message"] = message;
    return data;
  }

}

class PharmaResponse{
  double? receipts;
  double? paid;
  double? pending;
  int? status;
  String? message;

  PharmaResponse({
    required this.receipts,
    required this.paid,
    required this.pending,
    required this.status,
    required this.message,
  });

  PharmaResponse.fromJson(Map<String, dynamic> json) {
    receipts = json["Receipts"];
    paid = json["Paid"];
    pending = json["Pending"];
    status = json["Status"];
    message = json["Message"];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["Receipts"] = receipts;
    data["Paid"] = paid;
    data["Pending"] = pending;
    data["Status"] = status;
    data["Message"] = message;
    return data;
  }

}

class OpticalsResponse{
  double? receipts;
  double? paid;
  double? pending;
  int? status;
  String? message;

  OpticalsResponse({
    required this.receipts,
    required this.paid,
    required this.pending,
    required this.status,
    required this.message,
  });

  OpticalsResponse.fromJson(Map<String, dynamic> json) {
    receipts = json["Receipts"];
    paid = json["Paid"];
    pending = json["Pending"];
    status = json["Status"];
    message = json["Message"];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["Receipts"] = receipts;
    data["Paid"] = paid;
    data["Pending"] = pending;
    data["Status"] = status;
    data["Message"] = message;
    return data;
  }

}

class ProfileResponse{
  int? id;
  String? qrCode;
  String? firstName;
  String? lastName;
  String? designation;
  String? mobileNo;
  DateTime? joinDate;
  String? pan;
  int? aadhaarNo;
  int? status;
  String? message;

  ProfileResponse({
    required this.id,
    required this.qrCode,
    required this.firstName,
    required this.lastName,
    required this.designation,
    required this.mobileNo,
    required this.joinDate,
    required this.pan,
    required this.aadhaarNo,
    required this.status,
    required this.message,
  });

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    id = json["Id"];
    qrCode = json["QRCode"];
    firstName = json["FirstName"];
    lastName = json["LastName"];
    designation = json["Designation"];
    mobileNo = json["MobileNo"];
    joinDate = json["JoinDate"];
    pan = json["PAN"];
    aadhaarNo = json["AadhaarNo"];
    status = json["Status"];
    message = json["Message"];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["Id"] = id;
    data["QRCode"] = qrCode;
    data["FirstName"] = firstName;
    data["LastName"] = lastName;
    data["Designation"] = designation;
    data["MobileNo"] = mobileNo;
    data["JoinDate"] = joinDate;
    data["PAN"] = pan;
    data["AadhaarNo"] = aadhaarNo;
    data["Status"] = status;
    data["Message"] = message;
    return data;
  }

}