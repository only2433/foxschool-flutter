// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'IntroAPINotifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$introAPINotifierHash() => r'9f9be6dea2036ee3f53fac01e126c2a265ecf914';

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

abstract class _$IntroAPINotifier
    extends BuildlessAutoDisposeNotifier<IntroAPIState> {
  late final FoxSchoolRepository repo;

  IntroAPIState build(
    FoxSchoolRepository repo,
  );
}

/// See also [IntroAPINotifier].
@ProviderFor(IntroAPINotifier)
const introAPINotifierProvider = IntroAPINotifierFamily();

/// See also [IntroAPINotifier].
class IntroAPINotifierFamily extends Family<IntroAPIState> {
  /// See also [IntroAPINotifier].
  const IntroAPINotifierFamily();

  /// See also [IntroAPINotifier].
  IntroAPINotifierProvider call(
    FoxSchoolRepository repo,
  ) {
    return IntroAPINotifierProvider(
      repo,
    );
  }

  @override
  IntroAPINotifierProvider getProviderOverride(
    covariant IntroAPINotifierProvider provider,
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
  String? get name => r'introAPINotifierProvider';
}

/// See also [IntroAPINotifier].
class IntroAPINotifierProvider
    extends AutoDisposeNotifierProviderImpl<IntroAPINotifier, IntroAPIState> {
  /// See also [IntroAPINotifier].
  IntroAPINotifierProvider(
    FoxSchoolRepository repo,
  ) : this._internal(
          () => IntroAPINotifier()..repo = repo,
          from: introAPINotifierProvider,
          name: r'introAPINotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$introAPINotifierHash,
          dependencies: IntroAPINotifierFamily._dependencies,
          allTransitiveDependencies:
              IntroAPINotifierFamily._allTransitiveDependencies,
          repo: repo,
        );

  IntroAPINotifierProvider._internal(
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
  IntroAPIState runNotifierBuild(
    covariant IntroAPINotifier notifier,
  ) {
    return notifier.build(
      repo,
    );
  }

  @override
  Override overrideWith(IntroAPINotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: IntroAPINotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<IntroAPINotifier, IntroAPIState>
      createElement() {
    return _IntroAPINotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IntroAPINotifierProvider && other.repo == repo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, repo.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin IntroAPINotifierRef on AutoDisposeNotifierProviderRef<IntroAPIState> {
  /// The parameter `repo` of this provider.
  FoxSchoolRepository get repo;
}

class _IntroAPINotifierProviderElement
    extends AutoDisposeNotifierProviderElement<IntroAPINotifier, IntroAPIState>
    with IntroAPINotifierRef {
  _IntroAPINotifierProviderElement(super.provider);

  @override
  FoxSchoolRepository get repo => (origin as IntroAPINotifierProvider).repo;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
