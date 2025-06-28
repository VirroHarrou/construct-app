// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$webSocketChannelHash() => r'e12c9b6333c636e5283092677afb8366d3b2aac1';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [webSocketChannel].
@ProviderFor(webSocketChannel)
const webSocketChannelProvider = WebSocketChannelFamily();

/// See also [webSocketChannel].
class WebSocketChannelFamily extends Family<WebSocketChannel> {
  /// See also [webSocketChannel].
  const WebSocketChannelFamily();

  /// See also [webSocketChannel].
  WebSocketChannelProvider call(
    String token,
  ) {
    return WebSocketChannelProvider(
      token,
    );
  }

  @override
  WebSocketChannelProvider getProviderOverride(
    covariant WebSocketChannelProvider provider,
  ) {
    return call(
      provider.token,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'webSocketChannelProvider';
}

/// See also [webSocketChannel].
class WebSocketChannelProvider extends AutoDisposeProvider<WebSocketChannel> {
  /// See also [webSocketChannel].
  WebSocketChannelProvider(
    String token,
  ) : this._internal(
          (ref) => webSocketChannel(
            ref as WebSocketChannelRef,
            token,
          ),
          from: webSocketChannelProvider,
          name: r'webSocketChannelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$webSocketChannelHash,
          dependencies: WebSocketChannelFamily._dependencies,
          allTransitiveDependencies:
              WebSocketChannelFamily._allTransitiveDependencies,
          token: token,
        );

  WebSocketChannelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.token,
  }) : super.internal();

  final String token;

  @override
  Override overrideWith(
    WebSocketChannel Function(WebSocketChannelRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WebSocketChannelProvider._internal(
        (ref) => create(ref as WebSocketChannelRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        token: token,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<WebSocketChannel> createElement() {
    return _WebSocketChannelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WebSocketChannelProvider && other.token == token;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, token.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WebSocketChannelRef on AutoDisposeProviderRef<WebSocketChannel> {
  /// The parameter `token` of this provider.
  String get token;
}

class _WebSocketChannelProviderElement
    extends AutoDisposeProviderElement<WebSocketChannel>
    with WebSocketChannelRef {
  _WebSocketChannelProviderElement(super.provider);

  @override
  String get token => (origin as WebSocketChannelProvider).token;
}

String _$chatServiceHash() => r'7689ba8e4c32de02c461bbdf345503909f600657';

/// See also [chatService].
@ProviderFor(chatService)
const chatServiceProvider = ChatServiceFamily();

/// See also [chatService].
class ChatServiceFamily extends Family<ChatService> {
  /// See also [chatService].
  const ChatServiceFamily();

  /// See also [chatService].
  ChatServiceProvider call(
    String token,
  ) {
    return ChatServiceProvider(
      token,
    );
  }

  @override
  ChatServiceProvider getProviderOverride(
    covariant ChatServiceProvider provider,
  ) {
    return call(
      provider.token,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'chatServiceProvider';
}

/// See also [chatService].
class ChatServiceProvider extends AutoDisposeProvider<ChatService> {
  /// See also [chatService].
  ChatServiceProvider(
    String token,
  ) : this._internal(
          (ref) => chatService(
            ref as ChatServiceRef,
            token,
          ),
          from: chatServiceProvider,
          name: r'chatServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chatServiceHash,
          dependencies: ChatServiceFamily._dependencies,
          allTransitiveDependencies:
              ChatServiceFamily._allTransitiveDependencies,
          token: token,
        );

  ChatServiceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.token,
  }) : super.internal();

  final String token;

  @override
  Override overrideWith(
    ChatService Function(ChatServiceRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChatServiceProvider._internal(
        (ref) => create(ref as ChatServiceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        token: token,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<ChatService> createElement() {
    return _ChatServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChatServiceProvider && other.token == token;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, token.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ChatServiceRef on AutoDisposeProviderRef<ChatService> {
  /// The parameter `token` of this provider.
  String get token;
}

class _ChatServiceProviderElement
    extends AutoDisposeProviderElement<ChatService> with ChatServiceRef {
  _ChatServiceProviderElement(super.provider);

  @override
  String get token => (origin as ChatServiceProvider).token;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
