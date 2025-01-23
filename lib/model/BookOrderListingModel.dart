// ignore: camel_case_types
import 'package:doorway/model/orderModel.dart';

class OrderListingBookingModel {
  String? status;
  String? page;
  String? limit;
  int? pageCount;
  int? totalCount;
  List<OrderModel>? data = [];

  OrderListingBookingModel(
      {this.status,
      this.page,
      this.limit,
      this.pageCount,
      this.totalCount,
      this.data});

  OrderListingBookingModel.fromMap(Map<String, dynamic> map) {
    status = map['status']?.toString() ?? "";
    page = map['page']?.toString() ?? "";
    limit = map['limit']?.toString() ?? "";
    pageCount =
        map['page_count'] != null ? int.parse(map['page_count'].toString()) : 0;
    totalCount = map['total_count'] != null
        ? int.parse(map['total_count'].toString())
        : 0;
    if (map['data'] != null) {
      data = <OrderModel>[];
      map['data'].forEach((v) {
        data!.add(OrderModel.fromMap(v));
      });
    }
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['page'] = page;
    data['limit'] = limit;
    data['page_count'] = pageCount;
    data['total_count'] = totalCount;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toMap()).toList();
    }
    return data;
  }
}
