import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamsprac/bloc/appointmentbloc/appointment_bloc.dart';
import 'package:streamsprac/models/modelsInput.dart';
import 'package:streamsprac/widgets/loading.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {

  WidgetsNew widgets = new WidgetsNew();

 late AppointmentBloc appointmentBloc;

  getData(AppointmentBloc appointmentBloc) {
    print('in get data');
     appointmentBloc.eventCall(ListAppointmentsInput(
        userId: 1,
        hospitalId: 1,
        fiscalYearID: 2,
        scheduledDate: "2024-09-21",
        hashValue: "4fc82b26aecb47d2868c4efbe3581732a3e7cbcc6c2efb32062c08170a05eeb8"
    )
    );
  }

@override
  void initState() {
    super.initState();
    appointmentBloc = AppointmentBloc();
    getData(appointmentBloc);
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFF1F1F1),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 1.sw,
                  height: 91.h,
                  color: Color(0xFF1D8D9C),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: (){
            
                            },
                            icon: Icon(
                              Icons.arrow_back_sharp,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          Text(
                            'Appointments',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 23.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox()
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 13.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: 30.h,
                        child: SearchBar(
                          leading: SizedBox(
                            child: Icon(
                              Icons.search,
                              color: Color(0xFF1D8D9C),
                              size: 18.sp,
                            ),
                          ),
                          shape: WidgetStatePropertyAll<OutlinedBorder>(
                              RoundedRectangleBorder( borderRadius: BorderRadius.circular(6.r),)
                          ),
                          hintText: 'Search by Patient Name / Mobile Number',
                          hintStyle: WidgetStatePropertyAll<TextStyle>(
                              TextStyle(
                                color: Color(0xFF1D8D9C),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              )
                          ),
                          backgroundColor: WidgetStatePropertyAll<Color>(
                              Color(0xFFFFFFFF)
                          ),
                          trailing: [
                            Icon(
                              Icons.close,
                              color: Color(0xFF1D8D9C),
                              size: 18.sp,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10.w, 21.h,10.w,0),
                        child: Row(
                          children: [
                            Container(
                              width: 9.r,
                              height: 9.r,
                              decoration:  BoxDecoration(
                                color: Color(0xff50F702),
                                borderRadius:  BorderRadius.all( Radius.elliptical(5.r, 5.r)),
                              ),
                            ),
                            SizedBox(width: 6.w,),
                            Text(
                              'Booked',
                              style: TextStyle(
                                color: Color(0xFF1D8D9C),
                                fontSize: 11.sp,
                              ),
                            ),
                            SizedBox(width: 16.w,),
                            Container(
                              width: 9.r,
                              height: 9.r,
                              decoration:  BoxDecoration(
                                color: Color(0xffF75555),
                                borderRadius:  BorderRadius.all( Radius.elliptical(5.r, 5.r)),
                              ),
                            ),
                            SizedBox(width: 6.w,),
                            Text(
                              'Cancelled',
                              style: TextStyle(
                                color: Color(0xFF1D8D9C),
                                fontSize: 11.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      // if(appointmentBloc.appointmentStream)
                        SizedBox(
                          height: 450.h,
                          child: StreamBuilder<AppointmentState>(
                            initialData: AppointmentInitial(),
                              stream: appointmentBloc.appointmentStream,
                              builder: (context, snapshot) {
                                print("in stream builder");
                                if(snapshot.data is AppointmentUpdated && snapshot.data!.listAppointmentsResponse.status == 1){
                            return ListView.builder(
                                itemCount: snapshot.data!.listAppointmentsResponse.appointments.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return SizedBox(
                                    height: 86.h,
                                    child: Card(
                                      elevation: 8.h,
                                      color: Color(0xFFFFFFFF),
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 5.h),
                                                  child: VerticalDivider(
                                                    color: snapshot.data!.listAppointmentsResponse.appointments[index].apptStatus == "Scheduled" ? Color(0xFF07F702) : Color(0xffF75555),
                                                    thickness: 3.r,
                                                    width: 30.w,
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      snapshot.data!.listAppointmentsResponse.appointments[index].patientName.toString(),
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF1D8D9C),
                                                        fontSize: 11.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Mobile No : ${snapshot.data!.listAppointmentsResponse.appointments[index].mobileNo.toString()}',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF1D8D9C),
                                                        fontSize: 9.sp,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Specialization : ${snapshot.data!.listAppointmentsResponse.appointments[index].specialization}',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF1D8D9C),
                                                        fontSize: 9.sp,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'MRNO : ${snapshot.data!.listAppointmentsResponse.appointments[index].MRNO}',
                                                  style: TextStyle(
                                                    color: Color(0xFF1D8D9C),
                                                    fontSize: 8.sp,
                                                  ),
                                                ),
                                                Text(
                                                  'Age : ${snapshot.data!.listAppointmentsResponse.appointments[index].age}',
                                                  style: TextStyle(
                                                    color: Color(0xFF1D8D9C),
                                                    fontSize: 9.sp,
                                                  ),
                                                ),
                                                Text(
                                                  'Time : ${snapshot.data!.listAppointmentsResponse.appointments[index].time.toString()}',
                                                  style: TextStyle(
                                                    color: Color(0xFF1D8D9C),
                                                    fontSize: 9.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                );
                          }
                                else if(snapshot.data is AppointmentUpdated && snapshot.data!.listAppointmentsResponse.status == 0){
                                  return widgets.Error(snapshot.data!.listAppointmentsResponse.message.toString());
                                }
                                else if(snapshot.data is AppointmentLoading){
                                 return widgets.loading();
                                }
                                else{
                                  return widgets.Error(snapshot.data!.listAppointmentsResponse.message.toString());
                                }
                        }
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
