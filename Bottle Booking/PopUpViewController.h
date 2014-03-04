//
//  PopUpViewController.h
//  Bottle Booking
//
//  Created by Ambroise COLLON on 04/03/2014.
//  Copyright (c) 2014 Bottle Booking. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopUpViewController : UIViewController
- (IBAction)popBack:(UITapGestureRecognizer *)sender;
@property (weak, nonatomic) IBOutlet UIView *popupView;
@end
