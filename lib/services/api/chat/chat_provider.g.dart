// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatUpdateStreamHash() => r'cb9f8f44b1a9085dcdda9e23b88fb4311db4af66';

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

/// See also [chatUpdateStream].
@ProviderFor(chatUpdateStream)
const chatUpdateStreamProvider = ChatUpdateStreamFamily();

/// See also [chatUpdateStream].
class ChatUpdateStreamFamily extends Family<AsyncValue<ChatMessageResponse>> {
  /// See also [chatUpdateStream].
  const ChatUpdateStreamFamily();

  /// See also [chatUpdateStream].
  ChatUpdateStreamProvider call(
    String token,
  ) {
    return ChatUpdateStreamProvider(
      token,
    );
  }

  @override
  ChatUpdateStreamProvider getProviderOverride(
    covariant ChatUpdateStreamProvider provider,
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
  String? get name => r'chatUpdateStreamProvider';
}

/// See also [chatUpdateStream].
class ChatUpdateStreamProvider
    extends AutoDisposeStreamProvider<ChatMessageResponse> {
  /// See also [chatUpdateStream].
  ChatUpdateStreamProvider(
    String token,
  ) : this._internal(
          (ref) => chatUpdateStream(
            ref as ChatUpdateStreamRef,
            token,
          ),
          from: chatUpdateStreamProvider,
          name: r'chatUpdateStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chatUpdateStreamHash,
          dependencies: ChatUpdateStreamFamily._dependencies,
          allTransitiveDependencies:
              ChatUpdateStreamFamily._allTransitiveDependencies,
          token: token,
        );

  ChatUpdateStreamProvider._internal(
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
    Stream<ChatMessageResponse> Function(ChatUpdateStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChatUpdateStreamProvider._internal(
        (ref) => create(ref as ChatUpdateStreamRef),
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
  AutoDisposeStreamProviderElement<ChatMessageResponse> createElement() {
    return _ChatUpdateStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChatUpdateStreamProvider && other.token == token;
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
mixin ChatUpdateStreamRef on AutoDisposeStreamProviderRef<ChatMessageResponse> {
  /// The parameter `token` of this provider.
  String get token;
}

class _ChatUpdateStreamProviderElement
    extends AutoDisposeStreamProviderElement<ChatMessageResponse>
    with ChatUpdateStreamRef {
  _ChatUpdateStreamProviderElement(super.provider);

  @override
  String get token => (origin as ChatUpdateStreamProvider).token;
}

String _$chatMessagesHash() => r'3856af5dc86ad975fe6faeeae31a531c083682de';

/// See also [ChatMessages].
@ProviderFor(ChatMessages)
final chatMessagesProvider = AutoDisposeNotifierProvider<ChatMessages,
    List<ChatMessageResponse>>.internal(
  ChatMessages.new,
  name: r'chatMessagesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$chatMessagesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ChatMessages = AutoDisposeNotifier<List<ChatMessageResponse>>;
String _$chatControllerHash() => r'31c53ad8d6e1fed19ee6c70f23278150bfd2ba0d';

abstract class _$ChatController
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final String token;

  FutureOr<void> build(
    String token,
  );
}

/// See also [ChatController].
@ProviderFor(ChatController)
const chatControllerProvider = ChatControllerFamily();

/// See also [ChatController].
class ChatControllerFamily extends Family<AsyncValue<void>> {
  /// See also [ChatController].
  const ChatControllerFamily();

  /// See also [ChatController].
  ChatControllerProvider call(
    String token,
  ) {
    return ChatControllerProvider(
      token,
    );
  }

  @override
  ChatControllerProvider getProviderOverride(
    covariant ChatControllerProvider provider,
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
  String? get name => r'chatControllerProvider';
}

/// See also [ChatController].
class ChatControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ChatController, void> {
  /// See also [ChatController].
  ChatControllerProvider(
    String token,
  ) : this._internal(
          () => ChatController()..token = token,
          from: chatControllerProvider,
          name: r'chatControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chatControllerHash,
          dependencies: ChatControllerFamily._dependencies,
          allTransitiveDependencies:
              ChatControllerFamily._allTransitiveDependencies,
          token: token,
        );

  ChatControllerProvider._internal(
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
  FutureOr<void> runNotifierBuild(
    covariant ChatController notifier,
  ) {
    return notifier.build(
      token,
    );
  }

  @override
  Override overrideWith(ChatController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChatControllerProvider._internal(
        () => create()..token = token,
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
  AutoDisposeAsyncNotifierProviderElement<ChatController, void>
      createElement() {
    return _ChatControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChatControllerProvider && other.token == token;
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
mixin ChatControllerRef on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `token` of this provider.
  String get token;
}

class _ChatControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ChatController, void>
    with ChatControllerRef {
  _ChatControllerProviderElement(super.provider);

  @override
  String get token => (origin as ChatControllerProvider).token;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
