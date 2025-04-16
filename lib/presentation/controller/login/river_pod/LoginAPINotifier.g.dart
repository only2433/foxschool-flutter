// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginAPINotifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginAPINotifierHash() => r'4c8e0d38bdded3432e0c6fc7fc313ef28c9be171';

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

abstract class _$LoginAPINotifier
    extends BuildlessAutoDisposeNotifier<LoginAPIState> {
  late final FoxSchoolRepository repo;

  LoginAPIState build(
    FoxSchoolRepository repo,
  );
}

/// See also [LoginAPINotifier].
@ProviderFor(LoginAPINotifier)
const loginAPINotifierProvider = LoginAPINotifierFamily();

/// See also [LoginAPINotifier].
class LoginAPINotifierFamily extends Family<LoginAPIState> {
  /// See also [LoginAPINotifier].
  const LoginAPINotifierFamily();

  /// See also [LoginAPINotifier].
  LoginAPINotifierProvider call(
    FoxSchoolRepository repo,
  ) {
    return LoginAPINotifierProvider(
      repo,
    );
  }

  @override
  LoginAPINotifierProvider getProviderOverride(
    covariant LoginAPINotifierProvider provider,
  ) {
    return call(
      provider.repo,
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
  String? get name => r'loginAPINotifierProvider';
}

/// See also [LoginAPINotifier].
class LoginAPINotifierProvider
    extends AutoDisposeNotifierProviderImpl<LoginAPINotifier, LoginAPIState> {
  /// See also [LoginAPINotifier].
  LoginAPINotifierProvider(
    FoxSchoolRepository repo,
  ) : this._internal(
          () => LoginAPINotifier()..repo = repo,
          from: loginAPINotifierProvider,
          name: r'loginAPINotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loginAPINotifierHash,
          dependencies: LoginAPINotifierFamily._dependencies,
          allTransitiveDependencies:
              LoginAPINotifierFamily._allTransitiveDependencies,
          repo: repo,
        );

  LoginAPINotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.repo,
  }) : super.internal();

  final FoxSchoolRepository repo;

  @override
  LoginAPIState runNotifierBuild(
    covariant LoginAPINotifier notifier,
  ) {
    return notifier.build(
      repo,
    );
  }

  @override
  Override overrideWith(LoginAPINotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: LoginAPINotifierProvider._internal(
        () => create()..repo = repo,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        repo: repo,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<LoginAPINotifier, LoginAPIState>
      createElement() {
    return _LoginAPINotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoginAPINotifierProvider && other.repo == repo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, repo.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LoginAPINotifierRef on AutoDisposeNotifierProviderRef<LoginAPIState> {
  /// The parameter `repo` of this provider.
  FoxSchoolRepository get repo;
}

class _LoginAPINotifierProviderElement
    extends AutoDisposeNotifierProviderElement<LoginAPINotifier, LoginAPIState>
    with LoginAPINotifierRef {
  _LoginAPINotifierProviderElement(super.provider);

  @override
  FoxSchoolRepository get repo => (origin as LoginAPINotifierProvider).repo;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
