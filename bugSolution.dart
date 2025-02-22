```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);

      // Check if jsonData is empty before accessing elements
      if (jsonData.isNotEmpty) {
        print('First element: ${jsonData[0]}');
        print('Second element: ${jsonData.length > 1 ? jsonData[1] : 'No second element'}'); 
      } else {
        print('JSON data is empty.');
      }

      // Iterate to safely access the data
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