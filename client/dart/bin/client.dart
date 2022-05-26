import 'package:client/gen/greeter.pbgrpc.dart';
import 'package:grpc/grpc.dart';

Future<void> main(List<String> args) async {
  final channel = ClientChannel('localhost',
      port: 9090,
      options: ChannelOptions(
        credentials: ChannelCredentials.insecure(),
        codecRegistry:
            CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
      ));

  final client = GreeterClient(channel);

  try {
    final response = await client.sayHello(HelloRequest(name: 'Tom'));
    print(response);
  } catch (e) {
    print('Cought error: $e');
  }

  ResponseStream<HelloReply> stream = client.sayRepeatHello(RepeatHelloRequest(name: 'Tom', count: 7));

  await for (HelloReply r in stream) {
    print(r.message);
  }

  await channel.shutdown();
}
