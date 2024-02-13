import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class DeviceInfo {
  static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  static Map<String, dynamic> _deviceData = <String, dynamic>{};

  static Future<String> getInfo() async {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        _deviceData = _readAndroidBuildData(await _deviceInfo.androidInfo);
        break;
      case TargetPlatform.iOS:
        _deviceData = _readIosDeviceInfo(await _deviceInfo.iosInfo);
        break;
      default:
      // Handle other platforms if needed
    }
    String key = "";
    for (String k in _deviceData.keys) {
      key += k + "_";
    }
    return key;
  }

  static Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'brand': build.brand,
      'device': build.device,
      'host': build.host,
      'id': build.id,
      'model': build.model,
      'product': build.product,
      'serialNumber': build.serialNumber,
    };
  }

  static Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }
}
