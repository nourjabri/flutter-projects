import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:serapp/bloc/publickhtmaBloc.dart';
import 'package:serapp/khtmafunc/khtmafunctions.dart';
import 'package:serapp/service/publicservice.dart';
import 'package:serapp/theme/colors.dart';

class Publickhtma extends StatelessWidget {
  final String type;
  Publickhtma({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => KhatmaBloc(PublicKhtmaservice())..add(LoadPublicKhatmas()),
      child: Scaffold(
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
                      "ختمة عامة ",
                      style: TextStyle(fontSize: 30, fontFamily: "H-ALHFHAF"),
                    ),
                    Image(image: AssetImage("assets/images/floraldesign.png")),
                  ],
                ),

                BlocBuilder<KhatmaBloc, KhatmaState>(
                  builder: (context, state) {
                    if (state is KhatmaLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is KhatmaLoaded) {
                      final khatmas = state.khatmas;
                      return Center(
                        child: Expanded(
                          child: SizedBox(
                            height: 220.h,
                            width: 350.w,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: khatmas.length,
                              itemBuilder: (context, index) {
                                final khatma = khatmas[index];
                                final niyyah = khatma.niyyah;
                                final startDate = khatma.startDate;
                                final endDate = khatma.endDate;
                                return Column(
                                  children: [
                                    Container(
                                      width: 309.w,
                                      height: 195.h,
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
                                                  "ختمة بنية $niyyah",
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
                                                    Text(
                                                      '${index + 1}',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        backgroundColor:
                                                            Colors.black54,
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
                                                "تاريخ البدء",
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
                                                "تاريخ الانتهاء",
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
                                              Text(khatma.startDate.toString()),
                                              Text(khatma.endDate.toString()),
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
                    } else if (state is KhatmaError) {
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
          child: BottomInfromation(),
        ),
      ),
    );
  }
}
