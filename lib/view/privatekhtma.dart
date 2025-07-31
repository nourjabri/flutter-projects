import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:serapp/khtmafunc/privatekhtmasheet.dart';
import 'package:serapp/privateBloc/bloc/privatekhtmabloc_bloc.dart';

import 'package:serapp/service/Private_Service.dart';
import 'package:serapp/theme/colors.dart';

class PrivateKhtma extends StatefulWidget {
  const PrivateKhtma({super.key});

  @override
  State<PrivateKhtma> createState() => _PrivateKhtmaState();
}

class _PrivateKhtmaState extends State<PrivateKhtma> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          PrivatekhtmablocBloc(PrivateKhtmaservice())..add(LoadPrivateKhtma()),
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: maindecoration()),
          ),
        ),
        body: Container(
          width: 400.w,
          height: 1600.h,
          decoration: BoxDecoration(gradient: maindecoration()),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image(image: AssetImage("assets/images/floraldesign.png")),
                    Text(
                      "ختمة خاصة ",
                      style: TextStyle(fontSize: 30, fontFamily: "H-ALHFHAF"),
                    ),
                    Image(image: AssetImage("assets/images/floraldesign.png")),
                  ],
                ),

                BlocBuilder<PrivatekhtmablocBloc, PrivatekhtmablocState>(
                  builder: (context, state) {
                    if (state is PrivateLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is PrivateLoaded) {
                      final PrivateKhtma = state.privatekhtma;
                      return Center(
                        child: Expanded(
                          flex: 1,
                          child: SizedBox(
                            // height: 220.h,
                            // width: 350.w,
                            child: ListView.builder(
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: PrivateKhtma.length,
                              itemBuilder: (context, index) {
                                final khatma = PrivateKhtma[index];
                                final niyyah = khatma.niyyah;

                                final formattedStartDate = DateFormat(
                                  'dd/MM/yyyy',
                                ).format(khatma.startDate);

                                final formattedEndDate = DateFormat(
                                  'dd/MM/yyyy',
                                ).format(khatma.endDate);
                                return Column(
                                  children: [
                                    Container(
                                      width: 350.w,
                                      height: 200.h,
                                      decoration: BoxDecoration(
                                        color: Appcolor().sevencolor,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.white.withValues(
                                              alpha: 0.5,
                                            ),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                      ),

                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8,
                                              right: 8,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  " ختمة بنية  $niyyah",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: "H-ALHFHAF",
                                                  ),
                                                ),

                                                Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    SizedBox(
                                                      height: 100,
                                                      width: 100,
                                                      child: Image.asset(
                                                        "assets/images/note.png",
                                                        width: double.infinity,
                                                        // fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Center(
                                                      child: Text(
                                                        'ختمة\n ${index + 1}',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                "تاريخ لانتهاء",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: "H-ALHFHAF",
                                                ),
                                              ),
                                              SizedBox(
                                                width: 50,
                                                height: 30,
                                                child: Image.asset(
                                                  "assets/images/flora.png",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Text(
                                                "تاريخ البدء",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: "H-ALHFHAF",
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(formattedEndDate),
                                              Text(formattedStartDate),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 30),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    } else if (state is PrivateKhtmaerror) {
                      return Center(child: Text('خطأ :${state.message}'));
                    }
                    return SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 150),
          child: PrivatekhtmaSheet(),
        ),
      ),
    );
  }
}
