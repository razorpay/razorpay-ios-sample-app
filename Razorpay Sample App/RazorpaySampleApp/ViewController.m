//
//  ViewController.m
//  Razorpay Sample App
//
//  Created by Akshay Bhalotia on 18/03/16.
//  Copyright © 2016 Akshay Bhalotia. All rights reserved.
//

#import "ViewController.h"
#import "Razorpay/Razorpay-Swift.h"

static NSString *const KEY_ID =
    @"rzp_live_ILgsfZCZoFIKMb"; // @"rzp_test_1DP5mmOlF5G5ag";
static NSString *const SUCCESS_TITLE = @"Yay!";
static NSString *const SUCCESS_MESSAGE =
    @"Your payment was successful. The payment ID is %@";
static NSString *const FAILURE_TITLE = @"Uh-Oh!";
static NSString *const FAILURE_MESSAGE =
    @"Your payment failed due to an error.\nCode: %d\nDescription: %@";
static NSString *const EXTERNAL_METHOD_TITLE = @"Umm?";
static NSString *const EXTERNAL_METHOD_MESSAGE =
    @"You selected %@, which is not supported by Razorpay at the moment.\nDo "
    @"you want to handle it separately?";
static NSString *const OK_BUTTON_TITLE = @"OK";

@interface ViewController () <RazorpayPaymentCompletionProtocol,
                              ExternalWalletSelectionProtocol> {
  Razorpay *razorpay;
}

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  razorpay = [Razorpay initWithKey:KEY_ID andDelegate:self];
  [razorpay setExternalWalletSelectionDelegate:self];
}

- (IBAction)payButtonPressed:(id)sender {
  UIImage *logo = [UIImage imageNamed:@"logo"];
  NSDictionary *options = @{
    @"amount" : @"100",
    @"currency" : @"INR",
    @"description" : @"Fine T-shirt",
    @"image" : logo,
    @"name" : @"Razorpay",
    @"external" : @{@"wallets" : @[ @"paytm" ]},
    @"prefill" :
        @{@"email" : @"contact@razorpay.com", @"contact" : @"18002700323"},
    @"theme" : @{@"color" : @"#3594E2"}
  };

  [razorpay open:options];
}

- (void)onPaymentSuccess:(NSString *)payment_id {
  [self showAlertWithTitle:SUCCESS_TITLE
                andMessage:[NSString
                               stringWithFormat:SUCCESS_MESSAGE, payment_id]];
}

- (void)onPaymentError:(int)code description:(NSString *)str {
  [self showAlertWithTitle:FAILURE_TITLE
                andMessage:[NSString
                               stringWithFormat:FAILURE_MESSAGE, code, str]];
}

- (void)onExternalWalletSelected:(NSString *)walletName
                 WithPaymentData:(NSDictionary *)paymentData {
  [self showAlertWithTitle:EXTERNAL_METHOD_TITLE
                andMessage:[NSString stringWithFormat:EXTERNAL_METHOD_MESSAGE,
                                                      walletName]];
}

- (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message {
  if ([[[UIDevice currentDevice] systemVersion]
          compare:@"8.0"
          options:NSNumericSearch] != NSOrderedAscending) {
    UIAlertController *alert = [UIAlertController
        alertControllerWithTitle:title
                         message:message
                  preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction =
        [UIAlertAction actionWithTitle:OK_BUTTON_TITLE
                                 style:UIAlertActionStyleCancel
                               handler:nil];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
  } else {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:OK_BUTTON_TITLE
                                          otherButtonTitles:nil];
    [alert show];
  }
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
