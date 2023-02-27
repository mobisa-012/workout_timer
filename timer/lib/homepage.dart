import 'package:flutter/material.dart';
import 'package:timer/data/workout.dart';
import 'package:timer/workouttimer.dart';

class HomeWorkout extends StatelessWidget {
  final List<WorkoutData> workouts = [
    WorkoutData(const Duration(minutes: 10), 'Abs'),
    WorkoutData(const Duration(minutes: 15), 'Squats'),
    WorkoutData(const Duration(minutes: 8), 'Planks'),
    WorkoutData(const Duration(minutes: 5), 'Push-ups'),
    WorkoutData(const Duration(minutes: 13), 'Jump-rope')
  ];
  HomeWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Workouts'),
      ),
      body: ListView.builder(
        itemCount: workouts.length,
        itemBuilder: (context, index) {
          final workout = workouts[index];
          return ListTile(
            title: Text(workout.name),
            subtitle: Text('${workout.duration.inMinutes} minutes'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WorkoutTimer(workout)),
              );
            },
          );
        },
      ),
    );
  }
}
