clip-ios-in-app-checkout-sdk
============================

iOS SDK to invoke Clip payment flow for CNP transactions. 

The checkout SDK is also know as the Mobile Payments Library (MPL)

### Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C projects which automates and simplifies installation of third party libraries.

#### Podfile

```ruby
platform :ios, '6.0'
pod pod 'ClipSDK', :git => 'https://github.com/ClipMX/clip-ios-in-app-checkout-sdk.git', '~> 0.0.1'
```

### Manual Installation

* Copy the files from the MPL folder into your project.
* In your project file select your build target.  Then select select the 'Build Phases' tab then select the 'Link Binary With Libraries' drop down.  Use the '+' icon to add the following frameworks
 - `CoreLocation`
 - `Core Graphics`
 - `Security`
 - `System configuration`
 - `Mobile Core Services`
* From your project file select the 'Build Settings' tab.  Search for 'Other Linker Flags' and add -Objc to it.  This is to ensure categories are loaded corectly.  

### Widget setup

To create a Clip widget two init methods are provided, one with a delegate and one without.  The appIcon and appName parameters are optional and if provided wil be displayed during a keyed entered flow.  The provided image should be 31x31.

```objective-c
    ClipWidget *widget = [[ClipWidget alloc] initWithAccessToken:@"your access token"
                                                          userID:@"your users id"
                                                          uToken:@"user token"
                                                    chargeAmount:[NSDecimalNumber decimalNumberWithString:@"1.99"]
                                                         appIcon:nil
                                                         appName:@"Foo app"
                                                        delegate:self];
```

After a wiget is initialized it performs an api call to fetch any saved cards and the widgets view may or may not be ready immediately.  You can access the widgets view via the widgetView property.  The view will display an activity indicator untill its api call is complete.  The view requires a size of at least 280x200 (set automatically) to be displayed correctly however you can position it as you like in your view.

```objectiv-c
    UIView *view = widget.widgetView;
    view.center = self.view.center;
    [self.view addSubview:view];
```
    
### Example

See the folder clip-in-app-checkout-example for an example project that was setup up using the manual installation instructions.  
