import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/counter_provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F6FA),
        appBar: AppBar(
          title: const Text('Counter App'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Builder(
          builder: (context) {
            final counter = context.watch<CounterProvider>();

            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'My Counter',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.08),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.calculate,
                            size: 40,
                            color: Colors.blue,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '${counter.count}',
                            style: const TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          const Text(
                            'Current Value',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    Row(
                      children: [
                        SizedBox(
                          height: 50,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              context.read<CounterProvider>().increaseCounter();
                            },
                            icon: const Icon(Icons.add),
                            label: const Text('Increase Counter'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: OutlinedButton.icon(
                            onPressed: () {
                              context.read<CounterProvider>().decreaseCounter();
                            },
                            icon: const Icon(Icons.remove),
                            label: const Text('Decrease Counter'),
                            style: OutlinedButton.styleFrom(),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Card(
                      child: SwitchListTile(
                        secondary: Icon(
                          Icons.power_settings_new,
                          color: counter.isActive ? Colors.green : Colors.grey,
                        ),
                        title: Text(counter.isActive ? 'Active' : 'InActive'),
                        subtitle: const Text(
                          'If it is Active, You are Online.',
                        ),
                        value: counter.isActive,
                        onChanged: (value) {
                          context.read<CounterProvider>().toggleSwitch(value);
                        },
                      ),
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          context.read<CounterProvider>().resetValues();
                        },
                        icon: const Icon(Icons.refresh),
                        label: const Text('Reset Counter'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
