//
//  ViewController.m
//  Minutes From Midnight
//
//  Created by David Barkman on 10/3/14.
//  Copyright (c) 2014 David Barkman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    int test;
    NSDate *date;
    NSCalendar *calendar;
    NSDateComponents *components;
    NSInteger hour;
    NSInteger minute;
    NSInteger second;
    NSInteger minutes;
    int subMinutes;
}

@end

@implementation ViewController

@synthesize clockLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    test = 0;
    
    clockLabel.frame = CGRectMake(0, 0, 800, 100);
    
    [self UpdateClockLabel];

    [NSTimer scheduledTimerWithTimeInterval:1.0
            target:self
            selector:@selector(UpdateClockLabel)
            userInfo:nil
            repeats:YES];
}

- (void)UpdateClockLabel
{
    self.clockLabel.text = [NSString stringWithFormat:@"%i", test];
    test++;
    
    date = [NSDate new];
    calendar = [NSCalendar currentCalendar];
    components = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate:date];
    hour = [components hour];
    minute = [components minute];
    second = [components second];
    minutes = hour * 60 + minute;
//    subMinutes = ((float)second / 60.0f);
//    NSLog(@"%@", [NSString stringWithFormat:@"%.5f", minutes + subMinutes]);
//    return;
    
    self.clockLabel.text = [NSString stringWithFormat:@"%ld:%02ld", (long)minutes, (long)second];// + subMinutes];
}

@end
