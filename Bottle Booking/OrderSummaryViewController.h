//
//  OrderSummaryViewController.h
//  Bottle Booking
//
//  Created by Alexandre Ohayon on 05/03/2014.
//  Copyright (c) 2014 Bottle Booking. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PayPalMobile.h"

@interface OrderSummaryViewController : UIViewController <PayPalPaymentDelegate, PayPalFuturePaymentDelegate>

@property(nonatomic, strong, readwrite) NSString *environment;
@property(nonatomic, strong, readwrite) NSString *resultText;
@property double paymentAmount;

@end
