import 'package:google_fonts/google_fonts.dart';
import 'package:movie_series_application/core/_core_exports.dart';
import 'package:movie_series_application/feature/_feature_exports.dart';
import 'package:provider/provider.dart';
import 'core/utils/router.dart' as router;
import 'core/init/injection_container.dart' as dependencyInjection;

void main() async {
  await dependencyInjection.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
          create: (_) => dependencyInjection.serviceLocator(),
        ),
      ],
      child: const MovieSeriesApplication(),
    ),
  );
}

class MovieSeriesApplication extends StatelessWidget {
  const MovieSeriesApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie and Series Application',
      navigatorKey: GlobalContextKey.instance.globalKey,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const HomePage(),
    );
  }
}
