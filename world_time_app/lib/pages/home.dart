import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    String bgImage = data['isDaytime'] ? 'night.png' : 'day.png';

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          )
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 180.0, 0, 0),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/${data['flag']}'),
                  radius: 50.0,
                ),
                SizedBox(height: 30.0),
                FloatingActionButton.extended(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'location': result['location'],
                        'time': result['time'],
                        'flag': result['flag'],
                        'isDaytime': result['isDaytime'],
                      };
                    });
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text('Edit Location'),
                  backgroundColor: Colors.blue[700],
                ),
                SizedBox(height: 15.0),
                Text(
                  data['location'],
                  style: TextStyle(
                    fontSize: 20.0,
                    letterSpacing: 2.0,
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
