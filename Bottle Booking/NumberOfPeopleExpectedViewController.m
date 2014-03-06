//
//  NumberOfPeopleExpectedViewController.m
//  Bottle Booking
//
//  Created by Ambroise COLLON on 04/03/2014.
//  Copyright (c) 2014 Bottle Booking. All rights reserved.
//

#import "NumberOfPeopleExpectedViewController.h"

@interface NumberOfPeopleExpectedViewController ()
@property (weak, nonatomic) IBOutlet UIButton *plusButton;
@property (weak, nonatomic) IBOutlet UIButton *minusButton;
@property (weak, nonatomic) IBOutlet UILabel *numberOfPeopleLabel;
@end

@implementation NumberOfPeopleExpectedViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (_numberOfPeople==_capacity) _plusButton.enabled=NO;
    else if (_numberOfPeople==1) _minusButton.enabled=NO;
        
    _numberOfPeopleLabel.text = [NSString stringWithFormat:@"%d",_numberOfPeople];
}
- (IBAction)increaseNumberOfPeople:(UIButton *)sender {
    _minusButton.enabled=YES;
    _numberOfPeople = [_numberOfPeopleLabel.text intValue];
    _numberOfPeople++;
    if (_numberOfPeople>=self.capacity) {
		sender.enabled=NO;
        _numberOfPeople=self.capacity;
    }
    _numberOfPeopleLabel.text = [NSString stringWithFormat:@"%d",_numberOfPeople];
}
- (IBAction)decreaseNumberOfPeople:(UIButton *)sender {
    _plusButton.enabled = YES;
    _numberOfPeople = [_numberOfPeopleLabel.text intValue];
    _numberOfPeople--;
    if (_numberOfPeople<=1) {
        sender.enabled=NO;
    	_numberOfPeople=1;
    }
    _numberOfPeopleLabel.text = [NSString stringWithFormat:@"%d",_numberOfPeople];}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    _zoneSelectionVC.numberOfPeopleExpectedButton.titleLabel.text=_numberOfPeopleLabel.text;
}
- (int)capacity
{
    if (!_capacity) _capacity =10;
    return _capacity;
}

@end
