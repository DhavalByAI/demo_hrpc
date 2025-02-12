import 'package:demo_hrpc/component/button_cmp.dart';
import 'package:demo_hrpc/component/color_cmp.dart';
import 'package:demo_hrpc/component/global.dart';
import 'package:demo_hrpc/component/text.dart';
import 'package:demo_hrpc/component/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../bloc/airport_bloc.dart';
import '../bloc/airport_event.dart';
import '../bloc/airport_state.dart';
import '../widgets/airport_list.dart';

class AirportScreen extends StatefulWidget {
  const AirportScreen({super.key});

  @override
  AirportScreenState createState() => AirportScreenState();
}

class AirportScreenState extends State<AirportScreen> {
  final TextEditingController _emailTXTController = TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    context.read<AirportBloc>().add(FetchDeployedAirports());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: colorCmp.blackColor,
          title: text(
            val: "Airport Access",
            color: colorCmp.whiteColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          centerTitle: true,
        ),
        body: Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 30, bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textFormField(
                      controller: _emailTXTController,
                      labelText: "Email",
                      hintText: " Enter your email",
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Please Enter email...";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: primaryButton(
                            val: "Submit",
                            onTap: () async {
                              if (_form.currentState!.validate()) {
                                FocusScope.of(context).unfocus();

                                setState(() {
                                  global.message = "User Specific Airports";
                                });
                                context.read<AirportBloc>().add(
                                    FetchAirportsByEmail(
                                        _emailTXTController.text));
                              }
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: BlocBuilder<AirportBloc, AirportState>(
                  builder: (context, state) {
                    if (state is AirportLoading) {
                      return ListView(
                        children: [
                          for (int i = 0; i < 5; i++)
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20),
                              child: SizedBox(
                                height: 80,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    Shimmer.fromColors(
                                      baseColor:
                                          colorCmp.greyColor.withOpacity(0.3),
                                      highlightColor:
                                          colorCmp.greyColor.withOpacity(0.2),
                                      child: Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Shimmer.fromColors(
                                            baseColor: colorCmp.greyColor
                                                .withOpacity(0.3),
                                            highlightColor: colorCmp.greyColor
                                                .withOpacity(0.2),
                                            child: Container(
                                              height: 30,
                                              width: 120,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                          ),
                                          Shimmer.fromColors(
                                            baseColor: colorCmp.greyColor
                                                .withOpacity(0.3),
                                            highlightColor: colorCmp.greyColor
                                                .withOpacity(0.2),
                                            child: Container(
                                              height: 20,
                                              width: 200,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                        ],
                      );
                    } else if (state is AirportLoaded) {
                      return state.airports.isEmpty
                          ? Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/empty-box.png",
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                  ),
                                  const SizedBox(height: 8),
                                  text(
                                    val: 'Data Not Found',
                                    color: colorCmp.dodgerBlueColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  const SizedBox(height: 100),
                                ],
                              ),
                            )
                          : AirportList(airports: state.airports);
                    } else if (state is AirportError) {
                      return Center(
                          child: text(
                        val: state.message,
                        color: colorCmp.blackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ));
                    }
                    return Center(
                        child: text(
                      val: "Enter your email to see available airports",
                      color: colorCmp.blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
