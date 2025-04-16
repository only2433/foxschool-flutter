// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SeriesListAPINotifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$seriesListAPINotifierHash() =>
    r'fc684525b6ce202d7963a9ede6349c37c703c179';

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

abstract class _$SeriesListAPINotifier
    extends BuildlessAutoDisposeNotifier<SeriesListAPIState> {
  late final FoxSchoolRepository repo;

  SeriesListAPIState build(
    FoxSchoolRepository repo,
  );
}

/// See also [SeriesListAPINotifier].
@ProviderFor(SeriesListAPINotifier)
const seriesListAPINotifierProvider = SeriesListAPINotifierFamily();

/// See also [SeriesListAPINotifier].
class SeriesListAPINotifierFamily extends Family<SeriesListAPIState> {
  /// See also [SeriesListAPINotifier].
  const SeriesListAPINotifierFamily();

  /// See also [SeriesListAPINotifier].
  SeriesListAPINotifierProvider call(
    FoxSchoolRepository repo,
  ) {
    return SeriesListAPINotifierProvider(
      repo,
    );
  }

  @override
  SeriesListAPINotifierProvider getProviderOverride(
    covariant SeriesListAPINotifierProvider provider,
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
  String? get name => r'seriesListAPINotifierProvider';
}

/// See also [SeriesListAPINotifier].
class SeriesListAPINotifierProvider extends AutoDisposeNotifierProviderImpl<
    SeriesListAPINotifier, SeriesListAPIState> {
  /// See also [SeriesListAPINotifier].
  SeriesListAPINotifierProvider(
    FoxSchoolRepository repo,
  ) : this._internal(
          () => SeriesListAPINotifier()..repo = repo,
          from: seriesListAPINotifierProvider,
          name: r'seriesListAPINotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$seriesListAPINotifierHash,
          dependencies: SeriesListAPINotifierFamily._dependencies,
          allTransitiveDependencies:
              SeriesListAPINotifierFamily._allTransitiveDependencies,
          repo: repo,
        );

  SeriesListAPINotifierProvider._internal(
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
  SeriesListAPIState runNotifierBuild(
    covariant SeriesListAPINotifier notifier,
  ) {
    return notifier.build(
      repo,
    );
  }

  @override
  Override overrideWith(SeriesListAPINotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: SeriesListAPINotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<SeriesListAPINotifier, SeriesListAPIState>
      createElement() {
    return _SeriesListAPINotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SeriesListAPINotifierProvider && other.repo == repo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, repo.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SeriesListAPINotifierRef
    on AutoDisposeNotifierProviderRef<SeriesListAPIState> {
  /// The parameter `repo` of this provider.
  FoxSchoolRepository get repo;
}

class _SeriesListAPINotifierProviderElement
    extends AutoDisposeNotifierProviderElement<SeriesListAPINotifier,
        SeriesListAPIState> with SeriesListAPINotifierRef {
  _SeriesListAPINotifierProviderElement(super.provider);

  @override
  FoxSchoolRepository get repo =>
      (origin as SeriesListAPINotifierProvider).repo;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
