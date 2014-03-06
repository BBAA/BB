//
//  HourOfArrivalViewController.h
//  Bottle Booking
//
//  Created by Ambroise COLLON on 05/03/2014.
//  Copyright (c) 2014 Bottle Booking. All rights reserved.
//

#import "PopUpViewController.h"
#import "AreaSelectionViewController.h"

@interface HourOfArrivalViewController : PopUpViewController
@property (nonatomic) AreaSelectionViewController *zoneSelectionVC;
@property (nonatomic) int hours;
@property (nonatomic) int minutes;
@end
