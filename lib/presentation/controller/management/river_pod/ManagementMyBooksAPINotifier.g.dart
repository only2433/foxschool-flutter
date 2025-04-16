// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ManagementMyBooksAPINotifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$managementMyBooksAPINotifierHash() =>
    r'af27af4d46ac86c4feecc31f01cbb14be6b954a2';

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

abstract class _$ManagementMyBooksAPINotifier
    extends BuildlessAutoDisposeNotifier<ManagementMybooksAPIState> {
  late final FoxSchoolRepository repo;

  ManagementMybooksAPIState build(
    FoxSchoolRepository repo,
  );
}

/// See also [ManagementMyBooksAPINotifier].
@ProviderFor(ManagementMyBooksAPINotifier)
const managementMyBooksAPINotifierProvider =
    ManagementMyBooksAPINotifierFamily();

/// See also [ManagementMyBooksAPINotifier].
class ManagementMyBooksAPINotifierFamily
    extends Family<ManagementMybooksAPIState> {
  /// See also [ManagementMyBooksAPINotifier].
  const ManagementMyBooksAPINotifierFamily();

  /// See also [ManagementMyBooksAPINotifier].
  ManagementMyBooksAPINotifierProvider call(
    FoxSchoolRepository repo,
  ) {
    return ManagementMyBooksAPINotifierProvider(
      repo,
    );
  }

  @override
  ManagementMyBooksAPINotifierProvider getProviderOverride(
    covariant ManagementMyBooksAPINotifierProvider provider,
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
  String? get name => r'managementMyBooksAPINotifierProvider';
}

/// See also [ManagementMyBooksAPINotifier].
class ManagementMyBooksAPINotifierProvider
    extends AutoDisposeNotifierProviderImpl<ManagementMyBooksAPINotifier,
        ManagementMybooksAPIState> {
  /// See also [ManagementMyBooksAPINotifier].
  ManagementMyBooksAPINotifierProvider(
    FoxSchoolRepository repo,
  ) : this._internal(
          () => ManagementMyBooksAPINotifier()..repo = repo,
          from: managementMyBooksAPINotifierProvider,
          name: r'managementMyBooksAPINotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$managementMyBooksAPINotifierHash,
          dependencies: ManagementMyBooksAPINotifierFamily._dependencies,
          allTransitiveDependencies:
              ManagementMyBooksAPINotifierFamily._allTransitiveDependencies,
          repo: repo,
        );

  ManagementMyBooksAPINotifierProvider._internal(
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
  ManagementMybooksAPIState runNotifierBuild(
    covariant ManagementMyBooksAPINotifier notifier,
  ) {
    return notifier.build(
      repo,
    );
  }

  @override
  Override overrideWith(ManagementMyBooksAPINotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ManagementMyBooksAPINotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<ManagementMyBooksAPINotifier,
      ManagementMybooksAPIState> createElement() {
    return _ManagementMyBooksAPINotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ManagementMyBooksAPINotifierProvider && other.repo == repo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, repo.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ManagementMyBooksAPINotifierRef
    on AutoDisposeNotifierProviderRef<ManagementMybooksAPIState> {
  /// The parameter `repo` of this provider.
  FoxSchoolRepository get repo;
}

class _ManagementMyBooksAPINotifierProviderElement
    extends AutoDisposeNotifierProviderElement<ManagementMyBooksAPINotifier,
        ManagementMybooksAPIState> with ManagementMyBooksAPINotifierRef {
  _ManagementMyBooksAPINotifierProviderElement(super.provider);

  @override
  FoxSchoolRepository get repo =>
      (origin as ManagementMyBooksAPINotifierProvider).repo;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
