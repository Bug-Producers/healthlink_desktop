// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'websocket_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(webSocketClient)
final webSocketClientProvider = WebSocketClientProvider._();

final class WebSocketClientProvider
    extends
        $FunctionalProvider<WebSocketClient, WebSocketClient, WebSocketClient>
    with $Provider<WebSocketClient> {
  WebSocketClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'webSocketClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$webSocketClientHash();

  @$internal
  @override
  $ProviderElement<WebSocketClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WebSocketClient create(Ref ref) {
    return webSocketClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WebSocketClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WebSocketClient>(value),
    );
  }
}

String _$webSocketClientHash() => r'cc8a1500a420a594deab28fb9458a59b4ea14ea7';
