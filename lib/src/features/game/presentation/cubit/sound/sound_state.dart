part of 'sound_cubit.dart';

class SoundState extends Equatable {
  final bool muted;
  const SoundState({
    required this.muted,
  });

  factory SoundState.initial() => const SoundState(muted: false);

  @override
  String toString() => 'SoundState(muted: $muted)';

  @override
  List<Object> get props => [muted];

  SoundState copyWith({
    bool? muted,
  }) {
    return SoundState(
      muted: muted ?? this.muted,
    );
  }
}
