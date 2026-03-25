import '../../../model/artists/artist.dart';
import 'artist_repository.dart';

class ArtistRepositoryMock extends ArtistRepository {
  @override
  Future<List<Artist>> fetchArtists() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      Artist(
        id: 'artist_1',
        name: 'VannDa',
        genre: 'Hip-Hop',
        imageUrl: 'https://images.unsplash.com/photo-1511379938547-c1f69419868d',
      ),
      Artist(
        id: 'artist_2',
        name: 'Tena',
        genre: 'Pop',
        imageUrl: 'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91',
      ),
      Artist(
        id: 'artist_3',
        name: 'G-Devith',
        genre: 'Hip-Hop',
        imageUrl: 'https://images.unsplash.com/photo-1497032205916-ac775f0649ae',
      ),
    ];
  }

  @override
  Future<Artist?> fetchArtistById(String id) async {
    await Future.delayed(Duration(seconds: 1));
    final artists = await fetchArtists();
    return artists.firstWhere((artist) => artist.id == id);
  }
}
