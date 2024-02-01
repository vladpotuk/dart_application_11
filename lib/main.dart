import 'package:http/http.dart' as http;

import 'rick_and_morty_api.dart';
import 'character.dart';
import 'location.dart';
import 'episode.dart';

void main() async {
  final api = RickAndMortyApi(
    charactersUrl: 'https://rickandmortyapi.com/api/character',
    locationsUrl: 'https://rickandmortyapi.com/api/location',
    episodesUrl: 'https://rickandmortyapi.com/api/episode',
  );

  
  final charactersJson = await api.fetchData(api.charactersUrl);
  final characters = (api.decodeJson(charactersJson) as List)
      .map((json) => Character.fromJson(json))
      .toList();

  
  final locationsJson = await api.fetchData(api.locationsUrl);
  final locations = (api.decodeJson(locationsJson) as List)
      .map((json) => Location.fromJson(json))
      .toList();

  
  final episodesJson = await api.fetchData(api.episodesUrl);
  final episodes = (api.decodeJson(episodesJson) as List)
      .map((json) => Episode.fromJson(json))
      .toList();

  
  print('Characters:');
  characters.forEach((character) {
    print('Name: ${character.name}, Status: ${character.status}');
  });

  print('\nLocations:');
  locations.forEach((location) {
    print('Name: ${location.name}, Type: ${location.type}');
  });

  print('\nEpisodes:');
  episodes.forEach((episode) {
    print('Name: ${episode.name}, Air Date: ${episode.airDate}');
  });
}
