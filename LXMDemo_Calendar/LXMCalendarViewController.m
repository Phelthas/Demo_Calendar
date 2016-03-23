//
//  LXMCalendarViewController.m
//  LXMDemo_Calendar
//
//  Created by luxiaoming on 16/3/22.
//  Copyright © 2016年 luxiaoming. All rights reserved.
//

#import "LXMCalendarViewController.h"
#import "LXMCalendarView.h"

@interface LXMCalendarViewController ()

@end

@implementation LXMCalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGFloat height = 275;
    LXMCalendarView *calendarView = [[LXMCalendarView alloc] initWithFrame:CGRectMake(0, 0, kLXMScreenWidth, height)];
    [calendarView setupWithMonthDateComponents:self.monthDateComponents];
    [self.view addSubview:calendarView];
    
    //test,理论上应该从服务器获取
    NSArray *signDayArray = @[@"1", @"3", @"7", @"11", @"23", @"27"];
    [calendarView updateWithSignDayArray:signDayArray];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
