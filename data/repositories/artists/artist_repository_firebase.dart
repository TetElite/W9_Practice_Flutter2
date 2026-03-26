import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../model/artists/artist.dart';
import '../../dtos/artist_dto.dart';
import 'artist_repository.dart';

class ArtistRepositoryFirebase extends ArtistRepository {
  final Uri artistsUri = Uri.https('week-8-practice-265f7-default-rtdb.asia-southeast1.firebasedatabase.app', '/artists.json');

  @override
  Future<List<Artist>> fetchArtists() async {
    final http.Response response = await http.get(artistsUri);

    if (response.statusCode == 200) {
      // 1 - Send the retrieved list of artists
      Map<String, dynamic> artistsMap = json.decode(response.body);
      return artistsMap.entries
          .map((entry) => ArtistDto.fromJson(entry.key, entry.value))
          .toList();
    } else {
      // 2- Throw exception if any issue
      throw Exception('Failed to load artists');
    }
  }

  @override
  Future<Artist?> fetchArtistById(String id) async {}
}
