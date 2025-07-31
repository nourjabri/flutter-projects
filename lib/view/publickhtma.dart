import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:serapp/publicBloc/Publickhtma_Bloc.dart';
import 'package:serapp/khtmafunc/publickhtmasheet.dart';
import 'package:serapp/service/publicservice.dart';
import 'package:serapp/theme/colors.dart';
import 'package:intl/intl.dart';
import 'package:serapp/view/khtmapart.dart';

class Publickhtma extends StatelessWidget {
  final String type;
  Publickhtma({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => KhatmaBloc(PublicKhtmaservice())..add(LoadPublicKhatmas()),
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
                          flex: 1,
                          child: SizedBox(
                            // height: 220.h,
                            // width: 350.w,
                            child: ListView.builder(
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: khatmas.length,
                              itemBuilder: (context, index) {
                                final khatma = khatmas[index];
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
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            KhtmaPartScreen(
                                                              niyyahvalue: niyyah
                                                                  .toString(),
                                                            ),
                                                      ),
                                                    );
                                                  },
                                                  child: Text(
                                                    " ختمة بنية $niyyah",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color:
                                                          Appcolor().sixcolor,
                                                      fontFamily: "H-ALHFHAF",
                                                    ),
                                                  ),
                                                ),

                                                Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    SizedBox(
                                                      height: 80,
                                                      width: 80,
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
          child: PublickhtmaSheet(),
        ),
      ),
    );
  }
}
