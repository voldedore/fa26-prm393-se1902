// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NoteNotifier)
final noteProvider = NoteNotifierProvider._();

final class NoteNotifierProvider
    extends $NotifierProvider<NoteNotifier, List<Note>> {
  NoteNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'noteProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$noteNotifierHash();

  @$internal
  @override
  NoteNotifier create() => NoteNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Note> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Note>>(value),
    );
  }
}

String _$noteNotifierHash() => r'62d95a06978e02b388ab19e30504144326508cd2';

abstract class _$NoteNotifier extends $Notifier<List<Note>> {
  List<Note> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<List<Note>, List<Note>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Note>, List<Note>>,
              List<Note>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
