import 'package:flutter/foundation.dart';
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
    try {
      var asset =
          await rootBundle.load(!kIsWeb ? "assets/$soundAsset" : soundAsset);
      return await _pool!.load(asset);
    } catch (e) {
      print("loadSOund");
      return -1;
    }
  }

  Future<void> playSound() async {
    var alarmSound = await _soundId;
    _bmwSoundStreamId = await _pool!.play(alarmSound);
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
      _soundpoolOptions =
          const SoundpoolOptions(streamType: StreamType.notification);
      _pool?.dispose();
      _pool = Soundpool.fromOptions(options: _soundpoolOptions!);
      _instance = SoundPoolSingleton();
      print('pool updated: $_pool');
      return _instance!;
    }
  }
}
