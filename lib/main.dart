import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
/*import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smia_mobile/model/globalVars.dart';
import 'package:smia_mobile/pages/SplashPage.dart';
import 'package:smia_mobile/pages/login.page.dart';
import 'package:uni_links/uni_links.dart';*/
import 'package:flutter_dotenv/flutter_dotenv.dart';


bool _initialUriIsHandled = false;

Future<void> main() async {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  final routes = <String, WidgetBuilder>{};

  try {
    Future<dynamic> env = await DotEnv().load('env');
    print('Env: BASE-URL ' + env.toString());
  } catch (e) {
    print('Exception: ' + e.toString());
  }
  const bool isProduction = bool.fromEnvironment('dart.vm.product');
  print('Environment: ' + isProduction.toString());
  WidgetsFlutterBinding.ensureInitialized();
  //await UserRegisterData.init();
  runApp(
    MaterialApp(
      title: 'SMCO',
      initialRoute: '/',
      routes: {
        '/a': (context) => LoginPage(),
      },
      home: ChangeNotifierProvider(
        create: (context) => GlobalVars(),
        child: MyApp(),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

enum UniLinksType { string, uri }

class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  String _latestLink = 'Unknown';
  Uri _latestUri;
  StreamSubscription _sub;
  UniLinksType _type = UniLinksType.string;
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  dispose() {
    if (_sub != null) _sub.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  initPlatformState() async {
    if (_type == UniLinksType.string) {
      await initPlatformStateForStringUniLinks();
    } else {
      await initPlatformStateForUriUniLinks();
    }
  }

  /// An implementation using a [String] link
  initPlatformStateForStringUniLinks() async {
    // Attach a listener to the links stream
    _sub = getLinksStream().listen((String link) {
      if (!mounted) return;
      setState(() {
        _latestLink = link ?? 'Unknown';
        _latestUri = null;
        try {
          if (link != null) {
            _latestUri = Uri.parse(link);
            globals.latestUri = _latestUri;
            print("latest uri " + _latestUri.toString());
          }
        } on FormatException {}
      });
    }, onError: (err) {
      if (!mounted) return;
      setState(() {
        _latestLink = 'Failed to get latest link: $err.';
        _latestUri = null;
      });
    });

    // Attach a second listener to the stream
    getLinksStream().listen((String link) {
      print('got link: $link');
    }, onError: (err) {
      print('got err: $err');
    });

    // Get the latest link
    String initialLink;
    Uri initialUri;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      initialLink = await getInitialLink();
      print('initial link: $initialLink');
      if (initialLink != null) initialUri = Uri.parse(initialLink);
    } on PlatformException {
      initialLink = 'Failed to get initial link.';
      initialUri = null;
    } on FormatException {
      initialLink = 'Failed to parse the initial link as Uri.';
      initialUri = null;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _latestLink = initialLink;
      _latestUri = initialUri;
    });
  }

  /// An implementation using the [Uri] convenience helpers
  initPlatformStateForUriUniLinks() async {
    // Attach a listener to the Uri links stream
    _sub = getUriLinksStream().listen((Uri uri) {
      if (!mounted) return;
      setState(() {
        _latestUri = uri;
        _latestLink = uri?.toString() ?? 'Unknown';
      });
    }, onError: (err) {
      if (!mounted) return;
      setState(() {
        _latestUri = null;
        _latestLink = 'Failed to get latest link: $err.';
      });
    });

    // Attach a second listener to the stream
    getUriLinksStream().listen((Uri uri) {
      print('got uri: ${uri?.path} ${uri?.queryParametersAll}');
    }, onError: (err) {
      print('got err: $err');
    });

    // Get the latest Uri
    Uri initialUri;
    String initialLink;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      initialUri = await getInitialUri();
      print('initial uri: ${initialUri?.path}'
          ' ${initialUri?.queryParametersAll}');
      initialLink = initialUri?.toString();
    } on PlatformException {
      initialUri = null;
      initialLink = 'Failed to get initial uri.';
    } on FormatException {
      initialUri = null;
      initialLink = 'Bad parse the initial link as Uri.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _latestUri = initialUri;
      _latestLink = initialLink;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '   ',
      theme: ThemeData(
          primaryColor: Color(0xffCCCCCC),
          primarySwatch: Colors.grey,
          fontFamily: 'Arial'),
      home: Splash(),
      debugShowCheckedModeBanner: false,
      /*routes: {
        pageRoutes.Profile: (context) => ProfilePage(),
        pageRoutes.Custodial: (context) => CustodialPage(),
        pageRoutes.Checklist: (context) => Checklist(),
        pageRoutes.TrustedContact: (context) => TrustedContact(),
        pageRoutes.Beneficiery: (context) => Beneficiary(),
        pageRoutes.Preference: (context) => Preferences(),
        pageRoutes.ChangePassword: (context) => ChangePasswordPage(),
        pageRoutes.Signature: (context) => MySignature(),
        pageRoutes.FeesStructure: (context) => FeesStructure(),
        pageRoutes.Faq: (context) => FAQ(),
        pageRoutes.FeedBack: (context) => FeedbackPage(),
      },*/
    );
  }
}
