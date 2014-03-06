//
//  HourOfArrivalViewController.m
//  Bottle Booking
//
//  Created by Ambroise COLLON on 05/03/2014.
//  Copyright (c) 2014 Bottle Booking. All rights reserved.
//

#import "HourOfArrivalViewController.h"

@interface HourOfArrivalViewController ()
@property (weak, nonatomic) IBOutlet UILabel *hoursLabel;
@property (weak, nonatomic) IBOutlet UILabel *minutesLabel;
@end

@implementation HourOfArrivalViewController

//HOURS
- (IBAction)increaseHours {
    _hours = [_hoursLabel.text intValue];
    _hours++;
    if (_hours>=24) _hours=0;
    _hoursLabel.text = [NSString stringWithFormat:@"%d",_hours];
}
- (IBAction)decreaseHours {
    _hours = [_hoursLabel.text intValue];
    _hours--;
    if (_hours<0) _hours=23;
    _hoursLabel.text = [NSString stringWithFormat:@"%d",_hours];
}

//MINUTES
- (IBAction)increaseMinutes {
    _minutes = [_minutesLabel.text intValue];
    _minutes+=5;
    if (_minutes>=60) _minutes=0;
    _minutesLabel.text = [NSString stringWithFormat:@"%d",_minutes];
}
- (IBAction)decreaseMinutes {
    _minutes = [_minutesLabel.text intValue];
    _minutes-=5;
    if (_minutes<0) _minutes=55;
    _minutesLabel.text = [NSString stringWithFormat:@"%d",_minutes];
}

//APPEAR
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _hoursLabel.text = [NSString stringWithFormat:@"%d",_hours];
    _minutesLabel.text = [NSString stringWithFormat:@"%d",_minutes];

}

//DISAPPEAR
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    _zoneSelectionVC.hoursButton.titleLabel.text=_hoursLabel.text;
    _zoneSelectionVC.minutesButton.titleLabel.text=_minutesLabel.text;
}
@end
