import 'dart:convert';

GetAirportListByEmailDomainModel getAirportListByEmailDomainModelFromJson(
        String str) =>
    GetAirportListByEmailDomainModel.fromJson(json.decode(str));

String getAirportListByEmailDomainModelToJson(
        GetAirportListByEmailDomainModel data) =>
    json.encode(data.toJson());

class GetAirportListByEmailDomainModel {
  var statusCode;
  List<ResultArray>? resultArray;
  var lambdaFunctionName;
  var remarks;

  GetAirportListByEmailDomainModel({
    this.statusCode,
    this.resultArray,
    this.lambdaFunctionName,
    this.remarks,
  });

  factory GetAirportListByEmailDomainModel.fromJson(
          Map<String, dynamic> json) =>
      GetAirportListByEmailDomainModel(
        statusCode: json["statusCode"],
        resultArray: json["resultArray"] == null
            ? []
            : List<ResultArray>.from(
                json["resultArray"].map((x) => ResultArray.fromJson(x))),
        lambdaFunctionName: json["lambdaFunctionName"],
        remarks: json["remarks"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "resultArray": List<dynamic>.from(resultArray!.map((x) => x.toJson())),
        "lambdaFunctionName": lambdaFunctionName,
        "remarks": remarks,
      };
}

class ResultArray {
  var emailDomain;
  List<String>? airportCodes;

  ResultArray({
    this.emailDomain,
    this.airportCodes,
  });

  factory ResultArray.fromJson(Map<String, dynamic> json) => ResultArray(
        emailDomain: json["emailDomain"],
        airportCodes: List<String>.from(json["airportCodes"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "emailDomain": emailDomain,
        "airportCodes": List<dynamic>.from(airportCodes!.map((x) => x)),
      };
}
