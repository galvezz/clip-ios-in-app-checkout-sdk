//
//  ViewController.m
//  clip-in-app-checkout-example
//
//  Created by Brandon Roth on 4/29/14.
//  Copyright (c) 2014 Payclip. All rights reserved.
//

#import "ViewController.h"
#import "ClipWidget.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor grayColor];

    UIImage *image = [UIImage imageNamed:@"icon-merchant-logo"];

    ClipWidget *widget = [[ClipWidget alloc] initWithAccessToken:@"I1heu-9TV9HAqnEXyYR_x___mt-dB6FQIQie1ieiyL8"
                                                          userID:@"kumar-startbucks1"
                                                          uToken:@"ksdafkljdsakjfso3edsfs"
                                                    chargeAmount:[NSDecimalNumber decimalNumberWithString:@"55.99"]
                                                         appIcon:image
                                                         appName:@"Foo App"
                                                        delegate:self];

    //Uncomment this line when building for release
    //[widget setDebugModeOn:NO];

    [widget setup];
    [widget setColorScheme:PCWidgetColorSchemeDark];

    //grab the view for immediate display even though it may not be ready yet and will show an activity indicator
    UIView *view = widget.widgetView;

    //set the frame and add the widgets view
    view.frame = CGRectMake(20, 100, 280, 205);
    view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)clipWidget:(ClipWidget *)widget paymentFinishedWithTransactionId:(NSString *)transactionId
{
    NSLog(@"Transaction Id: %@", transactionId);
}

- (void)clipWidgetPaymentCanceled:(ClipWidget *)widget
{
    NSLog(@"User Canceled");
}

- (void)clipWidget:(ClipWidget *)widget dismissedWithError:(NSError *)error
{
    NSLog(@"dismissed with error: %@", error);
}

- (void)clipWidget:(ClipWidget *)widget setupDidFailWithError:(NSError *)error
{
    NSLog(@"Setup failed With Error: %@", error);
}

@end
