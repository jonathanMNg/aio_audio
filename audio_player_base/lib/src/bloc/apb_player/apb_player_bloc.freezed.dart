// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apb_player_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ApbPlayerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() play,
    required TResult Function() pause,
    required TResult Function() resume,
    required TResult Function() stop,
    required TResult Function() next,
    required TResult Function() prev,
    required TResult Function() replay,
    required TResult Function(Duration position) seek,
    required TResult Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )
    skip,
    required TResult Function(double speed) toggleSpeed,
    required TResult Function(LoopMode loopMode) toggleLoop,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? play,
    TResult? Function()? pause,
    TResult? Function()? resume,
    TResult? Function()? stop,
    TResult? Function()? next,
    TResult? Function()? prev,
    TResult? Function()? replay,
    TResult? Function(Duration position)? seek,
    TResult? Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )?
    skip,
    TResult? Function(double speed)? toggleSpeed,
    TResult? Function(LoopMode loopMode)? toggleLoop,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function()? resume,
    TResult Function()? stop,
    TResult Function()? next,
    TResult Function()? prev,
    TResult Function()? replay,
    TResult Function(Duration position)? seek,
    TResult Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )?
    skip,
    TResult Function(double speed)? toggleSpeed,
    TResult Function(LoopMode loopMode)? toggleLoop,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Play value) play,
    required TResult Function(_Pause value) pause,
    required TResult Function(_Resume value) resume,
    required TResult Function(_Stop value) stop,
    required TResult Function(_Next value) next,
    required TResult Function(_Prev value) prev,
    required TResult Function(_Replay value) replay,
    required TResult Function(_Seek value) seek,
    required TResult Function(_Skip value) skip,
    required TResult Function(_ToggleSpeed value) toggleSpeed,
    required TResult Function(_ToggleLoop value) toggleLoop,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Play value)? play,
    TResult? Function(_Pause value)? pause,
    TResult? Function(_Resume value)? resume,
    TResult? Function(_Stop value)? stop,
    TResult? Function(_Next value)? next,
    TResult? Function(_Prev value)? prev,
    TResult? Function(_Replay value)? replay,
    TResult? Function(_Seek value)? seek,
    TResult? Function(_Skip value)? skip,
    TResult? Function(_ToggleSpeed value)? toggleSpeed,
    TResult? Function(_ToggleLoop value)? toggleLoop,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Play value)? play,
    TResult Function(_Pause value)? pause,
    TResult Function(_Resume value)? resume,
    TResult Function(_Stop value)? stop,
    TResult Function(_Next value)? next,
    TResult Function(_Prev value)? prev,
    TResult Function(_Replay value)? replay,
    TResult Function(_Seek value)? seek,
    TResult Function(_Skip value)? skip,
    TResult Function(_ToggleSpeed value)? toggleSpeed,
    TResult Function(_ToggleLoop value)? toggleLoop,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApbPlayerEventCopyWith<$Res> {
  factory $ApbPlayerEventCopyWith(
    ApbPlayerEvent value,
    $Res Function(ApbPlayerEvent) then,
  ) = _$ApbPlayerEventCopyWithImpl<$Res, ApbPlayerEvent>;
}

/// @nodoc
class _$ApbPlayerEventCopyWithImpl<$Res, $Val extends ApbPlayerEvent>
    implements $ApbPlayerEventCopyWith<$Res> {
  _$ApbPlayerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApbPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PlayImplCopyWith<$Res> {
  factory _$$PlayImplCopyWith(
    _$PlayImpl value,
    $Res Function(_$PlayImpl) then,
  ) = __$$PlayImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PlayImplCopyWithImpl<$Res>
    extends _$ApbPlayerEventCopyWithImpl<$Res, _$PlayImpl>
    implements _$$PlayImplCopyWith<$Res> {
  __$$PlayImplCopyWithImpl(_$PlayImpl _value, $Res Function(_$PlayImpl) _then)
    : super(_value, _then);

  /// Create a copy of ApbPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PlayImpl implements _Play {
  const _$PlayImpl();

  @override
  String toString() {
    return 'ApbPlayerEvent.play()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PlayImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() play,
    required TResult Function() pause,
    required TResult Function() resume,
    required TResult Function() stop,
    required TResult Function() next,
    required TResult Function() prev,
    required TResult Function() replay,
    required TResult Function(Duration position) seek,
    required TResult Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )
    skip,
    required TResult Function(double speed) toggleSpeed,
    required TResult Function(LoopMode loopMode) toggleLoop,
  }) {
    return play();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? play,
    TResult? Function()? pause,
    TResult? Function()? resume,
    TResult? Function()? stop,
    TResult? Function()? next,
    TResult? Function()? prev,
    TResult? Function()? replay,
    TResult? Function(Duration position)? seek,
    TResult? Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )?
    skip,
    TResult? Function(double speed)? toggleSpeed,
    TResult? Function(LoopMode loopMode)? toggleLoop,
  }) {
    return play?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function()? resume,
    TResult Function()? stop,
    TResult Function()? next,
    TResult Function()? prev,
    TResult Function()? replay,
    TResult Function(Duration position)? seek,
    TResult Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )?
    skip,
    TResult Function(double speed)? toggleSpeed,
    TResult Function(LoopMode loopMode)? toggleLoop,
    required TResult orElse(),
  }) {
    if (play != null) {
      return play();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Play value) play,
    required TResult Function(_Pause value) pause,
    required TResult Function(_Resume value) resume,
    required TResult Function(_Stop value) stop,
    required TResult Function(_Next value) next,
    required TResult Function(_Prev value) prev,
    required TResult Function(_Replay value) replay,
    required TResult Function(_Seek value) seek,
    required TResult Function(_Skip value) skip,
    required TResult Function(_ToggleSpeed value) toggleSpeed,
    required TResult Function(_ToggleLoop value) toggleLoop,
  }) {
    return play(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Play value)? play,
    TResult? Function(_Pause value)? pause,
    TResult? Function(_Resume value)? resume,
    TResult? Function(_Stop value)? stop,
    TResult? Function(_Next value)? next,
    TResult? Function(_Prev value)? prev,
    TResult? Function(_Replay value)? replay,
    TResult? Function(_Seek value)? seek,
    TResult? Function(_Skip value)? skip,
    TResult? Function(_ToggleSpeed value)? toggleSpeed,
    TResult? Function(_ToggleLoop value)? toggleLoop,
  }) {
    return play?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Play value)? play,
    TResult Function(_Pause value)? pause,
    TResult Function(_Resume value)? resume,
    TResult Function(_Stop value)? stop,
    TResult Function(_Next value)? next,
    TResult Function(_Prev value)? prev,
    TResult Function(_Replay value)? replay,
    TResult Function(_Seek value)? seek,
    TResult Function(_Skip value)? skip,
    TResult Function(_ToggleSpeed value)? toggleSpeed,
    TResult Function(_ToggleLoop value)? toggleLoop,
    required TResult orElse(),
  }) {
    if (play != null) {
      return play(this);
    }
    return orElse();
  }
}

abstract class _Play implements ApbPlayerEvent {
  const factory _Play() = _$PlayImpl;
}

