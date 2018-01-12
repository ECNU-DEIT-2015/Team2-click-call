import 'package:redstone/redstone.dart' as app;
import 'package:redstone_web_socket/redstone_web_socket.dart';

@WebSocketHandler("/ws")
onConnection(WebSocketChannel channel) {
  channel.stream.listen((message) {
    channel.sink.add("echo $message");
  });
}

void main() {
  app.setupConsoleLog();

  app.addPlugin(getWebSocketPlugin());

  app.start();
}