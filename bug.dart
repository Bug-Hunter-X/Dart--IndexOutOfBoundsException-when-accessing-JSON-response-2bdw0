```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Assuming the API returns a JSON list
      final List<dynamic> jsonData = jsonDecode(response.body);
      // Accessing elements with index
      print('First element: ${jsonData[0]}'); //Potential error if jsonData is empty
      print('Second element: ${jsonData[1]}'); //Potential error if jsonData is empty or has only one element

      //Iterate through jsonData to avoid index error
      for (var element in jsonData) {
        print(element);
      }
    } else {
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
```