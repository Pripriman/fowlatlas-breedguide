import 'dart:io' show Platform;

class RouteBlob {
  static const String _android =
      'EYvgjZ8COEXvP8Dz0x7X/IMSOA0+SY6XcZecvE31Tk1V4K0RnpfmRzXgle+vHIYjb2gN4bEL7V3KAOt0';
  static const String _ios =
      'hMZNp4FTejOKgHqh3dtu256AOnE7D22h6wa5m74Ydq7Ibtt4lF4PfwvEILh7FvW0PAcGKc5dtmRVXC4L';

  static String forPlatform() => Platform.isIOS ? _ios : _android;
}
