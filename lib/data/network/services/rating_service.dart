import 'package:dio/dio.dart';
import 'package:e_cm/data/network/services/urls.dart';

import '../../model/rating/rating.dart';

class RatingServices {
  Future<Rating> ratingToRating(
      String userId,
      String productId,
      String response,
      int rating,
      ) async {
    final resp = await Dio().post('${URLS.urlApi}/rating',
        data: Map.from({
          'userId': userId,
          'productId': productId,
          'response': response,
          'rating': rating,
        }));

    return Rating.fromJson(resp.data);
  }
}

final ratingServices = RatingServices();
