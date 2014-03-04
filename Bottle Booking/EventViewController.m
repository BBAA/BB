//
//  EventViewController.m
//  Bottle Booking
//
//  Created by Ambroise COLLON on 04/03/2014.
//  Copyright (c) 2014 Bottle Booking. All rights reserved.
//

#import "EventViewController.h"

@interface EventViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *eventCoverImageView;
@property (weak, nonatomic) IBOutlet UIImageView *flyerImageView;
@property (weak, nonatomic) IBOutlet UIImageView *logImageView;

@end

@implementation EventViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


@end
