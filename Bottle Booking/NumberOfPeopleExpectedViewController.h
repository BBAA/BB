//
//  NumberOfPeopleExpectedViewController.h
//  Bottle Booking
//
//  Created by Ambroise COLLON on 04/03/2014.
//  Copyright (c) 2014 Bottle Booking. All rights reserved.
//

#import "PopUpViewController.h"
#import "AreaSelectionViewController.h"

@interface NumberOfPeopleExpectedViewController : PopUpViewController
@property (nonatomic) int capacity;
@property (nonatomic) int numberOfPeople;
@property (nonatomic) AreaSelectionViewController *zoneSelectionVC;
@end
