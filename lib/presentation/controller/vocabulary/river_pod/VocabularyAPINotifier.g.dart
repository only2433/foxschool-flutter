// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VocabularyAPINotifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$vocabularyAPINotifierHash() =>
    r'829eadbd6545d1d5a303681ad88e1f2905d2e705';

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

abstract class _$VocabularyAPINotifier
    extends BuildlessAutoDisposeNotifier<VocabularyAPIState> {
  late final FoxSchoolRepository repo;

  VocabularyAPIState build(
    FoxSchoolRepository repo,
  );
}

/// See also [VocabularyAPINotifier].
@ProviderFor(VocabularyAPINotifier)
const vocabularyAPINotifierProvider = VocabularyAPINotifierFamily();

/// See also [VocabularyAPINotifier].
class VocabularyAPINotifierFamily extends Family<VocabularyAPIState> {
  /// See also [VocabularyAPINotifier].
  const VocabularyAPINotifierFamily();

  /// See also [VocabularyAPINotifier].
  VocabularyAPINotifierProvider call(
    FoxSchoolRepository repo,
  ) {
    return VocabularyAPINotifierProvider(
      repo,
    );
  }

  @override
  VocabularyAPINotifierProvider getProviderOverride(
    covariant VocabularyAPINotifierProvider provider,
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
  String? get name => r'vocabularyAPINotifierProvider';
}

/// See also [VocabularyAPINotifier].
class VocabularyAPINotifierProvider extends AutoDisposeNotifierProviderImpl<
    VocabularyAPINotifier, VocabularyAPIState> {
  /// See also [VocabularyAPINotifier].
  VocabularyAPINotifierProvider(
    FoxSchoolRepository repo,
  ) : this._internal(
          () => VocabularyAPINotifier()..repo = repo,
          from: vocabularyAPINotifierProvider,
          name: r'vocabularyAPINotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$vocabularyAPINotifierHash,
          dependencies: VocabularyAPINotifierFamily._dependencies,
          allTransitiveDependencies:
              VocabularyAPINotifierFamily._allTransitiveDependencies,
          repo: repo,
        );

  VocabularyAPINotifierProvider._internal(
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
  VocabularyAPIState runNotifierBuild(
    covariant VocabularyAPINotifier notifier,
  ) {
    return notifier.build(
      repo,
    );
  }

  @override
  Override overrideWith(VocabularyAPINotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: VocabularyAPINotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<VocabularyAPINotifier, VocabularyAPIState>
      createElement() {
    return _VocabularyAPINotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VocabularyAPINotifierProvider && other.repo == repo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, repo.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VocabularyAPINotifierRef
    on AutoDisposeNotifierProviderRef<VocabularyAPIState> {
  /// The parameter `repo` of this provider.
  FoxSchoolRepository get repo;
}

class _VocabularyAPINotifierProviderElement
    extends AutoDisposeNotifierProviderElement<VocabularyAPINotifier,
        VocabularyAPIState> with VocabularyAPINotifierRef {
  _VocabularyAPINotifierProviderElement(super.provider);

  @override
  FoxSchoolRepository get repo =>
      (origin as VocabularyAPINotifierProvider).repo;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
