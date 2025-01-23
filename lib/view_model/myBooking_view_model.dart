import 'package:doorway/model/SingleOrderDetailsModel.dart';
import 'package:doorway/model/orderModel.dart';
import 'package:doorway/repository/myBookings_repository.dart';
import 'package:doorway/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';

class MyBookingsViewModel with ChangeNotifier {
  final _myBookingsRepo = MyBookingsRepository();

  List<OrderModel> liveOrderList = [];
  List<OrderModel> historyOrderList = [];

  int _pageNoForLive = 1;
  int _pageNoForHistory = 1;

  bool _loading = false;
  bool get Loading => _loading;

  bool _loadMoreLive = false;
  bool get LoadMoreLive => _loadMoreLive;

  bool _loadMoreHistory = false;
  bool get LoadMoreHistory => _loadMoreHistory;

  bool _liveOrderLoading = true;
  bool get liveOrderLoading => _liveOrderLoading;

  bool _historyOrderLoading = true;
  bool get historyOrderLoading => _historyOrderLoading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setLoadMoreLive(bool value) {
    _loadMoreLive = value;
    notifyListeners();
  }

  setLoadMoreHistory(bool value) {
    _loadMoreHistory = value;
    notifyListeners();
  }

  setLiveOrderLoading(bool value) {
    _liveOrderLoading = value;
    notifyListeners();
  }

  setHistoryOrderLoading(bool value) {
    _historyOrderLoading = value;
    notifyListeners();
  }

  void reSetOrderListings() {
    liveOrderList.clear();
    historyOrderList.clear();
  }

  void reSetLoadings() {
    _liveOrderLoading = true;
    _historyOrderLoading = true;
  }

  void reSetPageNumbers() {
    _pageNoForLive = 1;
    _pageNoForHistory = 1;
  }

  void initializeMyBookingsData() {
    reSetLoadings();
    reSetOrderListings();
    reSetPageNumbers();
  }

  void callOrderListings() async {
    callLiveOrderListings();
    callHistoryOrderListings();
  }

  void moveToOrderDetailsScreen(BuildContext context, dynamic arguments) {
    Navigator.pushNamed(context, RoutesName.orderDetails_screen,
        arguments: arguments);
  }

  Future<void> getOrderListing(dynamic data, bool forLive) async {
    try {
      forLive ? setLoadMoreLive(true) : setLoadMoreHistory(true);
      final value = await _myBookingsRepo.getOrderListingsApi(data);
      forLive ? setLiveOrderLoading(false) : setHistoryOrderLoading(false);
      forLive ? setLoadMoreLive(false) : setLoadMoreHistory(false);
      if (value['code'] == "201" || value['code'] == 201) {
        if (value['data']['data'] != null) {
          if (data['type'] == 'live') {
            populateListing(liveOrderList, value['data']['data']);
          } else {
            populateListing(historyOrderList, value['data']['data']);
          }
          notifyListeners();
        }
      }
    } catch (error) {
      forLive ? setLiveOrderLoading(false) : setHistoryOrderLoading(false);
      forLive ? setLoadMoreLive(false) : setLoadMoreHistory(false);
      // Handle the error gracefully
    }
  }

  void populateListing(dynamic localList, dynamic apiList) {
    for (var order in apiList) {
      localList.add(
        OrderModel.fromMap(order),
      );
    }
  }

  void callLiveOrderListings() async {
    Map<String, dynamic> data = {
      "type": "live",
      "page": "$_pageNoForLive",
      "limit": "10",
    };
    await getOrderListing(data, true);
    _pageNoForLive++;
  }

  void callHistoryOrderListings() async {
    Map<String, dynamic> data = {
      "type": "history",
      "page": "$_pageNoForHistory",
      "limit": "10",
    };
    await getOrderListing(data, false);
    _pageNoForHistory++;
  }
}