/// @nodoc
abstract class _$$PauseImplCopyWith<$Res> {
  factory _$$PauseImplCopyWith(
    _$PauseImpl value,
    $Res Function(_$PauseImpl) then,
  ) = __$$PauseImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PauseImplCopyWithImpl<$Res>
    extends _$ApbPlayerEventCopyWithImpl<$Res, _$PauseImpl>
    implements _$$PauseImplCopyWith<$Res> {
  __$$PauseImplCopyWithImpl(
    _$PauseImpl _value,
    $Res Function(_$PauseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApbPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PauseImpl implements _Pause {
  const _$PauseImpl();

  @override
  String toString() {
    return 'ApbPlayerEvent.pause()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PauseImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() play,
    required TResult Function() pause,
    required TResult Function() resume,
    required TResult Function() stop,
    required TResult Function() next,
    required TResult Function() prev,
    required TResult Function() replay,
    required TResult Function(Duration position) seek,
    required TResult Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )
    skip,
    required TResult Function(double speed) toggleSpeed,
    required TResult Function(LoopMode loopMode) toggleLoop,
  }) {
    return pause();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? play,
    TResult? Function()? pause,
    TResult? Function()? resume,
    TResult? Function()? stop,
    TResult? Function()? next,
    TResult? Function()? prev,
    TResult? Function()? replay,
    TResult? Function(Duration position)? seek,
    TResult? Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )?
    skip,
    TResult? Function(double speed)? toggleSpeed,
    TResult? Function(LoopMode loopMode)? toggleLoop,
  }) {
    return pause?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function()? resume,
    TResult Function()? stop,
    TResult Function()? next,
    TResult Function()? prev,
    TResult Function()? replay,
    TResult Function(Duration position)? seek,
    TResult Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )?
    skip,
    TResult Function(double speed)? toggleSpeed,
    TResult Function(LoopMode loopMode)? toggleLoop,
    required TResult orElse(),
  }) {
    if (pause != null) {
      return pause();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Play value) play,
    required TResult Function(_Pause value) pause,
    required TResult Function(_Resume value) resume,
    required TResult Function(_Stop value) stop,
    required TResult Function(_Next value) next,
    required TResult Function(_Prev value) prev,
    required TResult Function(_Replay value) replay,
    required TResult Function(_Seek value) seek,
    required TResult Function(_Skip value) skip,
    required TResult Function(_ToggleSpeed value) toggleSpeed,
    required TResult Function(_ToggleLoop value) toggleLoop,
  }) {
    return pause(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Play value)? play,
    TResult? Function(_Pause value)? pause,
    TResult? Function(_Resume value)? resume,
    TResult? Function(_Stop value)? stop,
    TResult? Function(_Next value)? next,
    TResult? Function(_Prev value)? prev,
    TResult? Function(_Replay value)? replay,
    TResult? Function(_Seek value)? seek,
    TResult? Function(_Skip value)? skip,
    TResult? Function(_ToggleSpeed value)? toggleSpeed,
    TResult? Function(_ToggleLoop value)? toggleLoop,
  }) {
    return pause?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Play value)? play,
    TResult Function(_Pause value)? pause,
    TResult Function(_Resume value)? resume,
    TResult Function(_Stop value)? stop,
    TResult Function(_Next value)? next,
    TResult Function(_Prev value)? prev,
    TResult Function(_Replay value)? replay,
    TResult Function(_Seek value)? seek,
    TResult Function(_Skip value)? skip,
    TResult Function(_ToggleSpeed value)? toggleSpeed,
    TResult Function(_ToggleLoop value)? toggleLoop,
    required TResult orElse(),
  }) {
    if (pause != null) {
      return pause(this);
    }
    return orElse();
  }
}

abstract class _Pause implements ApbPlayerEvent {
  const factory _Pause() = _$PauseImpl;
}

/// @nodoc
abstract class _$$ResumeImplCopyWith<$Res> {
  factory _$$ResumeImplCopyWith(
    _$ResumeImpl value,
    $Res Function(_$ResumeImpl) then,
  ) = __$$ResumeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResumeImplCopyWithImpl<$Res>
    extends _$ApbPlayerEventCopyWithImpl<$Res, _$ResumeImpl>
    implements _$$ResumeImplCopyWith<$Res> {
  __$$ResumeImplCopyWithImpl(
    _$ResumeImpl _value,
    $Res Function(_$ResumeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApbPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResumeImpl implements _Resume {
  const _$ResumeImpl();

  @override
  String toString() {
    return 'ApbPlayerEvent.resume()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResumeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() play,
    required TResult Function() pause,
    required TResult Function() resume,
    required TResult Function() stop,
    required TResult Function() next,
    required TResult Function() prev,
    required TResult Function() replay,
    required TResult Function(Duration position) seek,
    required TResult Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )
    skip,
    required TResult Function(double speed) toggleSpeed,
    required TResult Function(LoopMode loopMode) toggleLoop,
  }) {
    return resume();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? play,
    TResult? Function()? pause,
    TResult? Function()? resume,
    TResult? Function()? stop,
    TResult? Function()? next,
    TResult? Function()? prev,
    TResult? Function()? replay,
    TResult? Function(Duration position)? seek,
    TResult? Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )?
    skip,
    TResult? Function(double speed)? toggleSpeed,
    TResult? Function(LoopMode loopMode)? toggleLoop,
  }) {
    return resume?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function()? resume,
    TResult Function()? stop,
    TResult Function()? next,
    TResult Function()? prev,
    TResult Function()? replay,
    TResult Function(Duration position)? seek,
    TResult Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )?
    skip,
    TResult Function(double speed)? toggleSpeed,
    TResult Function(LoopMode loopMode)? toggleLoop,
    required TResult orElse(),
  }) {
    if (resume != null) {
      return resume();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Play value) play,
    required TResult Function(_Pause value) pause,
    required TResult Function(_Resume value) resume,
    required TResult Function(_Stop value) stop,
    required TResult Function(_Next value) next,
    required TResult Function(_Prev value) prev,
    required TResult Function(_Replay value) replay,
    required TResult Function(_Seek value) seek,
    required TResult Function(_Skip value) skip,
    required TResult Function(_ToggleSpeed value) toggleSpeed,
    required TResult Function(_ToggleLoop value) toggleLoop,
  }) {
    return resume(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Play value)? play,
    TResult? Function(_Pause value)? pause,
    TResult? Function(_Resume value)? resume,
    TResult? Function(_Stop value)? stop,
    TResult? Function(_Next value)? next,
    TResult? Function(_Prev value)? prev,
    TResult? Function(_Replay value)? replay,
    TResult? Function(_Seek value)? seek,
    TResult? Function(_Skip value)? skip,
    TResult? Function(_ToggleSpeed value)? toggleSpeed,
    TResult? Function(_ToggleLoop value)? toggleLoop,
  }) {
    return resume?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Play value)? play,
    TResult Function(_Pause value)? pause,
    TResult Function(_Resume value)? resume,
    TResult Function(_Stop value)? stop,
    TResult Function(_Next value)? next,
    TResult Function(_Prev value)? prev,
    TResult Function(_Replay value)? replay,
    TResult Function(_Seek value)? seek,
    TResult Function(_Skip value)? skip,
    TResult Function(_ToggleSpeed value)? toggleSpeed,
    TResult Function(_ToggleLoop value)? toggleLoop,
    required TResult orElse(),
  }) {
    if (resume != null) {
      return resume(this);
    }
    return orElse();
  }
}

abstract class _Resume implements ApbPlayerEvent {
  const factory _Resume() = _$ResumeImpl;
}

/// @nodoc
abstract class _$$StopImplCopyWith<$Res> {
  factory _$$StopImplCopyWith(
    _$StopImpl value,
    $Res Function(_$StopImpl) then,
  ) = __$$StopImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StopImplCopyWithImpl<$Res>
    extends _$ApbPlayerEventCopyWithImpl<$Res, _$StopImpl>
    implements _$$StopImplCopyWith<$Res> {
  __$$StopImplCopyWithImpl(_$StopImpl _value, $Res Function(_$StopImpl) _then)
    : super(_value, _then);

  /// Create a copy of ApbPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StopImpl implements _Stop {
  const _$StopImpl();

  @override
  String toString() {
    return 'ApbPlayerEvent.stop()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StopImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() play,
    required TResult Function() pause,
    required TResult Function() resume,
    required TResult Function() stop,
    required TResult Function() next,
    required TResult Function() prev,
    required TResult Function() replay,
    required TResult Function(Duration position) seek,
    required TResult Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )
    skip,
    required TResult Function(double speed) toggleSpeed,
    required TResult Function(LoopMode loopMode) toggleLoop,
  }) {
    return stop();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? play,
    TResult? Function()? pause,
    TResult? Function()? resume,
    TResult? Function()? stop,
    TResult? Function()? next,
    TResult? Function()? prev,
    TResult? Function()? replay,
    TResult? Function(Duration position)? seek,
    TResult? Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )?
    skip,
    TResult? Function(double speed)? toggleSpeed,
    TResult? Function(LoopMode loopMode)? toggleLoop,
  }) {
    return stop?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function()? resume,
    TResult Function()? stop,
    TResult Function()? next,
    TResult Function()? prev,
    TResult Function()? replay,
    TResult Function(Duration position)? seek,
    TResult Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )?
    skip,
    TResult Function(double speed)? toggleSpeed,
    TResult Function(LoopMode loopMode)? toggleLoop,
    required TResult orElse(),
  }) {
    if (stop != null) {
      return stop();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Play value) play,
    required TResult Function(_Pause value) pause,
    required TResult Function(_Resume value) resume,
    required TResult Function(_Stop value) stop,
    required TResult Function(_Next value) next,
    required TResult Function(_Prev value) prev,
    required TResult Function(_Replay value) replay,
    required TResult Function(_Seek value) seek,
    required TResult Function(_Skip value) skip,
    required TResult Function(_ToggleSpeed value) toggleSpeed,
    required TResult Function(_ToggleLoop value) toggleLoop,
  }) {
    return stop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Play value)? play,
    TResult? Function(_Pause value)? pause,
    TResult? Function(_Resume value)? resume,
    TResult? Function(_Stop value)? stop,
    TResult? Function(_Next value)? next,
    TResult? Function(_Prev value)? prev,
    TResult? Function(_Replay value)? replay,
    TResult? Function(_Seek value)? seek,
    TResult? Function(_Skip value)? skip,
    TResult? Function(_ToggleSpeed value)? toggleSpeed,
    TResult? Function(_ToggleLoop value)? toggleLoop,
  }) {
    return stop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Play value)? play,
    TResult Function(_Pause value)? pause,
    TResult Function(_Resume value)? resume,
    TResult Function(_Stop value)? stop,
    TResult Function(_Next value)? next,
    TResult Function(_Prev value)? prev,
    TResult Function(_Replay value)? replay,
    TResult Function(_Seek value)? seek,
    TResult Function(_Skip value)? skip,
    TResult Function(_ToggleSpeed value)? toggleSpeed,
    TResult Function(_ToggleLoop value)? toggleLoop,
    required TResult orElse(),
  }) {
    if (stop != null) {
      return stop(this);
    }
    return orElse();
  }
}

