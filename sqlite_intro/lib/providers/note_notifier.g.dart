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
    extends $AsyncNotifierProvider<NoteNotifier, List<Note>> {
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
}

String _$noteNotifierHash() => r'570415ae686f2621bba6fde7606781b5f8a4485a';

abstract class _$NoteNotifier extends $AsyncNotifier<List<Note>> {
  FutureOr<List<Note>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Note>>, List<Note>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Note>>, List<Note>>,
              AsyncValue<List<Note>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
