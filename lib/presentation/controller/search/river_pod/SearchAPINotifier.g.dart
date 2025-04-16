// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SearchAPINotifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchAPINotifierHash() => r'100a721984077113c98a846eac27b830d561eb8f';

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

abstract class _$SearchAPINotifier
    extends BuildlessAutoDisposeNotifier<SearchAPIState> {
  late final FoxSchoolRepository repo;

  SearchAPIState build(
    FoxSchoolRepository repo,
  );
}

/// See also [SearchAPINotifier].
@ProviderFor(SearchAPINotifier)
const searchAPINotifierProvider = SearchAPINotifierFamily();

/// See also [SearchAPINotifier].
class SearchAPINotifierFamily extends Family<SearchAPIState> {
  /// See also [SearchAPINotifier].
  const SearchAPINotifierFamily();

  /// See also [SearchAPINotifier].
  SearchAPINotifierProvider call(
    FoxSchoolRepository repo,
  ) {
    return SearchAPINotifierProvider(
      repo,
    );
  }

  @override
  SearchAPINotifierProvider getProviderOverride(
    covariant SearchAPINotifierProvider provider,
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
  String? get name => r'searchAPINotifierProvider';
}

/// See also [SearchAPINotifier].
class SearchAPINotifierProvider
    extends AutoDisposeNotifierProviderImpl<SearchAPINotifier, SearchAPIState> {
  /// See also [SearchAPINotifier].
  SearchAPINotifierProvider(
    FoxSchoolRepository repo,
  ) : this._internal(
          () => SearchAPINotifier()..repo = repo,
          from: searchAPINotifierProvider,
          name: r'searchAPINotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchAPINotifierHash,
          dependencies: SearchAPINotifierFamily._dependencies,
          allTransitiveDependencies:
              SearchAPINotifierFamily._allTransitiveDependencies,
          repo: repo,
        );

  SearchAPINotifierProvider._internal(
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
  SearchAPIState runNotifierBuild(
    covariant SearchAPINotifier notifier,
  ) {
    return notifier.build(
      repo,
    );
  }

  @override
  Override overrideWith(SearchAPINotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: SearchAPINotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<SearchAPINotifier, SearchAPIState>
      createElement() {
    return _SearchAPINotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchAPINotifierProvider && other.repo == repo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, repo.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchAPINotifierRef on AutoDisposeNotifierProviderRef<SearchAPIState> {
  /// The parameter `repo` of this provider.
  FoxSchoolRepository get repo;
}

class _SearchAPINotifierProviderElement
    extends AutoDisposeNotifierProviderElement<SearchAPINotifier,
        SearchAPIState> with SearchAPINotifierRef {
  _SearchAPINotifierProviderElement(super.provider);

  @override
  FoxSchoolRepository get repo => (origin as SearchAPINotifierProvider).repo;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