abstract class _Stop implements ApbPlayerEvent {
  const factory _Stop() = _$StopImpl;
}

/// @nodoc
abstract class _$$NextImplCopyWith<$Res> {
  factory _$$NextImplCopyWith(
    _$NextImpl value,
    $Res Function(_$NextImpl) then,
  ) = __$$NextImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NextImplCopyWithImpl<$Res>
    extends _$ApbPlayerEventCopyWithImpl<$Res, _$NextImpl>
    implements _$$NextImplCopyWith<$Res> {
  __$$NextImplCopyWithImpl(_$NextImpl _value, $Res Function(_$NextImpl) _then)
    : super(_value, _then);

  /// Create a copy of ApbPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NextImpl implements _Next {
  const _$NextImpl();

  @override
  String toString() {
    return 'ApbPlayerEvent.next()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NextImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() play,
    required TResult Function() pause,
    required TResult Function() resume,
    required TResult Function() stop,
    required TResult Function() next,
    required TResult Function() prev,
    required TResult Function() replay,
    required TResult Function(Duration position) seek,
    required TResult Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )
    skip,
    required TResult Function(double speed) toggleSpeed,
    required TResult Function(LoopMode loopMode) toggleLoop,
  }) {
    return next();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? play,
    TResult? Function()? pause,
    TResult? Function()? resume,
    TResult? Function()? stop,
    TResult? Function()? next,
    TResult? Function()? prev,
    TResult? Function()? replay,
    TResult? Function(Duration position)? seek,
    TResult? Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )?
    skip,
    TResult? Function(double speed)? toggleSpeed,
    TResult? Function(LoopMode loopMode)? toggleLoop,
  }) {
    return next?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function()? resume,
    TResult Function()? stop,
    TResult Function()? next,
    TResult Function()? prev,
    TResult Function()? replay,
    TResult Function(Duration position)? seek,
    TResult Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )?
    skip,
    TResult Function(double speed)? toggleSpeed,
    TResult Function(LoopMode loopMode)? toggleLoop,
    required TResult orElse(),
  }) {
    if (next != null) {
      return next();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Play value) play,
    required TResult Function(_Pause value) pause,
    required TResult Function(_Resume value) resume,
    required TResult Function(_Stop value) stop,
    required TResult Function(_Next value) next,
    required TResult Function(_Prev value) prev,
    required TResult Function(_Replay value) replay,
    required TResult Function(_Seek value) seek,
    required TResult Function(_Skip value) skip,
    required TResult Function(_ToggleSpeed value) toggleSpeed,
    required TResult Function(_ToggleLoop value) toggleLoop,
  }) {
    return next(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Play value)? play,
    TResult? Function(_Pause value)? pause,
    TResult? Function(_Resume value)? resume,
    TResult? Function(_Stop value)? stop,
    TResult? Function(_Next value)? next,
    TResult? Function(_Prev value)? prev,
    TResult? Function(_Replay value)? replay,
    TResult? Function(_Seek value)? seek,
    TResult? Function(_Skip value)? skip,
    TResult? Function(_ToggleSpeed value)? toggleSpeed,
    TResult? Function(_ToggleLoop value)? toggleLoop,
  }) {
    return next?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Play value)? play,
    TResult Function(_Pause value)? pause,
    TResult Function(_Resume value)? resume,
    TResult Function(_Stop value)? stop,
    TResult Function(_Next value)? next,
    TResult Function(_Prev value)? prev,
    TResult Function(_Replay value)? replay,
    TResult Function(_Seek value)? seek,
    TResult Function(_Skip value)? skip,
    TResult Function(_ToggleSpeed value)? toggleSpeed,
    TResult Function(_ToggleLoop value)? toggleLoop,
    required TResult orElse(),
  }) {
    if (next != null) {
      return next(this);
    }
    return orElse();
  }
}

abstract class _Next implements ApbPlayerEvent {
  const factory _Next() = _$NextImpl;
}

/// @nodoc
abstract class _$$PrevImplCopyWith<$Res> {
  factory _$$PrevImplCopyWith(
    _$PrevImpl value,
    $Res Function(_$PrevImpl) then,
  ) = __$$PrevImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PrevImplCopyWithImpl<$Res>
    extends _$ApbPlayerEventCopyWithImpl<$Res, _$PrevImpl>
    implements _$$PrevImplCopyWith<$Res> {
  __$$PrevImplCopyWithImpl(_$PrevImpl _value, $Res Function(_$PrevImpl) _then)
    : super(_value, _then);

  /// Create a copy of ApbPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PrevImpl implements _Prev {
  const _$PrevImpl();

  @override
  String toString() {
    return 'ApbPlayerEvent.prev()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PrevImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() play,
    required TResult Function() pause,
    required TResult Function() resume,
    required TResult Function() stop,
    required TResult Function() next,
    required TResult Function() prev,
    required TResult Function() replay,
    required TResult Function(Duration position) seek,
    required TResult Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )
    skip,
    required TResult Function(double speed) toggleSpeed,
    required TResult Function(LoopMode loopMode) toggleLoop,
  }) {
    return prev();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? play,
    TResult? Function()? pause,
    TResult? Function()? resume,
    TResult? Function()? stop,
    TResult? Function()? next,
    TResult? Function()? prev,
    TResult? Function()? replay,
    TResult? Function(Duration position)? seek,
    TResult? Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )?
    skip,
    TResult? Function(double speed)? toggleSpeed,
    TResult? Function(LoopMode loopMode)? toggleLoop,
  }) {
    return prev?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function()? resume,
    TResult Function()? stop,
    TResult Function()? next,
    TResult Function()? prev,
    TResult Function()? replay,
    TResult Function(Duration position)? seek,
    TResult Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )?
    skip,
    TResult Function(double speed)? toggleSpeed,
    TResult Function(LoopMode loopMode)? toggleLoop,
    required TResult orElse(),
  }) {
    if (prev != null) {
      return prev();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Play value) play,
    required TResult Function(_Pause value) pause,
    required TResult Function(_Resume value) resume,
    required TResult Function(_Stop value) stop,
    required TResult Function(_Next value) next,
    required TResult Function(_Prev value) prev,
    required TResult Function(_Replay value) replay,
    required TResult Function(_Seek value) seek,
    required TResult Function(_Skip value) skip,
    required TResult Function(_ToggleSpeed value) toggleSpeed,
    required TResult Function(_ToggleLoop value) toggleLoop,
  }) {
    return prev(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Play value)? play,
    TResult? Function(_Pause value)? pause,
    TResult? Function(_Resume value)? resume,
    TResult? Function(_Stop value)? stop,
    TResult? Function(_Next value)? next,
    TResult? Function(_Prev value)? prev,
    TResult? Function(_Replay value)? replay,
    TResult? Function(_Seek value)? seek,
    TResult? Function(_Skip value)? skip,
    TResult? Function(_ToggleSpeed value)? toggleSpeed,
    TResult? Function(_ToggleLoop value)? toggleLoop,
  }) {
    return prev?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Play value)? play,
    TResult Function(_Pause value)? pause,
    TResult Function(_Resume value)? resume,
    TResult Function(_Stop value)? stop,
    TResult Function(_Next value)? next,
    TResult Function(_Prev value)? prev,
    TResult Function(_Replay value)? replay,
    TResult Function(_Seek value)? seek,
    TResult Function(_Skip value)? skip,
    TResult Function(_ToggleSpeed value)? toggleSpeed,
    TResult Function(_ToggleLoop value)? toggleLoop,
    required TResult orElse(),
  }) {
    if (prev != null) {
      return prev(this);
    }
    return orElse();
  }
}

