//
//  AreaSelectionViewController.h
//  Bottle Booking
//
//  Created by Ambroise COLLON on 04/03/2014.
//  Copyright (c) 2014 Bottle Booking. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AreaSelectionViewController : UIViewController <UIScrollViewDelegate, UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *numberOfPeopleExpectedButton;
@property (weak, nonatomic) IBOutlet UIButton *hoursButton;
@property (weak, nonatomic) IBOutlet UIButton *minutesButton;
@property (nonatomic) NSArray *areas;
@property (nonatomic) NSDictionary *products;
@end
