import 'dart:convert';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SMVM"),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
                padding: EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                height: 300, // Adjust the height as needed
                child: PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        title: 'Financial',
                        value: 40,
                        color: const Color(0xff0293ee),
                      ),
                      PieChartSectionData(
                        title: 'Other',
                        value: 10,
                        color: const Color(0xfff8b250),
                      ),
                      PieChartSectionData(
                        title: 'Family',
                        value: 20,
                        color: const Color(0xff845bef),
                      ),
                      PieChartSectionData(
                        title: 'Pressure of Education / Family',
                        value: 30,
                        color: const Color(0xff13d38e),
                      ),
                    ],
                  ),
                )),
          ),
          Center(
            child: Text(
              'List Of Student',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          Container(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: fetchPopularMovies(),
              builder: (context, popularSnapshot) {
                if (popularSnapshot.connectionState ==
                    ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Show a loading indicator while fetching data.
                } else if (popularSnapshot.hasError) {
                  return Text('Error: ${popularSnapshot.error}');
                } else if (!popularSnapshot.hasData ||
                    popularSnapshot.data!.isEmpty) {
                  return Text('No Student Found.');
                } else {
                  final popularMovies = popularSnapshot.data;

                  return SingleChildScrollView(
                    child: SizedBox(
                      height: 300,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: popularMovies!.length,
                        itemBuilder: (context, index) {
                          final movie = popularMovies[index];
                          return Card(
                            elevation: 8.0,
                            margin: new EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 6.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(64, 75, 96, .9)),
                                child: ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 10.0),
                                    leading: Container(
                                      padding: EdgeInsets.only(right: 12.0),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              right: BorderSide(
                                                  width: 1.0,
                                                  color: Colors.white24))),
                                      child: Icon(Icons.people,
                                          color: Colors.white),
                                    ),
                                    title: Text(
                                      movie['name'] +
                                          " (" +
                                          movie['age'].toString() +
                                          ")",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                                    subtitle: Row(
                                      children: <Widget>[
                                        Icon(Icons.location_city,
                                            color: Colors.yellowAccent),
                                        Text(
                                            movie['city'] +
                                                ", " +
                                                movie['state'],
                                            style:
                                                TextStyle(color: Colors.white))
                                      ],
                                    ),
                                    trailing: Icon(Icons.keyboard_arrow_right,
                                        color: Colors.white, size: 30.0))),
                          );
                        },
                      ),
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Future<List<Map<String, dynamic>>> fetchPopularMovies() async {
    final response = await http.get(
      Uri.parse('https://9ac2-103-81-116-198.ngrok-free.app/api/education'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> results = data['education'];
      return results.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load popular movies');
    }
  }
}
