//
//  AreaView.m
//  Bottle Booking
//
//  Created by Ambroise COLLON on 05/03/2014.
//  Copyright (c) 2014 Bottle Booking. All rights reserved.
//

#import "AreaView.h"
@implementation AreaView
#define GREY 27.0/255.0
#define PINK_R 252.0/255.0
#define PINK_G 47.0/255.0
#define PINK_B 99.0/255.0

- (id) initWithFrame:(CGRect)frame imageName:(NSString *)imageName areaName:(NSString *)areaName minimumSpending:(int)minimumSpending andCapacity:(int)capacity
{
    self = [self initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:GREY green:GREY blue:GREY alpha:1];
        self.userInteractionEnabled=YES;
        //Init variables
        _areaName=areaName;
        _capacity=capacity;
        _minimumSpending=minimumSpending;
        
        //Image view
        _logoImageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 4, 66, 50)];
        //_logoImageView.image = [UIImage imageNamed:imageName];
        _logoImageView.backgroundColor = [UIColor grayColor];
        
        //Label
        _areaNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 54, 76, 18)];
        _areaNameLabel.textAlignment = NSTextAlignmentCenter;
        _areaNameLabel.textColor = [UIColor whiteColor];
        _areaNameLabel.font = [UIFont systemFontOfSize:12.0];
        _areaNameLabel.text = areaName;
        
        //button
        _button = [[UIButton alloc]initWithFrame:self.bounds];
        _button.userInteractionEnabled=YES;
        _button.backgroundColor=[UIColor yellowColor];
        [_button addTarget:self action:@selector(handleTap:) forControlEvents:UIControlEventTouchUpInside];

        //tap gesture racognizer
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
        [tapRecognizer setNumberOfTapsRequired:1];
        [tapRecognizer setDelegate:self];
        [self addGestureRecognizer:tapRecognizer];
        
        [self addSubview:_logoImageView];
        [self addSubview:_areaNameLabel];
        [self addSubview:_button];
    }
    return self;
}


-(void)handleTap:(UIButton *)button
{
    NSLog(@"tapped!");
}

-(void)tapped:(UITapGestureRecognizer *)recognizer
{
    NSLog(@"tapped!");
}
@end