import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: GoRouter(
        routes: [
          ShellRoute(
            builder: (BuildContext context, GoRouterState state, Widget child) {
              return MyHomePage(
                title: 'Coteu',
                currentBody: child,
              );
            },
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const HomeWidget(),
              ),
              GoRoute(
                path: '/advinador-de-nombres',
                builder: (context, state) => const NameGuesserWidget(),
              ),
              GoRoute(
                path: '/adivinador-de-edad',
                builder: (context, state) => const AgeGuesserWidget(),
              ),
              GoRoute(
                path: '/buscador-universidades',
                builder: (context, state) => const UniversityFinderWidget(),
              ),
              GoRoute(
                path: '/clima',
                builder: (context, state) => const DominicanWeatherWidget(),
              ),
              GoRoute(
                path: '/nasa-news',
                builder: (context, state) => const NasaNewsWidget(),
              ),
GoRoute(
  path: '/acerca-de',
  builder: (context, state) => const AboutWidget(),
),
            ],
          ),
        ],
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title, required this.currentBody});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it l

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final Widget currentBody;
  Widget mkTitle() {
    return Row(
      children: [
        Text(title),
        const SizedBox(width: 10),
        SvgPicture.asset(
          "assets/caja_herramienta.svg",
          height: 37,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: mkTitle(),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: mkTitle()),
            ListTile(
                title: Text(
                  "Inicio",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                onTap: () {
                  Navigator.pop(context);
                  context.go("/");
                }),
            ListTile(
                title: Text(
                  "Adivinador de nombres",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                onTap: () {
                  Navigator.pop(context);
                  context.go("/advinador-de-nombres");
                }),
            ListTile(
                title: Text(
                  "Adivinador de edad",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                onTap: () {
                  Navigator.pop(context);
                  context.go("/adivinador-de-edad");
                }),
            ListTile(
                title: Text(
                  "Buscador de Universidades",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                onTap: () {
                  Navigator.pop(context);
                  context.go("/buscador-universidades");
                }),
            ListTile(
                title: Text(
                  "Clima en RD",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                onTap: () {
                  Navigator.pop(context);
                  context.go("/clima");
                }),
            ListTile(
              title: Text(
                "Noticias NASA",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              onTap: () {
                Navigator.pop(context);
                context.go("/nasa-news");
              },
            ),
ListTile(
  title: Text(
    "Acerca de",
    style: Theme.of(context).textTheme.headlineMedium,
  ),
  onTap: () {
    Navigator.pop(context);
    context.go("/acerca-de");
  },
),
          ],
        ),
      ),
      body: currentBody,
      // floatingActionButton: Container(child: const Icon(Icons.add)), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: Column(
        // Column is also a layout widget. It takes a list of children and
        // arranges them vertically. By default, it sizes itself to fit its
        // children horizontally, and tries to be as tall as its parent.
        //
        // Column has various properties to control how it sizes itself and
        // how it positions its children. Here we use mainAxisAlignment to
        // center the children vertically; the main axis here is the vertical
        // axis because Columns are vertical (the cross axis would be
        // horizontal).
        //
        // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
        // action in the IDE, or press "p" in the console), to see the
        // wireframe for each widget.
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            "assets/caja_herramienta.svg",
            height: 200,
          )
        ],
      ),
    );
  }
}

enum Gender { initial, male, female, dontknow }

class NameGuesserWidget extends StatefulWidget {
  const NameGuesserWidget({super.key});

  @override
  State<NameGuesserWidget> createState() => _NameGuesserState();
}

class _NameGuesserState extends State<NameGuesserWidget> {
  Gender _guessedGender = Gender.initial;
  String? _lastName;
  bool _isLoading = false;
  String? _error;
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _guessGender() async {
    final name = _nameController.text.trim();

    if (name.isEmpty || name == _lastName) {
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
      _lastName = name;
    });

