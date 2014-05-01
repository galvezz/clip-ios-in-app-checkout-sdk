//
//  ClipWidget.h
//  clip-ios-checkout-mpl
//
//  Created by Brandon Roth on 4/4/14.
//  Copyright (c) 2014 Payclip. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class ClipWidget;

typedef NS_ENUM(NSInteger, PCWidgetColorScheme) {
    PCWidgetColorSchemeDark,
    PCWidgetColorSchemeLight
};

typedef NS_ENUM(NSInteger, ClipWidgetError) {
    ClipWidgetErrorPaymentError = 100,
    ClipWidgetErrorPaymentDeclined = 101,
    ClipWidgetErrorPinVerificationFailed = 102,
    ClipWidgetErrorLimitCheckFailed = 103,
    ClipWidgetErrorSetupTimedOut = 104
};

@protocol ClipWidgetDelegate <NSObject>

@optional

/**
 *  Informs the receiver that the view for the widget is ready for use
 *  @param widget
 *  @param view
 */
- (void)clipWidget:(ClipWidget *)widget widgetViewReady:(UIView *)view;

/**
 *  Informs the receiver that the widget has finished payment and provides the receipt so that it can be verified.
 *
 *  @param widget
 *  @param receipt
 */
- (void)clipWidget:(ClipWidget *)widget paymentFinishedWithTransactionId:(NSString *)transactionId;

/**
 *  Informs the receiver that an error occured, dismissing the payment flow.
 *
 *  @param widget
 *  @param error
 */
- (void)clipWidget:(ClipWidget *)widget dismissedWithError:(NSError *)error;

/**
 *  Informs the reciever that the user canceled the payment flow
 */
- (void)clipWidgetPaymentCanceled:(ClipWidget *)widget;

/**
 *  Informs the delegate that an error occured while trying to fetch card profiles during setup
 *
 *  @param widget
 *  @param error
 */
- (void)clipWidget:(ClipWidget *)widget setupDidFailWithError:(NSError *)error;

@end

@interface ClipWidget : NSObject

@property (weak, nonatomic) id<ClipWidgetDelegate> delegate;

/**
 *  A property indicating if the view has been setup and is usable.
 */
@property (assign, nonatomic, readonly) BOOL viewReady;

/**
 *  Sets the color scheme on the clip widget view.  The default is PCWidgetColorSchemeDark
 */
@property (assign, nonatomic) PCWidgetColorScheme colorScheme;

/**
 *  This method sets up the payment widget with a provided delegate to alert the caller when the widgets view is ready to be used.
 *  Until it's ready the view will be disabled and show an activity indicator.
 *
 *  @param token        Api access token
 *  @param userID       wallet user id
 *  @param uToken       wallet user token
 *  @param chargeAmount amount to be charged
 *  @param icon         The icon to show during a manual entry screen.  The prefered size for the icon is 31x31
 *  @param name         The display name for your app
 *
 *  @return A clip widget object that can be used to manage the payment life cycle.
 */
- (instancetype)initWithAccessToken:(NSString *)token
                             userID:(NSString *)userID
                             uToken:(NSString *)uToken
                       chargeAmount:(NSDecimalNumber *)chargeAmount
                            appIcon:(UIImage *)icon
                            appName:(NSString *)name;


/**
 *  This method sets up the payment widget with a provided delegate to alert the caller when the widgets view is ready to be used.
 *  Until it's ready the view will be disabled and show an activity indicator.
 *
 *  @param token        Api access token
 *  @param userID       wallet user id
 *  @param uToken       wallet user token
 *  @param chargeAmount amount to be charged
 *  @param delegate     the object to be notified when payment events take place
 *  @param icon         The icon to show during a manual entry screen.  The prefered size for the icon is 31x31
 *  @param name         The display name for your app
 *
 *  @return A clip widget object that can be used to manage the payment life cycle.
 */
- (instancetype)initWithAccessToken:(NSString *)token
                             userID:(NSString *)userID
                             uToken:(NSString *)uToken
                       chargeAmount:(NSDecimalNumber *)chargeAmount
                            appIcon:(UIImage *)icon
                            appName:(NSString *)name
                           delegate:(id)delegate;

/**
 *  The view for the clip widget and is not available immediately.  This view will display an activity indicator an buttons disabled until setup is complete.
 *
 *  @return The view for the widget
 */
- (UIView *)widgetView;

/**
 *  Tells the widget to abort it's flow and dismiss.
 */
- (void)cancelAndDismiss;

/**
 *  If setup of the widget view fails then setup can be retryed with this method
 */
- (void)retrySetup;

@end