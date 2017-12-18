import 'package:redstone/redstone.dart' as app;

@app.Route("/")
helloWorld() => "Hello, World!点名程序最棒！";

main() {
  app.setupConsoleLog();
  app.start();
}