    try {
      final response = await http.get(Uri.parse(
          'https://api.genderize.io/?name=${Uri.encodeComponent(name)}'));

      if (!mounted) return;

      if (response.statusCode != 200) {
        throw Exception(
            'Error en la solicitud: ${response.statusCode}: ${response.body}');
      }

      final jsonVal = jsonDecode(response.body) as Map<String, dynamic>;
      setState(() {
        _guessedGender = switch (jsonVal["gender"]) {
          "female" => Gender.female,
          "male" => Gender.male,
          null => Gender.dontknow,
          _ => Gender.initial
        };
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = 'Error al adivinar el género: $e';
        _isLoading = false;
      });
    }
  }

  Color? _getColorForGender() {
    return switch (_guessedGender) {
      Gender.initial => Colors.grey[200],
      Gender.dontknow => Colors.grey[200],
      Gender.male => Colors.blue[100],
      Gender.female => Colors.pink[100],
    };
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Ingrese su nombre',
              hintText: 'Ej: Juan, María',
            ),
            textInputAction: TextInputAction.done,
            onEditingComplete: _guessGender,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _isLoading ? null : _guessGender,
            child: _isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2))
                : const Text("Adivinar"),
          ),
          const SizedBox(height: 16),
          if (_error != null)
            Text(
              _error!,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
              textAlign: TextAlign.center,
            ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 100,
            decoration: BoxDecoration(
              color: _getColorForGender(),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                switch (_guessedGender) {
                  Gender.initial => 'Pendiente',
                  Gender.dontknow => 'No se pudo determinar',
                  Gender.male => 'Masculino',
                  Gender.female => 'Femenino',
                },
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum AgeCategory { initial, young, adult, elderly }

class AgeGuesserWidget extends StatefulWidget {
  const AgeGuesserWidget({super.key});

  @override
  State<AgeGuesserWidget> createState() => _AgeGuesserState();
}

class _AgeGuesserState extends State<AgeGuesserWidget> {
  AgeCategory _ageCategory = AgeCategory.initial;
  String? _lastName;
  bool _isLoading = false;
  String? _error;
  int? _age;
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  AgeCategory _getAgeCategory(int age) {
    if (age < 25) {
      return AgeCategory.young;
    } else if (age < 60) {
      return AgeCategory.adult;
    } else {
      return AgeCategory.elderly;
    }
  }

  Future<void> _guessAge() async {
    final name = _nameController.text.trim();

    if (name.isEmpty || name == _lastName) {
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
      _lastName = name;
    });

    try {
      final response = await http.get(
          Uri.parse('https://api.agify.io/?name=${Uri.encodeComponent(name)}'));

      if (!mounted) return;

      if (response.statusCode != 200) {
        throw Exception(
            'Error en la solicitud: ${response.statusCode}: ${response.body}');
      }

      final jsonVal = jsonDecode(response.body) as Map<String, dynamic>;
      final age = jsonVal["age"] as int?;

      setState(() {
        _age = age;
        _ageCategory = age != null ? _getAgeCategory(age) : AgeCategory.initial;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = 'Error al adivinar la edad: $e';
        _isLoading = false;
      });
    }
  }

  Color _getColorForAge() {
    return switch (_ageCategory) {
      AgeCategory.initial => Colors.grey.shade200,
      AgeCategory.young => Colors.green.shade100,
      AgeCategory.adult => Colors.blue.shade100,
      AgeCategory.elderly => Colors.purple.shade100,
    };
  }

  String _getImageForAge() {
    return switch (_ageCategory) {
      AgeCategory.initial => "assets/person.svg",
      AgeCategory.young => "assets/young.svg",
      AgeCategory.adult => "assets/adult.svg",
      AgeCategory.elderly => "assets/elder.svg",
    };
  }

  String _getMessageForAge() {
    return switch (_ageCategory) {
      AgeCategory.initial => 'Pendiente',
      AgeCategory.young => '¡Eres joven! Tienes toda una vida por delante',
      AgeCategory.adult => 'Eres un adulto en tu mejor momento',
      AgeCategory.elderly => 'Eres una persona mayor llena de sabiduría',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Ingrese su nombre',
              hintText: 'Ej: Juan, María',
            ),
            textInputAction: TextInputAction.done,
            onEditingComplete: _guessAge,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _isLoading ? null : _guessAge,
            child: _isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2))
                : const Text("Adivinar edad"),
          ),
          const SizedBox(height: 16),
          if (_error != null)
            Text(
              _error!,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
              textAlign: TextAlign.center,
            ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 200,
            decoration: BoxDecoration(
              color: _getColorForAge(),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_age != null)
                  Text(
                    'Edad estimada: $_age años',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                const SizedBox(height: 8),
                SvgPicture.asset(
                  _getImageForAge(),
                  height: 80,
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    _getMessageForAge(),
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class University {
  final String name;
  final List<String> domains;
  final List<String> webPages;

  University({
    required this.name,
    required this.domains,
    required this.webPages,
  });

  factory University.fromJson(Map<String, dynamic> json) {
    return University(
      name: json['name'] as String,
      domains: List<String>.from(json['domains'] as List),
      webPages: List<String>.from(json['web_pages'] as List),
    );
  }
}

class UniversityFinderWidget extends StatefulWidget {
  const UniversityFinderWidget({super.key});

  @override
  State<UniversityFinderWidget> createState() => _UniversityFinderState();
}

class _UniversityFinderState extends State<UniversityFinderWidget> {
  final _countryController = TextEditingController();
  bool _isLoading = false;
  String? _error;
  List<University> _universities = [];
  String? _lastSearchedCountry;

  @override
  void dispose() {
    _countryController.dispose();
    super.dispose();
  }

  Future<void> _searchUniversities() async {
    final country = _countryController.text.trim();

    if (country.isEmpty || country == _lastSearchedCountry) {
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
      _lastSearchedCountry = country;
      _universities = [];
    });

    try {
      final encodedCountry = Uri.encodeComponent(country);
      final response = await http.get(Uri.parse(
          'http://universities.hipolabs.com/search?country=$encodedCountry'));

      if (!mounted) return;

      if (response.statusCode != 200) {
        throw Exception(
            'Error en la solicitud: ${response.statusCode}: ${response.body}');
      }

      final List<dynamic> jsonList = jsonDecode(response.body) as List<dynamic>;
      setState(() {
        _universities = jsonList
            .map((json) => University.fromJson(json as Map<String, dynamic>))
            .toList();
        _isLoading = false;
      });

      if (_universities.isEmpty) {
        setState(() {
          _error = 'No se encontraron universidades para este país';
        });
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = 'Error al buscar universidades: $e';
        _isLoading = false;
      });
    }
  }

  Future<void> _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _countryController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Ingrese el nombre del país (en inglés)',
              hintText: 'Ej: Dominican Republic, Spain, Mexico',
            ),
            textInputAction: TextInputAction.search,
            onEditingComplete: _searchUniversities,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _isLoading ? null : _searchUniversities,
            child: _isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2))
                : const Text("Buscar universidades"),
          ),
          const SizedBox(height: 16),
          if (_error != null)
            Text(
              _error!,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
              textAlign: TextAlign.center,
            ),
          if (_universities.isNotEmpty)
            Text(
              'Universidades encontradas: ${_universities.length}',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: _universities.length,
              itemBuilder: (context, index) {
                final university = _universities[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ExpansionTile(
                    title: Text(
                      university.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (university.domains.isNotEmpty) ...[
                              const Text(
                                'Dominios:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              ...university.domains
                                  .map((domain) => Text('• $domain')),
                              const SizedBox(height: 8),
                            ],
                            if (university.webPages.isNotEmpty) ...[
                              const Text(
                                'Páginas web:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              ...university.webPages.map(
                                (url) => InkWell(
                                  onTap: () => _launchURL(url),
                                  child: Text(
                                    '• $url',
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class WeatherData {
  final double temperature;
  final int humidity;
  final String condition;
  final double feelsLike;
  final double windSpeed;
  final double precipitation;
  final String cityName;

  WeatherData({
    required this.temperature,
    required this.humidity,
    required this.condition,
    required this.feelsLike,
    required this.windSpeed,
    required this.precipitation,
    required this.cityName,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    final current = json['current'] as Map<String, dynamic>;
    return WeatherData(
      temperature: current['temperature_2m'] as double,
      humidity: current['relative_humidity_2m'] as int,
      condition: _getWeatherCondition(current['weather_code'] as int),
      feelsLike: current['apparent_temperature'] as double,
      windSpeed: current['wind_speed_10m'] as double,
      precipitation: current['precipitation'] as double,
      cityName: 'Santo Domingo', // OpenMeteo no devuelve nombre de ciudad
    );
  }

  static String _getWeatherCondition(int code) {
    // Códigos basados en la documentación de Open-Meteo
    switch (code) {
      case 0:
        return 'Despejado';
      case 1:
      case 2:
      case 3:
        return 'Parcialmente nublado';
      case 45:
      case 48:
        return 'Neblina';
      case 51:
      case 53:
      case 55:
        return 'Llovizna';
      case 61:
      case 63:
      case 65:
        return 'Lluvia';
      case 80:
      case 81:
      case 82:
        return 'Lluvia fuerte';
      case 95:
        return 'Tormenta';
      case 96:
      case 99:
        return 'Tormenta con granizo';
      default:
        return 'Desconocido';
    }
  }
}

class DominicanWeatherWidget extends StatefulWidget {
  const DominicanWeatherWidget({super.key});

  @override
  State<DominicanWeatherWidget> createState() => _DominicanWeatherState();
}

class _DominicanWeatherState extends State<DominicanWeatherWidget> {
  WeatherData? _weatherData;
  bool _isLoading = false;
  String? _error;

  // Coordenadas de Santo Domingo
  static const lat = 18.4861;
  static const lon = -69.9312;

  @override
  void initState() {
    initializeDateFormatting();

    super.initState();
    _fetchWeather();
  }

  Future<void> _fetchWeather() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final response = await http.get(Uri.parse(
          'https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon'
          '&current=temperature_2m,relative_humidity_2m,apparent_temperature,'
          'precipitation,weather_code,wind_speed_10m'));

      if (!mounted) return;

      if (response.statusCode != 200) {
        throw Exception(
            'Error en la solicitud: ${response.statusCode}: ${response.body}');
      }

      final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
      setState(() {
        _weatherData = WeatherData.fromJson(jsonData);
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = 'Error al obtener el clima: $e';
        _isLoading = false;
      });
    }
  }

  IconData _getWeatherIcon(String condition) {
    switch (condition.toLowerCase()) {
      case 'despejado':
        return Icons.wb_sunny;
      case 'parcialmente nublado':
        return Icons.wb_cloudy;
      case 'neblina':
        return Icons.cloud;
      case 'llovizna':
        return Icons.grain;
      case 'lluvia':
        return Icons.water_drop;
      case 'lluvia fuerte':
        return Icons.thunderstorm;
      case 'tormenta':
        return Icons.flash_on;
      case 'tormenta con granizo':
        return Icons.ac_unit;
      default:
        return Icons.question_mark;
    }
  }

  Color _getBackgroundColor() {
    if (_weatherData == null) return Colors.blue.shade50;

    final hour = DateTime.now().hour;
    if (hour >= 18 || hour < 6) {
      // Noche
      return Colors.indigo.shade100;
    } else if (_weatherData!.condition.toLowerCase().contains('lluvia') ||
        _weatherData!.condition.toLowerCase().contains('tormenta')) {
      return Colors.blueGrey.shade100;
    } else if (_weatherData!.temperature > 30) {
      return Colors.orange.shade50;
    } else {
      return Colors.blue.shade50;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(16),
      ),
      child: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _error!,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.error),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _fetchWeather,
                          child: const Text('Reintentar'),
                        ),
                      ],
                    ),
                  ),
                )
              : _weatherData == null
                  ? const Center(child: Text('No hay datos disponibles'))
                  : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Theme.of(context).primaryColor,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  _weatherData!.cityName,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              DateFormat('EEEE d \'de\' MMMM, y', 'es')
                                  .format(DateTime.now()),
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 24),
                            Icon(
                              _getWeatherIcon(_weatherData!.condition),
                              size: 80,
                              color: Theme.of(context).primaryColor,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              '${_weatherData!.temperature.round()}°C',
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            Text(
                              _weatherData!.condition,
                              style: Theme.of(context).textTheme.headlineSmall,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 32),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _WeatherInfoItem(
                                  icon: Icons.thermostat,
                                  label: 'Sensación',
                                  value: '${_weatherData!.feelsLike.round()}°C',
                                ),
                                _WeatherInfoItem(
                                  icon: Icons.water_drop,
                                  label: 'Humedad',
                                  value: '${_weatherData!.humidity}%',
                                ),
                                _WeatherInfoItem(
                                  icon: Icons.air,
                                  label: 'Viento',
                                  value:
                                      '${_weatherData!.windSpeed.round()} km/h',
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            _WeatherInfoItem(
                              icon: Icons.umbrella,
                              label: 'Precipitación',
                              value: '${_weatherData!.precipitation} mm',
                            ),
                            const SizedBox(height: 24),
                            ElevatedButton.icon(
                              onPressed: _fetchWeather,
                              icon: const Icon(Icons.refresh),
                              label: const Text('Actualizar'),
                            ),
                          ],
                        ),
                      ),
                    ),
    );
  }
}

