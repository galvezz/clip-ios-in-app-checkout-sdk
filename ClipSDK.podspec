Pod::Spec.new do |s|
  s.name         = 'ClipSDK'
  s.version      = "0.0.1"
  s.summary      = "Process CNP (card not present) transactions via Clip"
  s.description  = "IOS SDK (MPL) to invoke Clip payment flor for CNP transactions"
  s.homepage     = "http://www.payclip.com"
  s.license      = { :type => "Commercial", :file => "LICENSE.md" }
  s.author    = "Payclip"
  s.platform     = :ios, "6.0"
  s.source = { :git => 'https://github.com/ClipMX/clip-ios-in-app-checkout-sdk.git', :tag => s.version.to_s }
  s.platform = :ios
  s.source_files = 'MPL/**/*.h'
  s.resource = "MPL/**/*.bundle"
  s.preserve_paths = 'MPL/**/*.a'
  s.library = 'clip-ios-checkout-mpl_v0_0_1'
  s.xcconfig = { 'LIBRARY_SEARCH_PATHS' => '"$(PODS_ROOT)/ClipSDK/MPL"' }
  s.frameworks = 'MobileCoreServices', 'SystemConfiguration', 'Security', 'CoreGraphics', 'CoreLocation'
  s.requires_arc = true
end
