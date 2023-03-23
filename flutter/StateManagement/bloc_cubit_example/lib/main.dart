import 'package:bloc_cubit_example/cubit/sample_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

/// Represents the MyApp class
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SampleCubit()),
      ],
      child: const MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white10,
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                child: const Text('sampleInitial'),
                onPressed: () =>
                    BlocProvider.of<SampleCubit>(context).sampleInitial(),
              ),
              ElevatedButton(
                child: const Text('sampleLoading'),
                onPressed: () =>
                    BlocProvider.of<SampleCubit>(context).sampleLoading(),
              ),
              ElevatedButton(
                child: const Text('gawasa'),
                onPressed: () => BlocProvider.of<SampleCubit>(context).gawasa(),
              ),
              BlocBuilder<SampleCubit, SampleState>(
                builder: (context, state) {
                  return Text(state.toString());
                },
              ),
            ],
          ),
        ));
  }
}
