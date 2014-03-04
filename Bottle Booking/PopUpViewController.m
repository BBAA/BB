//
//  PopUpViewController.m
//  Bottle Booking
//
//  Created by Ambroise COLLON on 04/03/2014.
//  Copyright (c) 2014 Bottle Booking. All rights reserved.
//

#import "PopUpViewController.h"

@interface PopUpViewController ()

@end

@implementation PopUpViewController

- (IBAction)popBack:(UITapGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self.view];
    CGRect rect = _popupView.frame;
    bool inside = CGRectContainsPoint(rect, point);
    
    if (!inside) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
}
@end