abstract class _Prev implements ApbPlayerEvent {
  const factory _Prev() = _$PrevImpl;
}

/// @nodoc
abstract class _$$ReplayImplCopyWith<$Res> {
  factory _$$ReplayImplCopyWith(
    _$ReplayImpl value,
    $Res Function(_$ReplayImpl) then,
  ) = __$$ReplayImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReplayImplCopyWithImpl<$Res>
    extends _$ApbPlayerEventCopyWithImpl<$Res, _$ReplayImpl>
    implements _$$ReplayImplCopyWith<$Res> {
  __$$ReplayImplCopyWithImpl(
    _$ReplayImpl _value,
    $Res Function(_$ReplayImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApbPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ReplayImpl implements _Replay {
  const _$ReplayImpl();

  @override
  String toString() {
    return 'ApbPlayerEvent.replay()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ReplayImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() play,
    required TResult Function() pause,
    required TResult Function() resume,
    required TResult Function() stop,
    required TResult Function() next,
    required TResult Function() prev,
    required TResult Function() replay,
    required TResult Function(Duration position) seek,
    required TResult Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )
    skip,
    required TResult Function(double speed) toggleSpeed,
    required TResult Function(LoopMode loopMode) toggleLoop,
  }) {
    return replay();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? play,
    TResult? Function()? pause,
    TResult? Function()? resume,
    TResult? Function()? stop,
    TResult? Function()? next,
    TResult? Function()? prev,
    TResult? Function()? replay,
    TResult? Function(Duration position)? seek,
    TResult? Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )?
    skip,
    TResult? Function(double speed)? toggleSpeed,
    TResult? Function(LoopMode loopMode)? toggleLoop,
  }) {
    return replay?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function()? resume,
    TResult Function()? stop,
    TResult Function()? next,
    TResult Function()? prev,
    TResult Function()? replay,
    TResult Function(Duration position)? seek,
    TResult Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )?
    skip,
    TResult Function(double speed)? toggleSpeed,
    TResult Function(LoopMode loopMode)? toggleLoop,
    required TResult orElse(),
  }) {
    if (replay != null) {
      return replay();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Play value) play,
    required TResult Function(_Pause value) pause,
    required TResult Function(_Resume value) resume,
    required TResult Function(_Stop value) stop,
    required TResult Function(_Next value) next,
    required TResult Function(_Prev value) prev,
    required TResult Function(_Replay value) replay,
    required TResult Function(_Seek value) seek,
    required TResult Function(_Skip value) skip,
    required TResult Function(_ToggleSpeed value) toggleSpeed,
    required TResult Function(_ToggleLoop value) toggleLoop,
  }) {
    return replay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Play value)? play,
    TResult? Function(_Pause value)? pause,
    TResult? Function(_Resume value)? resume,
    TResult? Function(_Stop value)? stop,
    TResult? Function(_Next value)? next,
    TResult? Function(_Prev value)? prev,
    TResult? Function(_Replay value)? replay,
    TResult? Function(_Seek value)? seek,
    TResult? Function(_Skip value)? skip,
    TResult? Function(_ToggleSpeed value)? toggleSpeed,
    TResult? Function(_ToggleLoop value)? toggleLoop,
  }) {
    return replay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Play value)? play,
    TResult Function(_Pause value)? pause,
    TResult Function(_Resume value)? resume,
    TResult Function(_Stop value)? stop,
    TResult Function(_Next value)? next,
    TResult Function(_Prev value)? prev,
    TResult Function(_Replay value)? replay,
    TResult Function(_Seek value)? seek,
    TResult Function(_Skip value)? skip,
    TResult Function(_ToggleSpeed value)? toggleSpeed,
    TResult Function(_ToggleLoop value)? toggleLoop,
    required TResult orElse(),
  }) {
    if (replay != null) {
      return replay(this);
    }
    return orElse();
  }
}

abstract class _Replay implements ApbPlayerEvent {
  const factory _Replay() = _$ReplayImpl;
}

/// @nodoc
abstract class _$$SeekImplCopyWith<$Res> {
  factory _$$SeekImplCopyWith(
    _$SeekImpl value,
    $Res Function(_$SeekImpl) then,
  ) = __$$SeekImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Duration position});
}

/// @nodoc
class __$$SeekImplCopyWithImpl<$Res>
    extends _$ApbPlayerEventCopyWithImpl<$Res, _$SeekImpl>
    implements _$$SeekImplCopyWith<$Res> {
  __$$SeekImplCopyWithImpl(_$SeekImpl _value, $Res Function(_$SeekImpl) _then)
    : super(_value, _then);

  /// Create a copy of ApbPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? position = null}) {
    return _then(
      _$SeekImpl(
        null == position
            ? _value.position
            : position // ignore: cast_nullable_to_non_nullable
                as Duration,
      ),
    );
  }
}

/// @nodoc

class _$SeekImpl implements _Seek {
  const _$SeekImpl(this.position);

  @override
  final Duration position;

  @override
  String toString() {
    return 'ApbPlayerEvent.seek(position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeekImpl &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @override
  int get hashCode => Object.hash(runtimeType, position);

  /// Create a copy of ApbPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SeekImplCopyWith<_$SeekImpl> get copyWith =>
      __$$SeekImplCopyWithImpl<_$SeekImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() play,
    required TResult Function() pause,
    required TResult Function() resume,
    required TResult Function() stop,
    required TResult Function() next,
    required TResult Function() prev,
    required TResult Function() replay,
    required TResult Function(Duration position) seek,
    required TResult Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )
    skip,
    required TResult Function(double speed) toggleSpeed,
    required TResult Function(LoopMode loopMode) toggleLoop,
  }) {
    return seek(position);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? play,
    TResult? Function()? pause,
    TResult? Function()? resume,
    TResult? Function()? stop,
    TResult? Function()? next,
    TResult? Function()? prev,
    TResult? Function()? replay,
    TResult? Function(Duration position)? seek,
    TResult? Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )?
    skip,
    TResult? Function(double speed)? toggleSpeed,
    TResult? Function(LoopMode loopMode)? toggleLoop,
  }) {
    return seek?.call(position);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function()? resume,
    TResult Function()? stop,
    TResult Function()? next,
    TResult Function()? prev,
    TResult Function()? replay,
    TResult Function(Duration position)? seek,
    TResult Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )?
    skip,
    TResult Function(double speed)? toggleSpeed,
    TResult Function(LoopMode loopMode)? toggleLoop,
    required TResult orElse(),
  }) {
    if (seek != null) {
      return seek(position);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Play value) play,
    required TResult Function(_Pause value) pause,
    required TResult Function(_Resume value) resume,
    required TResult Function(_Stop value) stop,
    required TResult Function(_Next value) next,
    required TResult Function(_Prev value) prev,
    required TResult Function(_Replay value) replay,
    required TResult Function(_Seek value) seek,
    required TResult Function(_Skip value) skip,
    required TResult Function(_ToggleSpeed value) toggleSpeed,
    required TResult Function(_ToggleLoop value) toggleLoop,
  }) {
    return seek(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Play value)? play,
    TResult? Function(_Pause value)? pause,
    TResult? Function(_Resume value)? resume,
    TResult? Function(_Stop value)? stop,
    TResult? Function(_Next value)? next,
    TResult? Function(_Prev value)? prev,
    TResult? Function(_Replay value)? replay,
    TResult? Function(_Seek value)? seek,
    TResult? Function(_Skip value)? skip,
    TResult? Function(_ToggleSpeed value)? toggleSpeed,
    TResult? Function(_ToggleLoop value)? toggleLoop,
  }) {
    return seek?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Play value)? play,
    TResult Function(_Pause value)? pause,
    TResult Function(_Resume value)? resume,
    TResult Function(_Stop value)? stop,
    TResult Function(_Next value)? next,
    TResult Function(_Prev value)? prev,
    TResult Function(_Replay value)? replay,
    TResult Function(_Seek value)? seek,
    TResult Function(_Skip value)? skip,
    TResult Function(_ToggleSpeed value)? toggleSpeed,
    TResult Function(_ToggleLoop value)? toggleLoop,
    required TResult orElse(),
  }) {
    if (seek != null) {
      return seek(this);
    }
    return orElse();
  }
}

