// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QuizAPINotifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$quizAPINotifierHash() => r'581ce8bf0ac5b24c457087330abb30f33b72907a';

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

abstract class _$QuizAPINotifier
    extends BuildlessAutoDisposeNotifier<QuizAPIState> {
  late final FoxSchoolRepository repo;

  QuizAPIState build(
    FoxSchoolRepository repo,
  );
}

/// See also [QuizAPINotifier].
@ProviderFor(QuizAPINotifier)
const quizAPINotifierProvider = QuizAPINotifierFamily();

/// See also [QuizAPINotifier].
class QuizAPINotifierFamily extends Family<QuizAPIState> {
  /// See also [QuizAPINotifier].
  const QuizAPINotifierFamily();

  /// See also [QuizAPINotifier].
  QuizAPINotifierProvider call(
    FoxSchoolRepository repo,
  ) {
    return QuizAPINotifierProvider(
      repo,
    );
  }

  @override
  QuizAPINotifierProvider getProviderOverride(
    covariant QuizAPINotifierProvider provider,
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
  String? get name => r'quizAPINotifierProvider';
}

/// See also [QuizAPINotifier].
class QuizAPINotifierProvider
    extends AutoDisposeNotifierProviderImpl<QuizAPINotifier, QuizAPIState> {
  /// See also [QuizAPINotifier].
  QuizAPINotifierProvider(
    FoxSchoolRepository repo,
  ) : this._internal(
          () => QuizAPINotifier()..repo = repo,
          from: quizAPINotifierProvider,
          name: r'quizAPINotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$quizAPINotifierHash,
          dependencies: QuizAPINotifierFamily._dependencies,
          allTransitiveDependencies:
              QuizAPINotifierFamily._allTransitiveDependencies,
          repo: repo,
        );

  QuizAPINotifierProvider._internal(
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
  QuizAPIState runNotifierBuild(
    covariant QuizAPINotifier notifier,
  ) {
    return notifier.build(
      repo,
    );
  }

  @override
  Override overrideWith(QuizAPINotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: QuizAPINotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<QuizAPINotifier, QuizAPIState>
      createElement() {
    return _QuizAPINotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is QuizAPINotifierProvider && other.repo == repo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, repo.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin QuizAPINotifierRef on AutoDisposeNotifierProviderRef<QuizAPIState> {
  /// The parameter `repo` of this provider.
  FoxSchoolRepository get repo;
}

class _QuizAPINotifierProviderElement
    extends AutoDisposeNotifierProviderElement<QuizAPINotifier, QuizAPIState>
    with QuizAPINotifierRef {
  _QuizAPINotifierProviderElement(super.provider);

  @override
  FoxSchoolRepository get repo => (origin as QuizAPINotifierProvider).repo;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
