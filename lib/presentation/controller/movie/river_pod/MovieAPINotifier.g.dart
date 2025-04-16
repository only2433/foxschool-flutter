// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MovieAPINotifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$movieAPINotifierHash() => r'440bae5b210fb2956b9f2f2c78555acc39f52001';

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

abstract class _$MovieAPINotifier
    extends BuildlessAutoDisposeNotifier<MovieAPIState> {
  late final FoxSchoolRepository repo;

  MovieAPIState build(
    FoxSchoolRepository repo,
  );
}

/// See also [MovieAPINotifier].
@ProviderFor(MovieAPINotifier)
const movieAPINotifierProvider = MovieAPINotifierFamily();

/// See also [MovieAPINotifier].
class MovieAPINotifierFamily extends Family<MovieAPIState> {
  /// See also [MovieAPINotifier].
  const MovieAPINotifierFamily();

  /// See also [MovieAPINotifier].
  MovieAPINotifierProvider call(
    FoxSchoolRepository repo,
  ) {
    return MovieAPINotifierProvider(
      repo,
    );
  }

  @override
  MovieAPINotifierProvider getProviderOverride(
    covariant MovieAPINotifierProvider provider,
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
  String? get name => r'movieAPINotifierProvider';
}

/// See also [MovieAPINotifier].
class MovieAPINotifierProvider
    extends AutoDisposeNotifierProviderImpl<MovieAPINotifier, MovieAPIState> {
  /// See also [MovieAPINotifier].
  MovieAPINotifierProvider(
    FoxSchoolRepository repo,
  ) : this._internal(
          () => MovieAPINotifier()..repo = repo,
          from: movieAPINotifierProvider,
          name: r'movieAPINotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$movieAPINotifierHash,
          dependencies: MovieAPINotifierFamily._dependencies,
          allTransitiveDependencies:
              MovieAPINotifierFamily._allTransitiveDependencies,
          repo: repo,
        );

  MovieAPINotifierProvider._internal(
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
  MovieAPIState runNotifierBuild(
    covariant MovieAPINotifier notifier,
  ) {
    return notifier.build(
      repo,
    );
  }

  @override
  Override overrideWith(MovieAPINotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: MovieAPINotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<MovieAPINotifier, MovieAPIState>
      createElement() {
    return _MovieAPINotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MovieAPINotifierProvider && other.repo == repo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, repo.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MovieAPINotifierRef on AutoDisposeNotifierProviderRef<MovieAPIState> {
  /// The parameter `repo` of this provider.
  FoxSchoolRepository get repo;
}

class _MovieAPINotifierProviderElement
    extends AutoDisposeNotifierProviderElement<MovieAPINotifier, MovieAPIState>
    with MovieAPINotifierRef {
  _MovieAPINotifierProviderElement(super.provider);

  @override
  FoxSchoolRepository get repo => (origin as MovieAPINotifierProvider).repo;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
