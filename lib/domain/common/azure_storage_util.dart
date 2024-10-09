import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:shareinfo/infrastructure/env/env.dart';
import 'package:shareinfo/presentation/root_widget.dart';

String? encryptedUserName1(String email) {
  final plainText = email;
  //if (plainText == null) return null;

  // Make secret key
  final key = Key.fromUtf8(Env().secretKey32);
  final iv = IV.fromUtf8(Env().secretKey16);

  // Encrypt key in followed by cbs algorithm
  final encrypter = Encrypter(AES(key, mode: AESMode.cbc));

  final encrypted = encrypter.encrypt(plainText, iv: iv);

  // Combine IV and encrypted data
  final encryptedWithIv = iv.bytes + encrypted.bytes;

  // Return URL-safe base64 string
  return base64UrlEncode(encryptedWithIv);
}

String generateSASUrl(
  String dirPath,
  String fileName, {
  required String containerName,
  required int hour,
  required String signedPermissions,
}) {
  var sasToken = generateSasToken(
    accountKey: Env().signingKey1,
    containerName: containerName,
    hour: hour,
    signedPermissions: signedPermissions,
  );
  final userId = encryptedUserName();
  return '${Env().azureStorageUrl}$containerName/$userId$dirPath$fileName$sasToken';
}

void updatingSASToken() {
  if (auth.authInfo.value.email == null) return;
  //final today = DateTime.now();

  /// Expire time for SAS url
  // final expireDay = today.add(const Duration(days: 7));

  // final expTime = settingsLogic.blobExpireDate.value;
  // final sas = settingsLogic.sasToken.value;

  // if (expireDay.isAfter(today) || expTime == null || sas == null) {
  //   /// Store sas expire date into local storage
  //   settingsLogic.blobExpireDate.value = expireDay.toString();

  /// Generate SAS token
  String sasToken = generateSasToken(
    accountKey: Env().signingKey1,
    containerName: BlobDir.candidate,
    hour: 1 * 24,
    signedPermissions: 'r',
  );

  /// Store sas token into local storage
  settingsLogic.sasToken.value = sasToken;
  //}
}

String generateImageUrl(String? imageName) {
  return imageName == null
      ? ''
      : generateSASUrl(
          BlobDir.userProfile,
          imageName.split('/').last,
          containerName: BlobDir.candidate,
          hour: 24,
          signedPermissions: 'r',
        );
}

class BlobDir {
  static const String candidate = 'candidate';
  static const String userProfile = '/user-profile/';
  static const String studentId = '/student-id/';
  static const String certificate = '/certification-license-media/';
  static const String cvResume = '/cv-resume-media/';
  static const String education = '/education-media/';
  static const String organizationActivities =
      '/organization-activities-media/';
  static const String projects = '/projects-media/';
  static const String workExperience = '/work-experience-media/';
}

String? encryptedUserName() {
  final plainText = auth.authInfo.value.email;
  if (plainText == null) return null;

  // Make secret key
  final key = Key.fromUtf8(Env().secretKey32);
  final iv = IV.fromUtf8(Env().secretKey16);

  // Encrypt key in followed by cbs algorithm
  final encrypter = Encrypter(AES(key, mode: AESMode.cbc));

  final encrypted = encrypter.encrypt(plainText, iv: iv);

  // Combine IV and encrypted data
  final encryptedWithIv = iv.bytes + encrypted.bytes;

  // Return URL-safe base64 string
  return base64UrlEncode(encryptedWithIv);
}

String profileUrl() {
  final userId = encryptedUserName();
  return '${Env().azureStorageUrl}${BlobDir.candidate}/$userId${auth.authInfo.value.profilePhoto}${settingsLogic.sasToken.value}';
}

String generateSasToken({
  required String accountKey,
  required String containerName,
  required int hour,
  required String signedPermissions,
}) {
  final DateTime startTime = DateTime.now().toUtc();
  final DateTime expiryTime = startTime.add(Duration(hours: hour));

  const String accountName =
      Env.kDebugMode ? 'shareinfodevstorage' : 'shareinfo';
  const String signedResource = 'c'; // 'c' for container
  const String signedVersion = '2022-11-02'; // API version
  const String signedProtocol = 'https';

  // Updated canonicalized Resource format for API versions 2015-02-21 and later
  final String canonicalizedResource = '/blob/$accountName/$containerName';

  final String stringToSign = '$signedPermissions\n'
      '${startTime.toIso8601String().split('.')[0]}Z\n'
      '${expiryTime.toIso8601String().split('.')[0]}Z\n'
      '$canonicalizedResource\n'
      '\n'
      '\n'
      '$signedProtocol\n'
      '$signedVersion\n'
      '$signedResource\n'
      '\n'
      '\n'
      '\n'
      '\n'
      '\n'
      '\n';
  // Decode the account key from base64
  List<int> decodedKey = base64.decode(accountKey);

  // Sign the string with the key using HMAC-SHA256
  Hmac hmacSha256 = Hmac(sha256, decodedKey);
  Digest signature = hmacSha256.convert(utf8.encode(stringToSign));

  // Encode the signature as base64 and URL-encode it
  String encodedSignature = Uri.encodeComponent(base64.encode(signature.bytes));

  // Construct the SAS token
  return '?sp=$signedPermissions&st=${startTime.toIso8601String().split('.')[0]}Z&se=${expiryTime.toIso8601String().split('.')[0]}Z&spr=https&sv=$signedVersion&sr=c&sig=$encodedSignature';
}

String generateUniqueFileName(String prefix) {
  // Get the current timestamp in milliseconds since epoch
  int timestamp = DateTime.now().millisecondsSinceEpoch;

  // Generate a random number
  int randomValue = Random().nextInt(1000000);

  // Combine prefix, timestamp, and random value to create a unique file name
  String uniqueFileName = '$prefix-$timestamp-$randomValue.pdf';

  return uniqueFileName;
}
