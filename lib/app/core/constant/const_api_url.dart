class ConstApiUrl {
  static const drUrl = "http://117.217.126.127/api/Doctor";
  static const drLoginUrl = 'http://117.217.126.127/api/DrLogin';

  //  ----------------    Prod  urls ---------------
  static const baseApiUrl = drLoginUrl;
  static const validateMobile = "$baseApiUrl/ValidateMobileNo";
  static const loginWithPassword = "$drUrl/authentication";
  static const newPassword = "$baseApiUrl/GenerateNewPassword";
  static const sendOtp = "$baseApiUrl/SendMobileOTP";
  static const getSaveToken = "$baseApiUrl/Save_Get_Token";
  static const diplayDashBoard = "$drUrl/GetDashboardList";
  static const patientList = "$drUrl/GetDrPatientList";
  static const searchPatientList = "$drUrl/SearchPatientList";
  static const filterPatientData = "$drUrl/GetFilteredPatientData";
  static const sortPatientData = "$drUrl/SortDrPatientList";
  static const dashboardFilters = "$drUrl/GetDashboardFilters";
  static const getProgressSummary = "$drUrl/GetProgressSummary";
  static const getLabReports = "$drUrl/GetPatientLabReports";
  static const getRadioLogyReports = "$drUrl/GetDrRadiologyReports";
  static const getApdAppointments = "$drUrl/GetAppointments";
  static const getApdAppointmentsDates = "$drUrl/GetApptDateCount";
  static const getProcedureDates = "$drUrl/GetOTScheduleDateCount";

  static const schduleSurgeryListApi = "$drUrl/GetOTScheduleList";
  static const roomsApi = "$drUrl/Rooms";
  static const doctorVisitApi = "$drUrl/DrVisit";
  static const surgeryApi = "$drUrl/GetSurgeryRate";
  static const getOperationClassApi = "$drUrl/GetDrOperationClass";
  static const getOperationNameApi = "$drUrl/GetDrOperationNames";

  static const getOrganizationList = "$drUrl/GetOrgData";
  static const saveOtSchdule = "$drUrl/SaveOTSchedule";
  static const additionalSurgeonApi = "$drUrl/GetAdnlSurgDrData";
  static const getSurgicalEstimateapi = "$drUrl/GetSurgicalEstimate";
  static const getSurgicalEstimateapiProcedure =
      "$drUrl/GetSurgicalEstimate_Indoor";
}
