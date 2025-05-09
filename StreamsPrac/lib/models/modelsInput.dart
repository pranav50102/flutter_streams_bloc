class LoginInput {
  final bool isMobile;
  final String email;
  final String mobileNo;
  final String password;
  final String hashValue;

  LoginInput(
      {
        required this.isMobile,
        required this.email,
        required this.mobileNo,
        required this.password,
        required this.hashValue});

  Map<String, dynamic> toJson() {
    return {
      'IsMobile': isMobile,
      'Email': email,
      'MobileNo': mobileNo,
      'Password': password,
      'hashValue': hashValue,
    };
  }
}

class ListAppointmentsInput{

  final int userId;
  final int hospitalId;
  final int fiscalYearID;
  final String scheduledDate;
  final String hashValue;

  ListAppointmentsInput({
    required this.userId,
    required this.hospitalId,
    required this.fiscalYearID,
    required this.scheduledDate,
    required this.hashValue,
  });

  Map<String, dynamic> toJson() {
    return {
      'UserId': userId,
      'HospitalId': hospitalId,
      'FiscalYearID': fiscalYearID,
      'ScheduledDate': scheduledDate,
      'hashValue': hashValue,
    };
  }

}

class SearchPatientApptInput{

  final int userId;
  final int hospitalId;
  final int fiscalYearID;
  final String searchText;
  final String scheduledDate;
  final String hashValue;

  SearchPatientApptInput({
    required this.userId,
    required this.hospitalId,
    required this.fiscalYearID,
    required this.searchText,
    required this.scheduledDate,
    required this.hashValue,
  });

  Map<String, dynamic> toJson() {
    return {
      'UserId': userId,
      'HospitalId': hospitalId,
      'FiscalYearID': fiscalYearID,
      'SearchText': searchText,
      'ScheduledDate': scheduledDate,
      'hashValue': hashValue,
    };
  }

}

class ListPatientsInput{

  final int userId;
  final int hospitalId;
  final int fiscalYearId;
  final String hashValue;

  ListPatientsInput({
    required this.userId,
    required this.hospitalId,
    required this.fiscalYearId,
    required this.hashValue,
  });

  Map<String, dynamic> toJson() {
    return {
      'UserId': userId,
      'HospitalId': hospitalId,
      'FiscalYearId': fiscalYearId,
      'hashValue': hashValue,
    };
  }
}

class ListPatientConsultationsInput{

  final int userId;
  final int hospitalId;
  final int fiscalYearId;
  final int patientId;
  final String hashValue;

  ListPatientConsultationsInput({
    required this.userId,
    required this.hospitalId,
    required this.fiscalYearId,
    required this.patientId,
    required this.hashValue,
  });

  Map<String, dynamic> toJson() {
    return {
      'UserId': userId,
      'HospitalId': hospitalId,
      'FiscalYearId': fiscalYearId,
      'PatientId': patientId,
      'hashValue': hashValue,
    };
  }
}

class DashboardInput{

  final int userId;
  final int hospitalId;
  final int fiscalYearID;
  final String transactionPeriod;
  final String hashValue;

  DashboardInput({
    required this.userId,
    required this.hospitalId,
    required this.fiscalYearID,
    required this.transactionPeriod,
    required this.hashValue,
  });

  Map<String, dynamic> toJson() {
    return {
      'UserId': userId,
      'HospitalId': hospitalId,
      'FiscalYearID': fiscalYearID,
      'TransactionPeriod': transactionPeriod,
      'hashValue': hashValue,
    };
  }
}


class UpdateProfileInput{

  final int userId;
  final int hospitalId;
  final String firstName;
  final String lastName;
  final String designation;
  final String mobileNo;
  final String pan;
  final String hashValue;

  UpdateProfileInput({
    required this.userId,
    required this.hospitalId,
    required this.firstName,
    required this.lastName,
    required this.designation,
    required this.mobileNo,
    required this.pan,
    required this.hashValue,
  });

  Map<String, dynamic> toJson() {
    return {
      'UserId': userId,
      'HospitalId': hospitalId,
      'FirstName': firstName,
      'LastName': lastName,
      'Designation': designation,
      'MobileNo': mobileNo,
      'PAN': pan,
      'hashValue': hashValue,
    };
  }
}

class ChangePasswordInput{

  final int hospitalId;
  final int userId;
  final String existingPassword;
  final String newPassword;
  final String hashValue;

  ChangePasswordInput({
    required this.hospitalId,
    required this.userId,
    required this.existingPassword,
    required this.newPassword,
    required this.hashValue,
  });

  Map<String, dynamic> toJson() {
    return {
      'HospitalId': hospitalId,
      'UserId': userId,
      'ExistingPassword': existingPassword,
      'NewPassword': newPassword,
      'hashValue': hashValue,
    };
  }
}

class OTInput{

  final int userId;
  final int hospitalId;
  final int fiscalYearID;
  final String scheduledDate;
  final String hashValue;

  OTInput({
    required this.userId,
    required this.hospitalId,
    required this.fiscalYearID,
    required this.scheduledDate,
    required this.hashValue,
  });

  Map<String, dynamic> toJson() {
    return {
      'UserId': userId,
      'HospitalId': hospitalId,
      'FiscalYearID': fiscalYearID,
      'ScheduledDate': scheduledDate,
      'hashValue': hashValue,
    };
  }
}
