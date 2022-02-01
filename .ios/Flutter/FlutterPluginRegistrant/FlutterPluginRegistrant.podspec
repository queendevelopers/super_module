#
# Generated file, do not edit.
#

Pod::Spec.new do |s|
  s.name             = 'FlutterPluginRegistrant'
  s.version          = '0.0.1'
  s.summary          = 'Registers plugins with your flutter app'
  s.description      = <<-DESC
Depends on all your plugins, and provides a function to register them.
                       DESC
  s.homepage         = 'https://flutter.dev'
  s.license          = { :type => 'BSD' }
  s.author           = { 'Flutter Dev Team' => 'flutter-dev@googlegroups.com' }
  s.ios.deployment_target = '9.0'
  s.source_files =  "Classes", "Classes/**/*.{h,m}"
  s.source           = { :path => '.' }
  s.public_header_files = './Classes/**/*.h'
  s.static_framework    = true
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.dependency 'Flutter'
  s.dependency 'firebase_core'
  s.dependency 'firebase_messaging'
  s.dependency 'flutter_facebook_auth'
  s.dependency 'flutter_image_compress'
  s.dependency 'flutter_local_notifications'
  s.dependency 'flutter_secure_storage'
  s.dependency 'google_sign_in'
  s.dependency 'image_picker'
  s.dependency 'local_auth'
  s.dependency 'path_provider_ios'
  s.dependency 'permission_handler'
  s.dependency 'shared_preferences_ios'
  s.dependency 'sign_in_with_apple'
  s.dependency 'sqflite'
  s.dependency 'url_launcher_ios'
end