abstract class _Seek implements ApbPlayerEvent {
  const factory _Seek(final Duration position) = _$SeekImpl;

  Duration get position;

  /// Create a copy of ApbPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SeekImplCopyWith<_$SeekImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SkipImplCopyWith<$Res> {
  factory _$$SkipImplCopyWith(
    _$SkipImpl value,
    $Res Function(_$SkipImpl) then,
  ) = __$$SkipImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Duration position, Duration duration, Duration skipDuration});
}

/// @nodoc
class __$$SkipImplCopyWithImpl<$Res>
    extends _$ApbPlayerEventCopyWithImpl<$Res, _$SkipImpl>
    implements _$$SkipImplCopyWith<$Res> {
  __$$SkipImplCopyWithImpl(_$SkipImpl _value, $Res Function(_$SkipImpl) _then)
    : super(_value, _then);

  /// Create a copy of ApbPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? duration = null,
    Object? skipDuration = null,
  }) {
    return _then(
      _$SkipImpl(
        null == position
            ? _value.position
            : position // ignore: cast_nullable_to_non_nullable
                as Duration,
        null == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                as Duration,
        null == skipDuration
            ? _value.skipDuration
            : skipDuration // ignore: cast_nullable_to_non_nullable
                as Duration,
      ),
    );
  }
}

/// @nodoc

class _$SkipImpl implements _Skip {
  const _$SkipImpl(this.position, this.duration, this.skipDuration);

  @override
  final Duration position;
  @override
  final Duration duration;
  @override
  final Duration skipDuration;

  @override
  String toString() {
    return 'ApbPlayerEvent.skip(position: $position, duration: $duration, skipDuration: $skipDuration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkipImpl &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.skipDuration, skipDuration) ||
                other.skipDuration == skipDuration));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, position, duration, skipDuration);

  /// Create a copy of ApbPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SkipImplCopyWith<_$SkipImpl> get copyWith =>
      __$$SkipImplCopyWithImpl<_$SkipImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() play,
    required TResult Function() pause,
    required TResult Function() resume,
    required TResult Function() stop,
    required TResult Function() next,
    required TResult Function() prev,
    required TResult Function() replay,
    required TResult Function(Duration position) seek,
    required TResult Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )
    skip,
    required TResult Function(double speed) toggleSpeed,
    required TResult Function(LoopMode loopMode) toggleLoop,
  }) {
    return skip(position, duration, skipDuration);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? play,
    TResult? Function()? pause,
    TResult? Function()? resume,
    TResult? Function()? stop,
    TResult? Function()? next,
    TResult? Function()? prev,
    TResult? Function()? replay,
    TResult? Function(Duration position)? seek,
    TResult? Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )?
    skip,
    TResult? Function(double speed)? toggleSpeed,
    TResult? Function(LoopMode loopMode)? toggleLoop,
  }) {
    return skip?.call(position, duration, skipDuration);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function()? resume,
    TResult Function()? stop,
    TResult Function()? next,
    TResult Function()? prev,
    TResult Function()? replay,
    TResult Function(Duration position)? seek,
    TResult Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )?
    skip,
    TResult Function(double speed)? toggleSpeed,
    TResult Function(LoopMode loopMode)? toggleLoop,
    required TResult orElse(),
  }) {
    if (skip != null) {
      return skip(position, duration, skipDuration);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Play value) play,
    required TResult Function(_Pause value) pause,
    required TResult Function(_Resume value) resume,
    required TResult Function(_Stop value) stop,
    required TResult Function(_Next value) next,
    required TResult Function(_Prev value) prev,
    required TResult Function(_Replay value) replay,
    required TResult Function(_Seek value) seek,
    required TResult Function(_Skip value) skip,
    required TResult Function(_ToggleSpeed value) toggleSpeed,
    required TResult Function(_ToggleLoop value) toggleLoop,
  }) {
    return skip(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Play value)? play,
    TResult? Function(_Pause value)? pause,
    TResult? Function(_Resume value)? resume,
    TResult? Function(_Stop value)? stop,
    TResult? Function(_Next value)? next,
    TResult? Function(_Prev value)? prev,
    TResult? Function(_Replay value)? replay,
    TResult? Function(_Seek value)? seek,
    TResult? Function(_Skip value)? skip,
    TResult? Function(_ToggleSpeed value)? toggleSpeed,
    TResult? Function(_ToggleLoop value)? toggleLoop,
  }) {
    return skip?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Play value)? play,
    TResult Function(_Pause value)? pause,
    TResult Function(_Resume value)? resume,
    TResult Function(_Stop value)? stop,
    TResult Function(_Next value)? next,
    TResult Function(_Prev value)? prev,
    TResult Function(_Replay value)? replay,
    TResult Function(_Seek value)? seek,
    TResult Function(_Skip value)? skip,
    TResult Function(_ToggleSpeed value)? toggleSpeed,
    TResult Function(_ToggleLoop value)? toggleLoop,
    required TResult orElse(),
  }) {
    if (skip != null) {
      return skip(this);
    }
    return orElse();
  }
}

abstract class _Skip implements ApbPlayerEvent {
  const factory _Skip(
    final Duration position,
    final Duration duration,
    final Duration skipDuration,
  ) = _$SkipImpl;

  Duration get position;
  Duration get duration;
  Duration get skipDuration;

  /// Create a copy of ApbPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SkipImplCopyWith<_$SkipImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleSpeedImplCopyWith<$Res> {
  factory _$$ToggleSpeedImplCopyWith(
    _$ToggleSpeedImpl value,
    $Res Function(_$ToggleSpeedImpl) then,
  ) = __$$ToggleSpeedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double speed});
}

/// @nodoc
class __$$ToggleSpeedImplCopyWithImpl<$Res>
    extends _$ApbPlayerEventCopyWithImpl<$Res, _$ToggleSpeedImpl>
    implements _$$ToggleSpeedImplCopyWith<$Res> {
  __$$ToggleSpeedImplCopyWithImpl(
    _$ToggleSpeedImpl _value,
    $Res Function(_$ToggleSpeedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApbPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? speed = null}) {
    return _then(
      _$ToggleSpeedImpl(
        null == speed
            ? _value.speed
            : speed // ignore: cast_nullable_to_non_nullable
                as double,
      ),
    );
  }
}

/// @nodoc

class _$ToggleSpeedImpl implements _ToggleSpeed {
  const _$ToggleSpeedImpl(this.speed);

  @override
  final double speed;