class _WeatherInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _WeatherInfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 24),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}

class NasaNewsWidget extends StatefulWidget {
  const NasaNewsWidget({super.key});

  @override
  State<NasaNewsWidget> createState() => _NasaNewsWidgetState();
}

class _NasaNewsWidgetState extends State<NasaNewsWidget> {
  bool _isLoading = false;
  String? _error;
  List<Map<String, dynamic>> _news = [];

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final response = await http.get(
        Uri.parse('https://www.nasa.gov/wp-json/wp/v2/posts?per_page=4'),
      );

      if (!mounted) return;

      if (response.statusCode != 200) {
        throw Exception(
          'Error en la solicitud: ${response.statusCode}: ${response.body}',
        );
      }

      final List<dynamic> jsonData = jsonDecode(response.body) as List<dynamic>;
      setState(() {
        _news = jsonData.cast<Map<String, dynamic>>();
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = 'Error al cargar las noticias: $e';
        _isLoading = false;
      });
    }
  }

  Future<void> _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  String _stripHtml(String htmlString) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlString.replaceAll(exp, '');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/nasa_logo.svg',
                    height: 60,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Últimas Noticias de la NASA',
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            )
          else if (_error != null)
            Column(
              children: [
                Text(
                  _error!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _fetchNews,
                  child: const Text('Reintentar'),
                ),
              ],
            )
          else
            Expanded(
              child: RefreshIndicator(
                onRefresh: _fetchNews,
                child: ListView.builder(
                  itemCount: _news.length,
                  itemBuilder: (context, index) {
                    final article = _news[index];
                    final title =
                        _stripHtml(article['title']['rendered'] as String);
                    final excerpt =
                        _stripHtml(article['excerpt']['rendered'] as String);
                    final link = article['link'] as String;

                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              excerpt,
                              style: Theme.of(context).textTheme.bodyLarge,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton.icon(
                              onPressed: () => _launchURL(link),
                              icon: const Icon(Icons.launch),
                              label: const Text('Visitar Artículo'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

  Future<void> _launchPhone(String phoneNumber) async {
    final Uri uri = Uri(scheme: 'tel', path: phoneNumber);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  Future<void> _launchEmail(String email) async {
    final Uri uri = Uri(scheme: 'mailto', path: email);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/foto2x2.png'),
            ),
            const SizedBox(height: 24),
            Text(
              'Frairlyn Camilo Roque Suarez',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Información de Contacto',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ListTile(
                      leading: const Icon(Icons.phone),
                      title: const Text('Teléfono'),
                      subtitle: const Text('829 436 8532'),
                      trailing: IconButton(
                        icon: const Icon(Icons.call),
                        onPressed: () => _launchPhone('8294368232'),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.email),
                      title: const Text('Correo Electrónico'),
                      subtitle: const Text('frailin300@gmail.com'),
                      trailing: IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () => _launchEmail('frailin300@gmail.com'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sobre la Aplicación',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Esta aplicación es una caja de herramientas que incluye varias utilidades como adivinar nombres, edades, buscar universidades, ver el clima y las últimas noticias de la NASA.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}