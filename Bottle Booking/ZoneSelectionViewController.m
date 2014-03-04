//
//  ZoneSelectionViewController.m
//  Bottle Booking
//
//  Created by Ambroise COLLON on 04/03/2014.
//  Copyright (c) 2014 Bottle Booking. All rights reserved.
//

#import "ZoneSelectionViewController.h"
#import "NumberOfPeopleExpectedViewController.h"
#import "ZoneSelection.h"

@interface ZoneSelectionViewController ()
@property (nonatomic) int capacity;
@property (nonatomic) ZoneSelection *zoneSelectionModel;
@end

@implementation ZoneSelectionViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setModalPresentationStyle:UIModalPresentationCurrentContext];
	[self.navigationController setModalPresentationStyle:UIModalPresentationCurrentContext];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"numberOfPeopleModal"]) {
        NumberOfPeopleExpectedViewController *numberOfPeopleExpectedVC = (NumberOfPeopleExpectedViewController *)segue.destinationViewController;
        numberOfPeopleExpectedVC.capacity = self.capacity;
    }
}

- (int)capacity
{
    if (!_capacity) _capacity =10;
    return _capacity;
}

- (ZoneSelection *)zoneSelectionModel
{
    if (!_zoneSelectionModel) _zoneSelectionModel = [[ZoneSelection alloc]init];
    return _zoneSelectionModel;
}

@end