  @override
  String toString() {
    return 'ApbPlayerEvent.toggleSpeed(speed: $speed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleSpeedImpl &&
            (identical(other.speed, speed) || other.speed == speed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, speed);

  /// Create a copy of ApbPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleSpeedImplCopyWith<_$ToggleSpeedImpl> get copyWith =>
      __$$ToggleSpeedImplCopyWithImpl<_$ToggleSpeedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() play,
    required TResult Function() pause,
    required TResult Function() resume,
    required TResult Function() stop,
    required TResult Function() next,
    required TResult Function() prev,
    required TResult Function() replay,
    required TResult Function(Duration position) seek,
    required TResult Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )
    skip,
    required TResult Function(double speed) toggleSpeed,
    required TResult Function(LoopMode loopMode) toggleLoop,
  }) {
    return toggleSpeed(speed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? play,
    TResult? Function()? pause,
    TResult? Function()? resume,
    TResult? Function()? stop,
    TResult? Function()? next,
    TResult? Function()? prev,
    TResult? Function()? replay,
    TResult? Function(Duration position)? seek,
    TResult? Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )?
    skip,
    TResult? Function(double speed)? toggleSpeed,
    TResult? Function(LoopMode loopMode)? toggleLoop,
  }) {
    return toggleSpeed?.call(speed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function()? resume,
    TResult Function()? stop,
    TResult Function()? next,
    TResult Function()? prev,
    TResult Function()? replay,
    TResult Function(Duration position)? seek,
    TResult Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )?
    skip,
    TResult Function(double speed)? toggleSpeed,
    TResult Function(LoopMode loopMode)? toggleLoop,
    required TResult orElse(),
  }) {
    if (toggleSpeed != null) {
      return toggleSpeed(speed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Play value) play,
    required TResult Function(_Pause value) pause,
    required TResult Function(_Resume value) resume,
    required TResult Function(_Stop value) stop,
    required TResult Function(_Next value) next,
    required TResult Function(_Prev value) prev,
    required TResult Function(_Replay value) replay,
    required TResult Function(_Seek value) seek,
    required TResult Function(_Skip value) skip,
    required TResult Function(_ToggleSpeed value) toggleSpeed,
    required TResult Function(_ToggleLoop value) toggleLoop,
  }) {
    return toggleSpeed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Play value)? play,
    TResult? Function(_Pause value)? pause,
    TResult? Function(_Resume value)? resume,
    TResult? Function(_Stop value)? stop,
    TResult? Function(_Next value)? next,
    TResult? Function(_Prev value)? prev,
    TResult? Function(_Replay value)? replay,
    TResult? Function(_Seek value)? seek,
    TResult? Function(_Skip value)? skip,
    TResult? Function(_ToggleSpeed value)? toggleSpeed,
    TResult? Function(_ToggleLoop value)? toggleLoop,
  }) {
    return toggleSpeed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Play value)? play,
    TResult Function(_Pause value)? pause,
    TResult Function(_Resume value)? resume,
    TResult Function(_Stop value)? stop,
    TResult Function(_Next value)? next,
    TResult Function(_Prev value)? prev,
    TResult Function(_Replay value)? replay,
    TResult Function(_Seek value)? seek,
    TResult Function(_Skip value)? skip,
    TResult Function(_ToggleSpeed value)? toggleSpeed,
    TResult Function(_ToggleLoop value)? toggleLoop,
    required TResult orElse(),
  }) {
    if (toggleSpeed != null) {
      return toggleSpeed(this);
    }
    return orElse();
  }
}

abstract class _ToggleSpeed implements ApbPlayerEvent {
  const factory _ToggleSpeed(final double speed) = _$ToggleSpeedImpl;

  double get speed;

  /// Create a copy of ApbPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ToggleSpeedImplCopyWith<_$ToggleSpeedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleLoopImplCopyWith<$Res> {
  factory _$$ToggleLoopImplCopyWith(
    _$ToggleLoopImpl value,
    $Res Function(_$ToggleLoopImpl) then,
  ) = __$$ToggleLoopImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LoopMode loopMode});
}

/// @nodoc
class __$$ToggleLoopImplCopyWithImpl<$Res>
    extends _$ApbPlayerEventCopyWithImpl<$Res, _$ToggleLoopImpl>
    implements _$$ToggleLoopImplCopyWith<$Res> {
  __$$ToggleLoopImplCopyWithImpl(
    _$ToggleLoopImpl _value,
    $Res Function(_$ToggleLoopImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApbPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? loopMode = null}) {
    return _then(
      _$ToggleLoopImpl(
        null == loopMode
            ? _value.loopMode
            : loopMode // ignore: cast_nullable_to_non_nullable
                as LoopMode,
      ),
    );
  }
}

/// @nodoc

class _$ToggleLoopImpl implements _ToggleLoop {
  const _$ToggleLoopImpl(this.loopMode);

  @override
  final LoopMode loopMode;

  @override
  String toString() {
    return 'ApbPlayerEvent.toggleLoop(loopMode: $loopMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleLoopImpl &&
            (identical(other.loopMode, loopMode) ||
                other.loopMode == loopMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loopMode);

  /// Create a copy of ApbPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleLoopImplCopyWith<_$ToggleLoopImpl> get copyWith =>
      __$$ToggleLoopImplCopyWithImpl<_$ToggleLoopImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() play,
    required TResult Function() pause,
    required TResult Function() resume,
    required TResult Function() stop,
    required TResult Function() next,
    required TResult Function() prev,
    required TResult Function() replay,
    required TResult Function(Duration position) seek,
    required TResult Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )
    skip,
    required TResult Function(double speed) toggleSpeed,
    required TResult Function(LoopMode loopMode) toggleLoop,
  }) {
    return toggleLoop(loopMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? play,
    TResult? Function()? pause,
    TResult? Function()? resume,
    TResult? Function()? stop,
    TResult? Function()? next,
    TResult? Function()? prev,
    TResult? Function()? replay,
    TResult? Function(Duration position)? seek,
    TResult? Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )?
    skip,
    TResult? Function(double speed)? toggleSpeed,
    TResult? Function(LoopMode loopMode)? toggleLoop,
  }) {
    return toggleLoop?.call(loopMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function()? resume,
    TResult Function()? stop,
    TResult Function()? next,
    TResult Function()? prev,
    TResult Function()? replay,
    TResult Function(Duration position)? seek,
    TResult Function(
      Duration position,
      Duration duration,
      Duration skipDuration,
    )?
    skip,
    TResult Function(double speed)? toggleSpeed,
    TResult Function(LoopMode loopMode)? toggleLoop,
    required TResult orElse(),
  }) {
    if (toggleLoop != null) {
      return toggleLoop(loopMode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Play value) play,
    required TResult Function(_Pause value) pause,
    required TResult Function(_Resume value) resume,
    required TResult Function(_Stop value) stop,
    required TResult Function(_Next value) next,
    required TResult Function(_Prev value) prev,
    required TResult Function(_Replay value) replay,
    required TResult Function(_Seek value) seek,
    required TResult Function(_Skip value) skip,
    required TResult Function(_ToggleSpeed value) toggleSpeed,
    required TResult Function(_ToggleLoop value) toggleLoop,
  }) {
    return toggleLoop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Play value)? play,
    TResult? Function(_Pause value)? pause,
    TResult? Function(_Resume value)? resume,
    TResult? Function(_Stop value)? stop,
    TResult? Function(_Next value)? next,
    TResult? Function(_Prev value)? prev,
    TResult? Function(_Replay value)? replay,
    TResult? Function(_Seek value)? seek,
    TResult? Function(_Skip value)? skip,
    TResult? Function(_ToggleSpeed value)? toggleSpeed,
    TResult? Function(_ToggleLoop value)? toggleLoop,
  }) {
    return toggleLoop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Play value)? play,
    TResult Function(_Pause value)? pause,
    TResult Function(_Resume value)? resume,
    TResult Function(_Stop value)? stop,
    TResult Function(_Next value)? next,
    TResult Function(_Prev value)? prev,
    TResult Function(_Replay value)? replay,
    TResult Function(_Seek value)? seek,
    TResult Function(_Skip value)? skip,
    TResult Function(_ToggleSpeed value)? toggleSpeed,
    TResult Function(_ToggleLoop value)? toggleLoop,
    required TResult orElse(),
  }) {
    if (toggleLoop != null) {
      return toggleLoop(this);
    }
    return orElse();
  }
}

abstract class _ToggleLoop implements ApbPlayerEvent {
  const factory _ToggleLoop(final LoopMode loopMode) = _$ToggleLoopImpl;

  LoopMode get loopMode;

