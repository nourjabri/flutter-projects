import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:serapp/PublicZikarBloc/publiczikar_bloc.dart';
import 'package:serapp/khtmafunc/zikarsheet.dart';
import 'package:serapp/service/Zikar_Service.dart';
import 'package:serapp/theme/colors.dart';

class ZikarScreen extends StatelessWidget {
  ZikarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          PubliczikarBloc(PubliczikarService())..add(LoadpublicZikar()),
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: maindecoration()),
          ),
        ),
        body: Container(
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
                      "جلسات الذكر",
                      style: TextStyle(fontSize: 30, fontFamily: "H-ALHFHAF"),
                    ),
                    Image(image: AssetImage("assets/images/floraldesign.png")),
                  ],
                ),

                const SizedBox(height: 40),
                BlocBuilder<PubliczikarBloc, PubliczikarState>(
                  builder: (context, state) {
                    if (state is PubliczikarLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is PubliczikarLoaded) {
                      final publicazkar = state.azkar;
                      return Center(
                        child: Expanded(
                          flex: 1,
                          child: SizedBox(
                            // height: 220.h,
                            // width: 350.w,
                            child: ListView.builder(
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: publicazkar.length,
                              itemBuilder: (context, index) {
                                final azkar = publicazkar[index];
                                final niyyah = azkar.niyyah;
                                final qty_done = azkar.qty_done;
                                final qty_suppose = azkar.qty_suppose;
                                final formattedStartDate = DateFormat(
                                  'dd/MM/yyyy',
                                ).format(azkar.start_date);

                                final formattedEndDate = DateFormat(
                                  'dd/MM/yyyy',
                                ).format(azkar.end_date);
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
                                                  " ذكر بنية  ",
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
                                                        'ذكر\n ${index + 1}',
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

                                          Divider(),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                " المنجز",
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
                                                " المفروض",
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
                                              Text(qty_done.toString()),
                                              Text(qty_suppose.toString()),
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
          child: PubliczikarSheet(),
        ),
      ),
    );
  }
}
