//
//  NumberOfPeopleExpectedViewController.m
//  Bottle Booking
//
//  Created by Ambroise COLLON on 04/03/2014.
//  Copyright (c) 2014 Bottle Booking. All rights reserved.
//

#import "NumberOfPeopleExpectedViewController.h"

@interface NumberOfPeopleExpectedViewController ()
@property (weak, nonatomic) IBOutlet UILabel *numberOfPeopleLabel;
@property (weak, nonatomic) IBOutlet UIButton *plusButton;
@property (weak, nonatomic) IBOutlet UIButton *minusButton;
@end

@implementation NumberOfPeopleExpectedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}
- (IBAction)increaseNumberOfPeople:(UIButton *)sender {
    _minusButton.enabled=YES;
    int numberOfPeople = [_numberOfPeopleLabel.text intValue];
    numberOfPeople++;
    if (numberOfPeople>=self.capacity) {
		sender.enabled=NO;
        numberOfPeople=self.capacity;
    }
    _numberOfPeopleLabel.text = [NSString stringWithFormat:@"%d",numberOfPeople];
}
- (IBAction)decreaseNumberOfPeople:(UIButton *)sender {
    _plusButton.enabled = YES;
    int numberOfPeople = [_numberOfPeopleLabel.text intValue];
    numberOfPeople--;
    if (numberOfPeople<=0) {
        sender.enabled=NO;
    	numberOfPeople=0;
    }
    _numberOfPeopleLabel.text = [NSString stringWithFormat:@"%d",numberOfPeople];}

- (int)capacity
{
    if (!_capacity) _capacity =10;
    return _capacity;
}

@end
