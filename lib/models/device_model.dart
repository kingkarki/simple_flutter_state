class DeviceModel {
  String? id;
  String? name;
  String? identifier;
  String? platform;
  String? businessLineId;
  BusinessLine? businessLine;
  String? storeId;
  BusinessLine? store;
  String? deviceNumber;
  String? usage;
  String? status;

  DeviceModel({
    this.id,
    this.name,
    this.identifier,
    this.platform,
    this.businessLineId,
    this.businessLine,
    this.storeId,
    this.store,
    this.deviceNumber,
    this.usage,
    this.status,
  });
}

class BusinessLine {
  String? name;
  BusinessLine({this.name});
}

class DeviceResponse {
  Data? data;

  DeviceResponse({this.data});
}

class Data {
  int? count;
  List<DeviceModel>? items;
  Data({this.count, this.items});
}
