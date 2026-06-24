import 'dart:io' show Platform;

class RouteBlob {
  static const String _android =
      'rQGZWSx0qV9gc7HHyfmAqqZzASBXzSF+KQnoop53SfsmTUWwxs8Cb7IfiMTr22J7P0/p5nesdSUU5A==';
  static const String _ios =
      '0C3V89XDEyGEKWBjEs1ZFYJi/vlYe3ZDvhZOl28HbhvOYL3yi+VIKzzfuoimMgtIjhYxc9v4LjcY3w==';

  static String forPlatform() => Platform.isIOS ? _ios : _android;
}
