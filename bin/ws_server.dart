import 'package:redstone/redstone.dart' as app;
import 'package:redstone_web_socket/redstone_web_socket.dart';

void main() {
  app.setupConsoleLog();

  //install web socket handlers
  app.addPlugin(getWebSocketPlugin());

  app.start();
}

@WebSocketHandler("/ws")
class ServerEndPoint {

  @OnOpen()
  void onOpen(WebSocketSession session) {
    print("connection established");
  }

  @OnMessage()
  void onMessage(String message, WebSocketSession session) {
    print("message received: $message");
    session.connection.add("echo $message");
  }

  @OnError()
  void onError(error, WebSocketSession session) {
    print("error: $error");
  }

  @OnClose()
  void onClose(WebSocketSession session) {
    print("connection closed");
  }

}