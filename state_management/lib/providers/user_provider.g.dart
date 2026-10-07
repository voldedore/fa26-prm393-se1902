// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(user)
final userProvider = UserProvider._();

final class UserProvider
    extends $FunctionalProvider<List<User>, List<User>, List<User>>
    with $Provider<List<User>> {
  UserProvider._()
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
  String debugGetCreateSourceHash() => _$userHash();

  @$internal
  @override
  $ProviderElement<List<User>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<User> create(Ref ref) {
    return user(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<User> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<User>>(value),
    );
  }
}

String _$userHash() => r'be001fd6f8b0a0590313e24527fe39614d51b971';
