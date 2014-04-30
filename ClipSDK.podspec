Pod::Spec.new do |s|
  s.name         = 'ClipSDK'
  s.version      = "0.0.1"
  s.summary      = "A short description of clip-mpl."
  s.description  = "Clip mobile payment library"
  s.homepage     = "http://www.payclip.com"
  s.license      = { :type => "Commercial", :text => "License text goes here" }
  s.author    = "Payclip"
  s.platform     = :ios, "6.0"

  #when we have a place to serve the sdk from we must change this
  #For now you can serve it locally by going to the directory of the zip and podspec file and type
  s.source = { :git => 'https://github.com/ClipMX/clip-ios-in-app-checkout-sdk.git' }

  s.platform = :ios
  s.source_files = 'MPL/**/*.h'
  s.resource = "MPL/**/*.bundle"
  s.preserve_paths = 'MPL/**/*.a'
  s.library = 'clip-ios-checkout-mpl_v0_0_1'
  s.xcconfig = { 'LIBRARY_SEARCH_PATHS' => '"$(PODS_ROOT)/ClipSDK/MPL"' }
  s.frameworks = 'MobileCoreServices', 'SystemConfiguration', 'Security', 'CoreGraphics', 'CoreLocation'
  s.requires_arc = true
end
