import 'dart:io';

String fullRepoFolderPath(String parentFolder, String repoFolder) {
  return '${parentFolder.replaceAll(RegExp(r'[\\\/]$'), '')}${Platform.pathSeparator}$repoFolder';
}

bool isSupportedGitUrl(String url) {
  return url.startsWith('https://') ||
      url.startsWith('http://') ||
      url.startsWith('git://');
}
