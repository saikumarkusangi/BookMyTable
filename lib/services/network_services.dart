import 'dart:convert';

import 'package:dinner_is_done/models/restuarants_models.dart';
import 'package:dinner_is_done/models/top_picks_model.dart';
import 'package:dinner_is_done/models/trending_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import '../models/collections_model.dart';

class ApiServices {
  //  endpoint url of api
  String endpoint = "https://dinner-is-done.saikumar150.repl.co/";

//  fetch of restaurents data from api

  Future<List<RestaurantsModel>> fetchRestaurants() async {
    Response response = await get(Uri.parse("${endpoint}restaurant/"));
    if (response.statusCode == 200) {
      final List results = jsonDecode(response.body)['data'];
      return results.map((e) => RestaurantsModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

//  fetch of top picks data from api

  Future<List<TopPicksModel>> fetchTopPicks() async {
    Response response = await get(Uri.parse("${endpoint}top_picks/"));
    if (response.statusCode == 200) {
      final List results = jsonDecode(response.body)['data'];
      return results.map((e) => TopPicksModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  //  fetch of collections data from api

  Future<List<CollectionsModel>> fetchCollections() async {
    Response response = await get(Uri.parse("${endpoint}collections/"));
    if (response.statusCode == 200) {
      final List results = jsonDecode(response.body)['data'];
      return results.map((e) => CollectionsModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  //  fetch of trending data from api

  Future<List<TrendingModel>> fetchTrending() async {
    Response response = await get(Uri.parse("${endpoint}trending/"));
    if (response.statusCode == 200) {
      final List results = jsonDecode(response.body)['data'];
      return results.map((e) => TrendingModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final ApiDataProvider = Provider<ApiServices>((ref) => ApiServices());
