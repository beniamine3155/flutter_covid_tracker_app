import 'package:flutter/material.dart';
import 'package:flutter_covid_tracker_app/views/world_states.dart';

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  String name;
  String image;
  int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;
  DetailScreen({
    super.key,
    required this.name,
    required this.image,
    required this.totalCases,
    required this.totalRecovered,
    required this.totalDeaths,
    required this.active,
    required this.todayRecovered,
    required this.critical,
    required this.test,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.067),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .06,
                      ),
                      ReusableRow(
                        title: 'Cases',
                        value: widget.totalCases.toString(),
                      ),
                      ReusableRow(
                        title: 'Recovered',
                        value: widget.totalRecovered.toString(),
                      ),
                      ReusableRow(
                        title: 'Deaths',
                        value: widget.totalDeaths.toString(),
                      ),
                      ReusableRow(
                        title: 'Critical',
                        value: widget.critical.toString(),
                      ),
                      ReusableRow(
                        title: 'Today Recovered',
                        value: widget.todayRecovered.toString(),
                      ),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              )
            ],
          )
        ],
      ),
    );
  }
}
