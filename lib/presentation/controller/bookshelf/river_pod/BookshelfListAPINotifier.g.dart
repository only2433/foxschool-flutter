// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BookshelfListAPINotifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bookshelfListAPINotifierHash() =>
    r'3c1c9d377d20d0a97810c3d6e539621dbcdb9f7f';

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

abstract class _$BookshelfListAPINotifier
    extends BuildlessAutoDisposeNotifier<BookshelfListAPIState> {
  late final FoxSchoolRepository repo;

  BookshelfListAPIState build(
    FoxSchoolRepository repo,
  );
}

/// See also [BookshelfListAPINotifier].
@ProviderFor(BookshelfListAPINotifier)
const bookshelfListAPINotifierProvider = BookshelfListAPINotifierFamily();

/// See also [BookshelfListAPINotifier].
class BookshelfListAPINotifierFamily extends Family<BookshelfListAPIState> {
  /// See also [BookshelfListAPINotifier].
  const BookshelfListAPINotifierFamily();

  /// See also [BookshelfListAPINotifier].
  BookshelfListAPINotifierProvider call(
    FoxSchoolRepository repo,
  ) {
    return BookshelfListAPINotifierProvider(
      repo,
    );
  }

  @override
  BookshelfListAPINotifierProvider getProviderOverride(
    covariant BookshelfListAPINotifierProvider provider,
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
  String? get name => r'bookshelfListAPINotifierProvider';
}

/// See also [BookshelfListAPINotifier].
class BookshelfListAPINotifierProvider extends AutoDisposeNotifierProviderImpl<
    BookshelfListAPINotifier, BookshelfListAPIState> {
  /// See also [BookshelfListAPINotifier].
  BookshelfListAPINotifierProvider(
    FoxSchoolRepository repo,
  ) : this._internal(
          () => BookshelfListAPINotifier()..repo = repo,
          from: bookshelfListAPINotifierProvider,
          name: r'bookshelfListAPINotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$bookshelfListAPINotifierHash,
          dependencies: BookshelfListAPINotifierFamily._dependencies,
          allTransitiveDependencies:
              BookshelfListAPINotifierFamily._allTransitiveDependencies,
          repo: repo,
        );

  BookshelfListAPINotifierProvider._internal(
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
  BookshelfListAPIState runNotifierBuild(
    covariant BookshelfListAPINotifier notifier,
  ) {
    return notifier.build(
      repo,
    );
  }

  @override
  Override overrideWith(BookshelfListAPINotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: BookshelfListAPINotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<BookshelfListAPINotifier,
      BookshelfListAPIState> createElement() {
    return _BookshelfListAPINotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BookshelfListAPINotifierProvider && other.repo == repo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, repo.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BookshelfListAPINotifierRef
    on AutoDisposeNotifierProviderRef<BookshelfListAPIState> {
  /// The parameter `repo` of this provider.
  FoxSchoolRepository get repo;
}

class _BookshelfListAPINotifierProviderElement
    extends AutoDisposeNotifierProviderElement<BookshelfListAPINotifier,
        BookshelfListAPIState> with BookshelfListAPINotifierRef {
  _BookshelfListAPINotifierProviderElement(super.provider);

  @override
  FoxSchoolRepository get repo =>
      (origin as BookshelfListAPINotifierProvider).repo;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
