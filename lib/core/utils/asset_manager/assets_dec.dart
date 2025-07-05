// ignore_for_file: non_constant_identifier_names

part of 'asset_manager.dart';

abstract class AssetManager {
  static final _assetManager = _AssetManager();

  static final logo = _assetManager.getSvgAsset('logo.svg');
  static final logoSecondary = _assetManager.getSvgAsset('logo_2.svg');

  static final cameraBg = _assetManager.getSvgAsset('camera_bg.svg');
  static final chatIcon = _assetManager.getSvgAsset('chat_icon.svg');
  static final chatIconFilled =
      _assetManager.getSvgAsset('chat_icon_filled.svg');

  static final ellipses = _assetManager.getSvgAsset('ellipses.svg');
  static final emptyState = _assetManager.getSvgAsset('empty_state.svg');
  static final videos_empty_state = _assetManager.getSvgAsset(
    'videos_empty.svg',
  );
  static final transaction_empty_state = _assetManager.getSvgAsset(
    'transaction_empty.svg',
  );

  static final download_empty_state = _assetManager.getSvgAsset(
    'download_empty.svg',
  );
  static final memory_empty_state = _assetManager.getSvgAsset(
    'memory_empty.svg',
  );
  static final errorState = _assetManager.getSvgAsset('error_state.svg');

  static final tree = _assetManager.getSvgAsset(
    'tree_icon.svg',
    width: 14,
  );
  static final location = _assetManager.getSvgAsset(
    'location.svg',
    width: 14,
  );

  static final shareIcon = _assetManager.getSvgAsset(
    'share_icon.svg',
    width: 20,
  );

  static final downloadIcon = _assetManager.getSvgAsset(
    'download_icon.svg',
    width: 20,
  );

  static final location_alt = _assetManager.getSvgAsset('location_alt.svg');
  static final location_empty = _assetManager.getSvgAsset('location_empty.svg');

  static final videoCamera = _assetManager.getSvgAsset('video-02.svg');
  static final volumeHigh = _assetManager.getSvgAsset('volume-high.svg');

  static final success = _assetManager.getSvgAsset('success.svg');

  static final google = _assetManager.getSvgAsset('google.svg');
  static final apple = _assetManager.getSvgAsset('apple.svg');

  static final dropBox = _assetManager.getSvgAsset('drop_box.svg');
  static final help = _assetManager.getSvgAsset('help.svg');
  static final globe = _assetManager.getSvgAsset('globe.svg');
  static final bell = _assetManager.getSvgAsset('bell.svg');
  static final lock = _assetManager.getSvgAsset('lock.svg');
  static final profile = _assetManager.getSvgAsset('profile.svg');
  static final download = _assetManager.getSvgAsset('download.svg');
  static final logout = _assetManager.getSvgAsset('logout.svg');

  static final picture = _assetManager.getSvgAsset('picture.svg');
  static final picture_active = _assetManager.getSvgAsset('picture_active.svg');
  static final videos = _assetManager.getSvgAsset('video.svg');
  static final videos_active = _assetManager.getSvgAsset('video_active.svg');

  static final onboarding_1 = _assetManager.getImageAsset('onboarding_1.jpeg');
  static final onboarding_2 = _assetManager.getImageAsset('onboarding_2.jpeg');
  static final onboarding_3 = _assetManager.getImageAsset('onboarding_3.jpeg');

  static final create_memory = _assetManager.getSvgAsset('create_memory.svg');

  static final home_default = _assetManager.getSvgAsset('home_default.svg');
  static final home_active = _assetManager.getSvgAsset('home_active.svg');

  static final profile_active = _assetManager.getSvgAsset('profile_active.svg');
  static final profile_default =
      _assetManager.getSvgAsset('profile_default.svg');

  static final recent_default = _assetManager.getSvgAsset('recent_default.svg');
  static final recent_active = _assetManager.getSvgAsset('recent_active.svg');

  static final memories_default =
      _assetManager.getSvgAsset('memories_default.svg');
  static final memories_active =
      _assetManager.getSvgAsset('memories_active.svg');

  // V2 Assets`
  static final home_bg = _assetManager.getImageAsset('home-bg.jpeg');
  static final hambugger = _assetManager.getSvgAsset('hambugger.svg');
}
