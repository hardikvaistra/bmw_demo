import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class SoundPoolSingleton {
  static SoundPoolSingleton? _instance;

  static SoundPoolSingleton get instance => _init();
  static Soundpool? _pool;
  static SoundpoolOptions? _soundpoolOptions;

  int? _bmwSoundStreamId;
  late Future<int> _soundId;

  void loadSound({required String soundAsset}) {
    _soundId = _loadSound(soundAsset);
  }

  Future<int> _loadSound(String soundAsset) async {
    var asset = await rootBundle.load(soundAsset);
    return await _pool!.load(asset);
  }

  Future<void> playSound() async {
    var alarmSound = await _soundId;
    _bmwSoundStreamId = await _pool!.play(alarmSound);
    await Future.delayed(const Duration(milliseconds: 800));
  }

  Future<void> stopSound() async {
    if (_bmwSoundStreamId != null) {
      await _pool!.stop(_bmwSoundStreamId!);
    }
  }

  static SoundPoolSingleton _init() {
    if (_instance != null) {
      return _instance!;
    } else {
      _soundpoolOptions = const SoundpoolOptions();
      _pool?.dispose();
      _pool = Soundpool.fromOptions(options: _soundpoolOptions!);
      _instance = SoundPoolSingleton();
      return _instance!;
    }
  }
}
