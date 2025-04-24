// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FlashcardAPINotifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$flashcardAPINotifierHash() =>
    r'812f4cbc58171053af78e74cf4d18238f48d33cb';

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

abstract class _$FlashcardAPINotifier
    extends BuildlessAutoDisposeNotifier<FlashcardAPIState> {
  late final FoxSchoolRepository repo;

  FlashcardAPIState build(
    FoxSchoolRepository repo,
  );
}

/// See also [FlashcardAPINotifier].
@ProviderFor(FlashcardAPINotifier)
const flashcardAPINotifierProvider = FlashcardAPINotifierFamily();

/// See also [FlashcardAPINotifier].
class FlashcardAPINotifierFamily extends Family<FlashcardAPIState> {
  /// See also [FlashcardAPINotifier].
  const FlashcardAPINotifierFamily();

  /// See also [FlashcardAPINotifier].
  FlashcardAPINotifierProvider call(
    FoxSchoolRepository repo,
  ) {
    return FlashcardAPINotifierProvider(
      repo,
    );
  }

  @override
  FlashcardAPINotifierProvider getProviderOverride(
    covariant FlashcardAPINotifierProvider provider,
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
  String? get name => r'flashcardAPINotifierProvider';
}

/// See also [FlashcardAPINotifier].
class FlashcardAPINotifierProvider extends AutoDisposeNotifierProviderImpl<
    FlashcardAPINotifier, FlashcardAPIState> {
  /// See also [FlashcardAPINotifier].
  FlashcardAPINotifierProvider(
    FoxSchoolRepository repo,
  ) : this._internal(
          () => FlashcardAPINotifier()..repo = repo,
          from: flashcardAPINotifierProvider,
          name: r'flashcardAPINotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$flashcardAPINotifierHash,
          dependencies: FlashcardAPINotifierFamily._dependencies,
          allTransitiveDependencies:
              FlashcardAPINotifierFamily._allTransitiveDependencies,
          repo: repo,
        );

  FlashcardAPINotifierProvider._internal(
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
  FlashcardAPIState runNotifierBuild(
    covariant FlashcardAPINotifier notifier,
  ) {
    return notifier.build(
      repo,
    );
  }

  @override
  Override overrideWith(FlashcardAPINotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: FlashcardAPINotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<FlashcardAPINotifier, FlashcardAPIState>
      createElement() {
    return _FlashcardAPINotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FlashcardAPINotifierProvider && other.repo == repo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, repo.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FlashcardAPINotifierRef
    on AutoDisposeNotifierProviderRef<FlashcardAPIState> {
  /// The parameter `repo` of this provider.
  FoxSchoolRepository get repo;
}

class _FlashcardAPINotifierProviderElement
    extends AutoDisposeNotifierProviderElement<FlashcardAPINotifier,
        FlashcardAPIState> with FlashcardAPINotifierRef {
  _FlashcardAPINotifierProviderElement(super.provider);

  @override
  FoxSchoolRepository get repo => (origin as FlashcardAPINotifierProvider).repo;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
