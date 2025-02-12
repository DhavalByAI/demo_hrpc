import 'dart:convert';

import 'package:demo_hrpc/component/color_cmp.dart';
import 'package:demo_hrpc/component/global.dart';
import 'package:demo_hrpc/component/text.dart';
import 'package:flutter/material.dart';
import '../models/airport_model.dart';

class AirportList extends StatelessWidget {
  final List<Airport> airports;

  const AirportList({super.key, required this.airports});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Icon(
                Icons.circle,
                color: colorCmp.greyColor,
                size: 10,
              ),
              text(
                val: " " + global.message,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: colorCmp.blackColor,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: airports.length,
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context, index) {
              final airport = airports[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Card(
                  shadowColor: colorCmp.greyColor.withOpacity(0.1),
                  color: colorCmp.whiteColor,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Image.memory(
                          base64Decode(airport.airportLogo.split(',')[1]),
                          height: 70,
                          width: 70,
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              text(
                                val: airport.airportName ?? "",
                                color: colorCmp.blueColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                              text(
                                val: airport.airportCode ?? "",
                                color: colorCmp.greyColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
