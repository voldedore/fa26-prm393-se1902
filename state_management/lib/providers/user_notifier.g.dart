// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserNotifier)
final userProvider = UserNotifierProvider._();

final class UserNotifierProvider
    extends $NotifierProvider<UserNotifier, List<User>> {
  UserNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userNotifierHash();

  @$internal
  @override
  UserNotifier create() => UserNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<User> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<User>>(value),
    );
  }
}

String _$userNotifierHash() => r'b8e63f503ecd233eb0416d77d2043549353799d3';

abstract class _$UserNotifier extends $Notifier<List<User>> {
  List<User> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<List<User>, List<User>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<User>, List<User>>,
              List<User>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(totalUsers)
final totalUsersProvider = TotalUsersProvider._();

final class TotalUsersProvider extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  TotalUsersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'totalUsersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$totalUsersHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return totalUsers(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$totalUsersHash() => r'dece96b08babf7866489252490be410aefa7a452';
