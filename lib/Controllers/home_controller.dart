import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../Models/job_listing.dart';

class HomeController extends ChangeNotifier{
  bool _isLoading = false;
  bool _isCommentButtonClick = false;
  List<JobListing> jobListings = [];
  bool get isCommentButtonClick => _isCommentButtonClick;
  bool get isLoading => _isLoading;

  Future<void> pageOpening() async {
    _isLoading = true;
    notifyListeners();
    print("isloading oldu");

    // Servise bağlan ve veriyi al
    await fetchJobListings();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchJobListings() async {
    const url = 'https://example.com/api/job-listings';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        jobListings = data.map((json) => JobListing.fromJson(json)).toList();
      } else {
        print("Veri alınamadı: ${response.statusCode}");
      }
    } catch (e) {
      print("Hata: $e");
    }
  }


  Future<void> commentButtonClick() async {
    _isCommentButtonClick = true;
    notifyListeners();
    print("Yorum Yap Butonuna Tıklandı. true");
   // await Future.delayed(const Duration(seconds: 4));

    // _isCommentButtonClick = false;
    // notifyListeners();
    print("Yorum Yap Butonuna Tıklandı. false");
  }
}