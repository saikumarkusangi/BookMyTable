import 'package:dinner_is_done/models/collections_model.dart';
import 'package:dinner_is_done/models/restuarants_models.dart';
import 'package:dinner_is_done/models/top_picks_model.dart';
import 'package:dinner_is_done/models/trending_model.dart';
import 'package:riverpod/riverpod.dart';
import '../services/network_services.dart';

// Restaurents Provider

final restaurantsProvider = FutureProvider<List<RestaurantsModel>>((ref) async {
  return ref.watch(ApiDataProvider).fetchRestaurants();
});

// Collections Providers

final collectionsProvider = FutureProvider<List<CollectionsModel>>((ref) async {
  return ref.watch(ApiDataProvider).fetchCollections();
});

// TopPicks Providers

final topPicksProvider = FutureProvider<List<TopPicksModel>>((ref) async {
  return ref.watch(ApiDataProvider).fetchTopPicks();
});


// Trending Providers

final trendingProvider = FutureProvider<List<TrendingModel>>((ref) async {
  return ref.watch(ApiDataProvider).fetchTrending();
});
