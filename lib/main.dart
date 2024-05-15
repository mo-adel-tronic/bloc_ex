import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'light_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc Example',
      home: BlocProvider(
        create: (context) => LightBloc(),
        child: LightPage(),
      ),
    );
  }
}

class LightPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Bloc Example')),
      body: Center(
        child: BlocBuilder<LightBloc, LightState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  state is LightOn ? Icons.lightbulb : Icons.lightbulb_outline,
                  size: 100,
                  color: state is LightOn ? Colors.yellow : Colors.grey,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => context.read<LightBloc>().add(ToggleLight()),
                  child: Text(state is LightOn ? 'Turn Off' : 'Turn On'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
