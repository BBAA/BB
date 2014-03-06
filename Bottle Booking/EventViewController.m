//
//  EventViewController.m
//  Bottle Booking
//
//  Created by Ambroise COLLON on 04/03/2014.
//  Copyright (c) 2014 Bottle Booking. All rights reserved.
//

#import "EventViewController.h"
#import "Event.h"
#import "AreaSelectionViewController.h"

@interface EventViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *eventCoverImageView;
@property (weak, nonatomic) IBOutlet UIImageView *flyerImageView;
@property (weak, nonatomic) IBOutlet UIImageView *logImageView;
@property (strong, nonatomic) Event *eventModel;
@end

@implementation EventViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"bookNow"]){
        NSDictionary *clubIdentifer = @{@"clubID":@876,@"socID":@18};
        [self.eventModel getProductsAndAreasFromClub:clubIdentifer inBackgroundWithBlock:^(NSDictionary *result) {
            if (result) {
                AreaSelectionViewController *areaSelectionVC = (AreaSelectionViewController *)segue.destinationViewController;
                areaSelectionVC.areas=result[@"areas"];
                areaSelectionVC.products=result[@"products"];
            } else {
                UIAlertView *errorAlert = [[UIAlertView alloc]initWithTitle:@"Oups" message:@"Something went wrong!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                [errorAlert show];
            }
        }];
    }
}

- (Event *)eventModel
{
    if (!_eventModel) _eventModel = [[Event alloc]init];
    return _eventModel;
}
@end
