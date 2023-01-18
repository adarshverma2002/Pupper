import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pupper/server/dogStruct.dart';

import 'dogsImage.dart';

class RemoteService {
  Future<dogs> getDogsList() async {
    print("Adarsh Verma");
    var client = http.Client();
    var uri = Uri.parse("https://api.petfinder.com/v2/animals?type=dog");
    http.Response response = await client.get(uri, headers: {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiJiYXI0a3NTUFVvVlp1dXN6bFVqSGNRNjREelI0MlpBd1Zpc3JNekdvUHV5aWJXN1NyaiIsImp0aSI6ImQzM2RmY2RlZmJlZDc5OWNiNDU3OGEzOGRmNWZiODQ5NTQ5YTU1NDNmODZjODE1MWRkMjMyYjZjZDEyMzhlNTQzNWE5MjI0YzdhNWY3NmJkIiwiaWF0IjoxNjczNzYzMTU0LCJuYmYiOjE2NzM3NjMxNTQsImV4cCI6MTY3Mzc2Njc1NCwic3ViIjoiIiwic2NvcGVzIjpbXX0.opIPbEu0R3mcKlzPrSwDf1VOtW2smnrOEgNnspng6BVYlgdLMVDMmd3JcyVi2MaULZmB-QANFEW9XGIuWmc8SjFYP7LqQSfLhgNIRBIh7cqzZ-8x-AqfYNn-fBChTTmsSdk64oxyCZXjp8vcLXOJ9fUFJxoNouuq16VHnEJ3ApmLm74oBjEGt9r57weWI2YIYUCDwbVwjaqcpIQ8yU6XEabdmg3DCUztmdFESUfTk0GVdrDcxtk0lkBMEXIIIjhQ22ZxcMHsgITpXsVbQndBSv27LRZlkbvFB1xhQ9VlIQcrk_Wn9PEjXJtiucxQYvq6mOUYbFvAaD1yA64l5hrIhA'
    });

    if (response.statusCode == 200) {
      var json = response.body;
      var decodeDog = jsonDecode(json);
      // print(decodeDog);

      return dogs.fromJson(decodeDog);
    } else {
      return dogs();
    }
  }

  Future<dogsImage> getDogsImage() async {
    var client = http.Client();
    var uri = Uri.parse("https://dog.ceo/api/breeds/image/random/50");
    http.Response response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      var decodeDogImage = jsonDecode(json);
      print(decodeDogImage);

      return dogsImage.fromJson(decodeDogImage);
    } else {
      return dogsImage();
    }
  }
}
