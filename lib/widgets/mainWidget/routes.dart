import 'package:get/get.dart';
import 'package:new_healthapp/Features/Doctors/AcceptedAppointment.dart';
import 'package:new_healthapp/Features/Doctors/DoctorsPortal.dart';
import 'package:new_healthapp/Features/Doctors/HistoryPage.dart';
import 'package:new_healthapp/Features/Doctors/Mony.dart';
import 'package:new_healthapp/Features/Doctors/Myinfo.dart';
import 'package:new_healthapp/Features/Doctors/PatientCenter.dart';
import 'package:new_healthapp/Features/Doctors/doctor_hospital.dart';
import 'package:new_healthapp/Features/Doctors/hospitaldetails.dart';
import 'package:new_healthapp/Features/Doctors/login_Doctor.dart';
import 'package:new_healthapp/Features/patient/appointment/appointment_screen.dart';
import 'package:new_healthapp/Features/patient/appointment/choosefamily.dart';
import 'package:new_healthapp/Features/patient/appointment/confirm_appointment_page.dart';
import 'package:new_healthapp/Features/patient/appointment/date_time_page.dart';
import 'package:new_healthapp/Features/patient/appointment/doctor_list_page.dart';
import 'package:new_healthapp/Features/patient/appointment/hospital_list_page.dart';
import 'package:new_healthapp/Features/patient/appointment/service_cost_page.dart';
import 'package:new_healthapp/Features/patient/claims/claims_center.dart';
import 'package:new_healthapp/Features/patient/claims/claims_screen.dart';
import 'package:new_healthapp/Features/patient/familymember/familymember_screen.dart';
import 'package:new_healthapp/Features/patient/insureance/insurance_screen.dart';
import 'package:new_healthapp/Features/patient/medication/medication_screen.dart';
import 'package:new_healthapp/Features/patient/medication/medicen.dart';
import 'package:new_healthapp/Features/patient/medication/order_screen.dart';
import 'package:new_healthapp/Features/patient/midecalrecord/histoy.dart';
import 'package:new_healthapp/Features/patient/midecalrecord/labreports.dart';
import 'package:new_healthapp/Features/patient/midecalrecord/midecalrecord_screen.dart';
import 'package:new_healthapp/Features/patient/midecalrecord/personal_info.dart';
import 'package:new_healthapp/Features/patient/midecalrecord/raidlogyreports.dart';
import 'package:new_healthapp/Features/settings/about_us.dart';
import 'package:new_healthapp/Features/settings/helpandsupport.dart';
import 'package:new_healthapp/Features/settings/ouransdpartner.dart';
import 'package:new_healthapp/Features/settings/privicy.dart';
import 'package:new_healthapp/Features/settings/terms.dart';
import 'package:new_healthapp/screens/doctor_screen.dart';
import 'package:new_healthapp/screens/login_screen.dart';
import 'package:new_healthapp/screens/patient_screen.dart';
import 'package:new_healthapp/screens/start_screen.dart';

class AppRoutes {
  static const String initial = "/";
  static final routes = [
    GetPage(name: "/", page: () => StartScreen()),
    GetPage(name: "/login", page: () => LoginScreen()),
    GetPage(name: "/LoginDoctorPage", page: ()=>LoginDoctorPage()),
    GetPage(name: "/patient", page: () => PatientScreen()),
    GetPage(name: "/insurance", page: () => InsuranceCenterScreen()),
    GetPage(name: "/appointment", page: () => const Appointment()),
    GetPage(name: "/miecalrecord", page: () => const MidecalRecord()),
    GetPage(name: "/familymember", page: () => const FamilyMember()),
    GetPage(name: "/medication", page: () => const Medication()),
    GetPage(name: "/Claims", page: () => const Claims()),
    GetPage(name: "/personalinfo", page: () => PersonalInformationPage()),
    GetPage(name: "/history", page: () => const HistoryPage()),
    GetPage(name: "/labreports", page: () => const LabReportsScreen()),
    GetPage(name: "/radolgyreport", page: () => RadoligyReportScreen()),
    GetPage(name: "/medicen", page: () => MedicenScreen()),
    GetPage(name: "/order", page: () => RefillOrdersScreen()),
    GetPage(name: "/claimcenter", page: () => const ClaimCenter()),
    GetPage(name: "/ChooseFamilyMemberPage", page: () => ChooseFamilyMemberPage()),
    GetPage(name: "/doctorlist", page: () => DoctorListPage()),
    GetPage(name: "/DateTimePage", page: () => DateTimePage()),
    GetPage(name: "/ServiceCostPage", page: () => ServiceCostPage()),
    GetPage(name: "/ConfirmAppointmentPage", page: () => ConfirmAppointmentPage()),
    GetPage(name: "/HospitalListScreen", page: () => HospitalListScreen()),
    GetPage(name: "/DoctorScreen", page: () => DoctorScreen()),
    GetPage(name: "/HospitalsDoctor", page: ()=>  Hospitals_Doctor_Page()),
    GetPage(name: "/AcceptedAppointment", page: () =>AcceptedAppointmentScreen(appointmentId: '', data: {},)),
    GetPage(name: "/DoctorsPortalPage", page: () => DoctorsPortalPage()),
    GetPage(name: "/PatientCenterPage", page: ()=>PatientCenterPage()),
    GetPage(name: "/HistoryDoctorPage", page: ()=> HistoryDoctorPage()),
    GetPage(name: "/FacilityDetailScreen", page: ()=>FacilityDetailScreen()),
    GetPage(name: "/InfoDoctorScreen", page: ()=>InfoDoctorScreen()),
    GetPage(name: "/DoctorMoneyScreen", page: ()=> DoctorMoneyScreen()),
    GetPage(name: "/AboutUsScreen", page: ()=>AboutUsScreen()),
    GetPage(name: "/HelpSupportScreen", page: ()=>HelpSupportScreen()),
    GetPage(name: "/PartnersScreen ", page: ()=>PartnersScreen()),
    GetPage(name: "/TermsOfServiceScreen", page: ()=> TermsOfServiceScreen()),
    GetPage(name: "/PrivacyPolicyScreen", page: ()=>PrivacyPolicyScreen()),
  
  ];
}