  /// Create a copy of ApbPlayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ToggleLoopImplCopyWith<_$ToggleLoopImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ApbPlayerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ApbPlayableAudio audio) startup,
    required TResult Function(
      ApbPlayableAudio audio,
      ApbPlayerStateStream playerStream,
    )
    loading,
    required TResult Function(
      ApbPlayableAudio audio,
      ApbPlayerStateStream playerStream,
    )
    playing,
    required TResult Function() stopped,
    required TResult Function() error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(ApbPlayableAudio audio)? startup,
    TResult? Function(
      ApbPlayableAudio audio,
      ApbPlayerStateStream playerStream,
    )?
    loading,
    TResult? Function(
      ApbPlayableAudio audio,
      ApbPlayerStateStream playerStream,
    )?
    playing,
    TResult? Function()? stopped,
    TResult? Function()? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ApbPlayableAudio audio)? startup,
    TResult Function(ApbPlayableAudio audio, ApbPlayerStateStream playerStream)?
    loading,
    TResult Function(ApbPlayableAudio audio, ApbPlayerStateStream playerStream)?
    playing,
    TResult Function()? stopped,
    TResult Function()? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Startup value) startup,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Playing value) playing,
    required TResult Function(_Stopped value) stopped,
    required TResult Function(_Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Startup value)? startup,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Playing value)? playing,
    TResult? Function(_Stopped value)? stopped,
    TResult? Function(_Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Startup value)? startup,
    TResult Function(_Loading value)? loading,
    TResult Function(_Playing value)? playing,
    TResult Function(_Stopped value)? stopped,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApbPlayerStateCopyWith<$Res> {
  factory $ApbPlayerStateCopyWith(
    ApbPlayerState value,
    $Res Function(ApbPlayerState) then,
  ) = _$ApbPlayerStateCopyWithImpl<$Res, ApbPlayerState>;
}

/// @nodoc
class _$ApbPlayerStateCopyWithImpl<$Res, $Val extends ApbPlayerState>
    implements $ApbPlayerStateCopyWith<$Res> {
  _$ApbPlayerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApbPlayerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ApbPlayerStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApbPlayerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ApbPlayerState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ApbPlayableAudio audio) startup,
    required TResult Function(
      ApbPlayableAudio audio,
      ApbPlayerStateStream playerStream,
    )
    loading,
    required TResult Function(
      ApbPlayableAudio audio,
      ApbPlayerStateStream playerStream,
    )
    playing,
    required TResult Function() stopped,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(ApbPlayableAudio audio)? startup,
    TResult? Function(
      ApbPlayableAudio audio,
      ApbPlayerStateStream playerStream,
    )?
    loading,
    TResult? Function(
      ApbPlayableAudio audio,
      ApbPlayerStateStream playerStream,
    )?
    playing,
    TResult? Function()? stopped,
    TResult? Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ApbPlayableAudio audio)? startup,
    TResult Function(ApbPlayableAudio audio, ApbPlayerStateStream playerStream)?
    loading,
    TResult Function(ApbPlayableAudio audio, ApbPlayerStateStream playerStream)?
    playing,
    TResult Function()? stopped,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Startup value) startup,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Playing value) playing,
    required TResult Function(_Stopped value) stopped,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Startup value)? startup,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Playing value)? playing,
    TResult? Function(_Stopped value)? stopped,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Startup value)? startup,
    TResult Function(_Loading value)? loading,
    TResult Function(_Playing value)? playing,
    TResult Function(_Stopped value)? stopped,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ApbPlayerState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$StartupImplCopyWith<$Res> {
  factory _$$StartupImplCopyWith(
    _$StartupImpl value,
    $Res Function(_$StartupImpl) then,
  ) = __$$StartupImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ApbPlayableAudio audio});
}

/// @nodoc
class __$$StartupImplCopyWithImpl<$Res>
    extends _$ApbPlayerStateCopyWithImpl<$Res, _$StartupImpl>
    implements _$$StartupImplCopyWith<$Res> {
  __$$StartupImplCopyWithImpl(
    _$StartupImpl _value,
    $Res Function(_$StartupImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApbPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? audio = null}) {
    return _then(
      _$StartupImpl(
        null == audio
            ? _value.audio
            : audio // ignore: cast_nullable_to_non_nullable
                as ApbPlayableAudio,
      ),
    );
  }
}

/// @nodoc

class _$StartupImpl implements _Startup {
  const _$StartupImpl(this.audio);

  @override
  final ApbPlayableAudio audio;

  @override
  String toString() {
    return 'ApbPlayerState.startup(audio: $audio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartupImpl &&
            (identical(other.audio, audio) || other.audio == audio));
  }

  @override
  int get hashCode => Object.hash(runtimeType, audio);

  /// Create a copy of ApbPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartupImplCopyWith<_$StartupImpl> get copyWith =>
      __$$StartupImplCopyWithImpl<_$StartupImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ApbPlayableAudio audio) startup,
    required TResult Function(
      ApbPlayableAudio audio,
      ApbPlayerStateStream playerStream,
    )
    loading,
    required TResult Function(
      ApbPlayableAudio audio,
      ApbPlayerStateStream playerStream,
    )
    playing,
    required TResult Function() stopped,
    required TResult Function() error,
  }) {
    return startup(audio);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(ApbPlayableAudio audio)? startup,
    TResult? Function(
      ApbPlayableAudio audio,
      ApbPlayerStateStream playerStream,
    )?
    loading,
    TResult? Function(
      ApbPlayableAudio audio,
      ApbPlayerStateStream playerStream,
    )?
    playing,
    TResult? Function()? stopped,
    TResult? Function()? error,
  }) {
    return startup?.call(audio);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ApbPlayableAudio audio)? startup,
    TResult Function(ApbPlayableAudio audio, ApbPlayerStateStream playerStream)?
    loading,
    TResult Function(ApbPlayableAudio audio, ApbPlayerStateStream playerStream)?
    playing,
    TResult Function()? stopped,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (startup != null) {
      return startup(audio);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Startup value) startup,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Playing value) playing,
    required TResult Function(_Stopped value) stopped,
    required TResult Function(_Error value) error,
  }) {
    return startup(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Startup value)? startup,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Playing value)? playing,
    TResult? Function(_Stopped value)? stopped,
    TResult? Function(_Error value)? error,
  }) {
    return startup?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Startup value)? startup,
    TResult Function(_Loading value)? loading,
    TResult Function(_Playing value)? playing,
    TResult Function(_Stopped value)? stopped,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (startup != null) {
      return startup(this);
    }
    return orElse();
  }
}

abstract class _Startup implements ApbPlayerState {
  const factory _Startup(final ApbPlayableAudio audio) = _$StartupImpl;

  ApbPlayableAudio get audio;

  /// Create a copy of ApbPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartupImplCopyWith<_$StartupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ApbPlayableAudio audio, ApbPlayerStateStream playerStream});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ApbPlayerStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApbPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? audio = null, Object? playerStream = null}) {
    return _then(
      _$LoadingImpl(
        null == audio
            ? _value.audio
            : audio // ignore: cast_nullable_to_non_nullable
                as ApbPlayableAudio,
        playerStream:
            null == playerStream
                ? _value.playerStream
                : playerStream // ignore: cast_nullable_to_non_nullable
                    as ApbPlayerStateStream,
      ),
    );
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl(this.audio, {required this.playerStream});

  @override
  final ApbPlayableAudio audio;
  @override
  final ApbPlayerStateStream playerStream;

  @override
  String toString() {
    return 'ApbPlayerState.loading(audio: $audio, playerStream: $playerStream)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            (identical(other.audio, audio) || other.audio == audio) &&
            (identical(other.playerStream, playerStream) ||
                other.playerStream == playerStream));
  }

  @override
  int get hashCode => Object.hash(runtimeType, audio, playerStream);

  /// Create a copy of ApbPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ApbPlayableAudio audio) startup,
    required TResult Function(
      ApbPlayableAudio audio,
      ApbPlayerStateStream playerStream,
    )
    loading,
    required TResult Function(
      ApbPlayableAudio audio,
      ApbPlayerStateStream playerStream,
    )
    playing,
    required TResult Function() stopped,
    required TResult Function() error,
  }) {
    return loading(audio, playerStream);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(ApbPlayableAudio audio)? startup,
    TResult? Function(
      ApbPlayableAudio audio,
      ApbPlayerStateStream playerStream,
    )?
    loading,
    TResult? Function(
      ApbPlayableAudio audio,
      ApbPlayerStateStream playerStream,
    )?
    playing,
    TResult? Function()? stopped,
    TResult? Function()? error,
  }) {
    return loading?.call(audio, playerStream);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ApbPlayableAudio audio)? startup,
    TResult Function(ApbPlayableAudio audio, ApbPlayerStateStream playerStream)?
    loading,
    TResult Function(ApbPlayableAudio audio, ApbPlayerStateStream playerStream)?
    playing,
    TResult Function()? stopped,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(audio, playerStream);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Startup value) startup,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Playing value) playing,
    required TResult Function(_Stopped value) stopped,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Startup value)? startup,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Playing value)? playing,
    TResult? Function(_Stopped value)? stopped,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Startup value)? startup,
    TResult Function(_Loading value)? loading,
    TResult Function(_Playing value)? playing,
    TResult Function(_Stopped value)? stopped,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ApbPlayerState {
  const factory _Loading(
    final ApbPlayableAudio audio, {
    required final ApbPlayerStateStream playerStream,
  }) = _$LoadingImpl;

  ApbPlayableAudio get audio;
  ApbPlayerStateStream get playerStream;

  /// Create a copy of ApbPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlayingImplCopyWith<$Res> {
  factory _$$PlayingImplCopyWith(
    _$PlayingImpl value,
    $Res Function(_$PlayingImpl) then,
  ) = __$$PlayingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ApbPlayableAudio audio, ApbPlayerStateStream playerStream});
}

