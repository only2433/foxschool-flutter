// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CategoryListAPINotifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoryListAPINotifierHash() =>
    r'd26b0327c6a00114e7515899a8174ec9315acc91';

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

abstract class _$CategoryListAPINotifier
    extends BuildlessAutoDisposeNotifier<CategoryListAPIState> {
  late final FoxSchoolRepository repo;

  CategoryListAPIState build(
    FoxSchoolRepository repo,
  );
}

/// See also [CategoryListAPINotifier].
@ProviderFor(CategoryListAPINotifier)
const categoryListAPINotifierProvider = CategoryListAPINotifierFamily();

/// See also [CategoryListAPINotifier].
class CategoryListAPINotifierFamily extends Family<CategoryListAPIState> {
  /// See also [CategoryListAPINotifier].
  const CategoryListAPINotifierFamily();

  /// See also [CategoryListAPINotifier].
  CategoryListAPINotifierProvider call(
    FoxSchoolRepository repo,
  ) {
    return CategoryListAPINotifierProvider(
      repo,
    );
  }

  @override
  CategoryListAPINotifierProvider getProviderOverride(
    covariant CategoryListAPINotifierProvider provider,
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
  String? get name => r'categoryListAPINotifierProvider';
}

/// See also [CategoryListAPINotifier].
class CategoryListAPINotifierProvider extends AutoDisposeNotifierProviderImpl<
    CategoryListAPINotifier, CategoryListAPIState> {
  /// See also [CategoryListAPINotifier].
  CategoryListAPINotifierProvider(
    FoxSchoolRepository repo,
  ) : this._internal(
          () => CategoryListAPINotifier()..repo = repo,
          from: categoryListAPINotifierProvider,
          name: r'categoryListAPINotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoryListAPINotifierHash,
          dependencies: CategoryListAPINotifierFamily._dependencies,
          allTransitiveDependencies:
              CategoryListAPINotifierFamily._allTransitiveDependencies,
          repo: repo,
        );

  CategoryListAPINotifierProvider._internal(
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
  CategoryListAPIState runNotifierBuild(
    covariant CategoryListAPINotifier notifier,
  ) {
    return notifier.build(
      repo,
    );
  }

  @override
  Override overrideWith(CategoryListAPINotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: CategoryListAPINotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<CategoryListAPINotifier,
      CategoryListAPIState> createElement() {
    return _CategoryListAPINotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryListAPINotifierProvider && other.repo == repo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, repo.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CategoryListAPINotifierRef
    on AutoDisposeNotifierProviderRef<CategoryListAPIState> {
  /// The parameter `repo` of this provider.
  FoxSchoolRepository get repo;
}

class _CategoryListAPINotifierProviderElement
    extends AutoDisposeNotifierProviderElement<CategoryListAPINotifier,
        CategoryListAPIState> with CategoryListAPINotifierRef {
  _CategoryListAPINotifierProviderElement(super.provider);

  @override
  FoxSchoolRepository get repo =>
      (origin as CategoryListAPINotifierProvider).repo;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
