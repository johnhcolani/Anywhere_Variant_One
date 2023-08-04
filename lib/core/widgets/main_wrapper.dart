import 'package:any_where_app/features/simpsons_fearture/presentation_layer/screens/home_screen.dart';
import 'package:flutter/material.dart';
import '../../features/simpsons_fearture/data_layer/data_sources/remote/api_provider.dart';
import '../../features/simpsons_fearture/data_layer/models/simpson_model.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({Key? key}) : super(key: key);

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  List<SimpsonsCharacter> characters = []; // List to hold the fetched characters

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  // Fetch data from the API using SimpsonApiService
  void fetchData() async {
    try {
      final apiService = SimpsonApiService();
      List<dynamic> fetchedCharacters = await apiService.fetchData();
      print('Fetched Characters: $fetchedCharacters');

      List<SimpsonsCharacter> parsedCharacters = [];

      // Loop through each element in fetchedCharacters and parse it to SimpsonsCharacter
      for (var characterData in fetchedCharacters) {
        if (characterData != null) {
          try {
            SimpsonsCharacter character = SimpsonsCharacter.fromJson(characterData);
            parsedCharacters.add(character);
          } catch (e) {
            print('Failed to parse character: $e');
          }
        }
      }

      setState(() {
        characters = parsedCharacters;
      });
    } catch (e) {
      print('Failed to fetch data: $e');
    }
  }



  @override
  Widget build(BuildContext context) {
    print('Characters in build: $characters');
    return HomeScreen(characters: characters);
  }
}

