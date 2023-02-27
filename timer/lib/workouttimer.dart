import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timer/data/workout.dart';

class WorkoutTimer extends StatefulWidget {
  final WorkoutData workoutData;
  const WorkoutTimer(this.workoutData, {super.key});

  @override
  State<WorkoutTimer> createState() => _WorkoutTimerState();
}

class _WorkoutTimerState extends State<WorkoutTimer> {
  late Timer timer;
  late Duration elapsedTime = Duration.zero;
  bool isPaused = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!isPaused) {
        setState(() {
          elapsedTime += const Duration(seconds: 1);
        });
      }
    });
  }

  void togglePause() {
    setState(() {
      isPaused = !isPaused;
    });
  }

  void compeletedWorkout() {
    Navigator.pop(context, elapsedTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.workoutData.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formatDuration(elapsedTime),
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: togglePause,
                  child: Icon(isPaused ? Icons.play_arrow : Icons.pause_circle),
                ),
                const SizedBox(
                  height: 20,
                ),
                FloatingActionButton(
                  onPressed: compeletedWorkout,
                  child: const Icon(Icons.check),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  String formatDuration(Duration duration) {
    return '${duration.inMinutes} : ${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }
}
