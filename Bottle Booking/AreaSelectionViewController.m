//
//  AreaSelectionViewController.m
//  Bottle Booking
//
//  Created by Ambroise COLLON on 04/03/2014.
//  Copyright (c) 2014 Bottle Booking. All rights reserved.
//

#import "AreaSelectionViewController.h"
#import "NumberOfPeopleExpectedViewController.h"
#import "HourOfArrivalViewController.h"
#import "AreaView.h"

@interface AreaSelectionViewController ()
@property (nonatomic) int capacity;
@property (weak, nonatomic) IBOutlet UIScrollView *areaSelectionScrollView;
@property (weak, nonatomic) IBOutlet UILabel *nameOfAreaLabel;
@end

@implementation AreaSelectionViewController
- (IBAction)scrollLeft:(UIButton *)sender {
    float xOffset = _areaSelectionScrollView.contentOffset.x;
    
    if (((int)xOffset)%102==0 && xOffset>0) {
        [_areaSelectionScrollView setContentOffset:CGPointMake(xOffset-_areaSelectionScrollView.frame.size.width, 0.0f) animated:YES];
    }
}
- (IBAction)scrollRight:(UIButton *)sender {
    float xOffset = _areaSelectionScrollView.contentOffset.x;

    if (((int)xOffset)%102==0 && xOffset<(_areaSelectionScrollView.contentSize.width-102)) {
        [_areaSelectionScrollView setContentOffset:CGPointMake(xOffset+_areaSelectionScrollView.frame.size.width, 0.0f) animated:YES];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setModalPresentationStyle:UIModalPresentationCurrentContext];
	[self.navigationController setModalPresentationStyle:UIModalPresentationCurrentContext];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self populateAreaSelectionScrollViewWithAreas:_areas];
}

- (void) populateAreaSelectionScrollViewWithAreas:(NSArray *)areas
{
    // Adjust scroll view content size
    _areaSelectionScrollView.contentSize = CGSizeMake(_areaSelectionScrollView.frame.size.width * ([areas count]-2),
                                                      _areaSelectionScrollView.frame.size.height);
    
    // Generate content for our scroll view
    int i = 0;
    while (i<[areas count]) {
        AreaView *areaView = [[AreaView alloc] initWithFrame:CGRectMake(102*i, 14, 76, 72) imageName:@"imageName.png" areaName:areas[i][@"description"] minimumSpending:(int)areas[i][@"minimuSpending"] andCapacity:(int)areas[i][@"capacity"]];
        
        [areaView setTag:i];
        [_areaSelectionScrollView addSubview:areaView];
        i++;
    }

}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"numberOfPeopleModal"]) {
        NumberOfPeopleExpectedViewController *numberOfPeopleExpectedVC = (NumberOfPeopleExpectedViewController *)segue.destinationViewController;
        numberOfPeopleExpectedVC.capacity = self.capacity;
        numberOfPeopleExpectedVC.numberOfPeople = [_numberOfPeopleExpectedButton.titleLabel.text intValue];
        numberOfPeopleExpectedVC.zoneSelectionVC=self;
    } else if ([segue.identifier isEqualToString:@"hourOfArrivalModal"]) {
        HourOfArrivalViewController *hourOfArrivalVC = (HourOfArrivalViewController *)segue.destinationViewController;
        hourOfArrivalVC.hours=[_hoursButton.titleLabel.text intValue];
        hourOfArrivalVC.minutes=[_minutesButton.titleLabel.text intValue];
        hourOfArrivalVC.zoneSelectionVC=self;
    }
}

- (int)capacity
{
    if (!_capacity) _capacity =10;
    return _capacity;
}
@end
