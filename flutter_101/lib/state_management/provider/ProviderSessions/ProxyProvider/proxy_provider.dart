import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProxyProviderExample extends StatefulWidget {
  const ProxyProviderExample({super.key});

  @override
  State<ProxyProviderExample> createState() => _ProxyProviderExampleState();
}

class _ProxyProviderExampleState extends State<ProxyProviderExample> {
  int _counter = 0;
  String _language = 'en';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProxyProvider Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MultiProvider(
              providers: [
                ProxyProvider0<int>(update: (context, _) => _counter),
                ProxyProvider0<String>(update: (context, _) => _language),
                ProxyProvider<int, Translations>(
                  update: (_, counter, __) => Translations(counter),
                ),
                ProxyProvider2<int, String, CombinedData>(
                  update: (_, counter, language, __) =>
                      CombinedData(counter, language),
                ),
              ],
              child: const Counter(),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _counter++;
            _language = _counter.isEven ? 'en' : 'es';
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Translations {
  Translations(this._counter);
  final int _counter;
  String get counter => 'Counter: $_counter';
}

class CombinedData {
  CombinedData(this._counter, this._language);
  final int _counter;
  final String _language;
  String get info => 'Counter: $_counter, Language: $_language';
}

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    final Translations translations = Provider.of<Translations>(context);
    final CombinedData combinedData = Provider.of<CombinedData>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(translations.counter),
        Text(combinedData.info),
      ],
    );
  }
}