/// @nodoc
class __$$PlayingImplCopyWithImpl<$Res>
    extends _$ApbPlayerStateCopyWithImpl<$Res, _$PlayingImpl>
    implements _$$PlayingImplCopyWith<$Res> {
  __$$PlayingImplCopyWithImpl(
    _$PlayingImpl _value,
    $Res Function(_$PlayingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApbPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? audio = null, Object? playerStream = null}) {
    return _then(
      _$PlayingImpl(
        null == audio
            ? _value.audio
            : audio // ignore: cast_nullable_to_non_nullable
                as ApbPlayableAudio,
        playerStream:
            null == playerStream
                ? _value.playerStream
                : playerStream // ignore: cast_nullable_to_non_nullable
                    as ApbPlayerStateStream,
      ),
    );
  }
}

/// @nodoc

class _$PlayingImpl implements _Playing {
  const _$PlayingImpl(this.audio, {required this.playerStream});

  @override
  final ApbPlayableAudio audio;
  @override
  final ApbPlayerStateStream playerStream;

  @override
  String toString() {
    return 'ApbPlayerState.playing(audio: $audio, playerStream: $playerStream)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayingImpl &&
            (identical(other.audio, audio) || other.audio == audio) &&
            (identical(other.playerStream, playerStream) ||
                other.playerStream == playerStream));
  }

  @override
  int get hashCode => Object.hash(runtimeType, audio, playerStream);

  /// Create a copy of ApbPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayingImplCopyWith<_$PlayingImpl> get copyWith =>
      __$$PlayingImplCopyWithImpl<_$PlayingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ApbPlayableAudio audio) startup,
    required TResult Function(
      ApbPlayableAudio audio,
      ApbPlayerStateStream playerStream,
    )
    loading,
    required TResult Function(
      ApbPlayableAudio audio,
      ApbPlayerStateStream playerStream,
    )
    playing,
    required TResult Function() stopped,
    required TResult Function() error,
  }) {
    return playing(audio, playerStream);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(ApbPlayableAudio audio)? startup,
    TResult? Function(
      ApbPlayableAudio audio,
      ApbPlayerStateStream playerStream,
    )?
    loading,
    TResult? Function(
      ApbPlayableAudio audio,
      ApbPlayerStateStream playerStream,
    )?
    playing,
    TResult? Function()? stopped,
    TResult? Function()? error,
  }) {
    return playing?.call(audio, playerStream);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ApbPlayableAudio audio)? startup,
    TResult Function(ApbPlayableAudio audio, ApbPlayerStateStream playerStream)?
    loading,
    TResult Function(ApbPlayableAudio audio, ApbPlayerStateStream playerStream)?
    playing,
    TResult Function()? stopped,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (playing != null) {
      return playing(audio, playerStream);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Startup value) startup,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Playing value) playing,
    required TResult Function(_Stopped value) stopped,
    required TResult Function(_Error value) error,
  }) {
    return playing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Startup value)? startup,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Playing value)? playing,
    TResult? Function(_Stopped value)? stopped,
    TResult? Function(_Error value)? error,
  }) {
    return playing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Startup value)? startup,
    TResult Function(_Loading value)? loading,
    TResult Function(_Playing value)? playing,
    TResult Function(_Stopped value)? stopped,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (playing != null) {
      return playing(this);
    }
    return orElse();
  }
}

abstract class _Playing implements ApbPlayerState {
  const factory _Playing(
    final ApbPlayableAudio audio, {
    required final ApbPlayerStateStream playerStream,
  }) = _$PlayingImpl;

  ApbPlayableAudio get audio;
  ApbPlayerStateStream get playerStream;

  /// Create a copy of ApbPlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayingImplCopyWith<_$PlayingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StoppedImplCopyWith<$Res> {
  factory _$$StoppedImplCopyWith(
    _$StoppedImpl value,
    $Res Function(_$StoppedImpl) then,
  ) = __$$StoppedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StoppedImplCopyWithImpl<$Res>
    extends _$ApbPlayerStateCopyWithImpl<$Res, _$StoppedImpl>
    implements _$$StoppedImplCopyWith<$Res> {
  __$$StoppedImplCopyWithImpl(
    _$StoppedImpl _value,
    $Res Function(_$StoppedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApbPlayerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StoppedImpl implements _Stopped {
  const _$StoppedImpl();

  @override
  String toString() {
    return 'ApbPlayerState.stopped()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StoppedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ApbPlayableAudio audio) startup,
    required TResult Function(
      ApbPlayableAudio audio,
      ApbPlayerStateStream playerStream,
    )
    loading,
    required TResult Function(
      ApbPlayableAudio audio,
      ApbPlayerStateStream playerStream,
    )
    playing,
    required TResult Function() stopped,
    required TResult Function() error,
  }) {
    return stopped();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(ApbPlayableAudio audio)? startup,
    TResult? Function(
      ApbPlayableAudio audio,
      ApbPlayerStateStream playerStream,
    )?
    loading,
    TResult? Function(
      ApbPlayableAudio audio,
      ApbPlayerStateStream playerStream,
    )?
    playing,
    TResult? Function()? stopped,
    TResult? Function()? error,
  }) {
    return stopped?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ApbPlayableAudio audio)? startup,
    TResult Function(ApbPlayableAudio audio, ApbPlayerStateStream playerStream)?
    loading,
    TResult Function(ApbPlayableAudio audio, ApbPlayerStateStream playerStream)?
    playing,
    TResult Function()? stopped,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (stopped != null) {
      return stopped();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Startup value) startup,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Playing value) playing,
    required TResult Function(_Stopped value) stopped,
    required TResult Function(_Error value) error,
  }) {
    return stopped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Startup value)? startup,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Playing value)? playing,
    TResult? Function(_Stopped value)? stopped,
    TResult? Function(_Error value)? error,
  }) {
    return stopped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Startup value)? startup,
    TResult Function(_Loading value)? loading,
    TResult Function(_Playing value)? playing,
    TResult Function(_Stopped value)? stopped,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (stopped != null) {
      return stopped(this);
    }
    return orElse();
  }
}

abstract class _Stopped implements ApbPlayerState {
  const factory _Stopped() = _$StoppedImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ApbPlayerStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApbPlayerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl();

  @override
  String toString() {
    return 'ApbPlayerState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ApbPlayableAudio audio) startup,
    required TResult Function(
      ApbPlayableAudio audio,
      ApbPlayerStateStream playerStream,
    )
    loading,
    required TResult Function(
      ApbPlayableAudio audio,
      ApbPlayerStateStream playerStream,
    )
    playing,
    required TResult Function() stopped,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(ApbPlayableAudio audio)? startup,
    TResult? Function(
      ApbPlayableAudio audio,
      ApbPlayerStateStream playerStream,
    )?
    loading,
    TResult? Function(
      ApbPlayableAudio audio,
      ApbPlayerStateStream playerStream,
    )?
    playing,
    TResult? Function()? stopped,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ApbPlayableAudio audio)? startup,
    TResult Function(ApbPlayableAudio audio, ApbPlayerStateStream playerStream)?
    loading,
    TResult Function(ApbPlayableAudio audio, ApbPlayerStateStream playerStream)?
    playing,
    TResult Function()? stopped,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Startup value) startup,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Playing value) playing,
    required TResult Function(_Stopped value) stopped,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Startup value)? startup,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Playing value)? playing,
    TResult? Function(_Stopped value)? stopped,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Startup value)? startup,
    TResult Function(_Loading value)? loading,
    TResult Function(_Playing value)? playing,
    TResult Function(_Stopped value)? stopped,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ApbPlayerState {
  const factory _Error() = _$ErrorImpl;
}
