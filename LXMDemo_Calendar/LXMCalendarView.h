//
//  LXMCalendarView.h
//  LXMDemo_Calendar
//
//  Created by luxiaoming on 16/3/22.
//  Copyright © 2016年 luxiaoming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXMCalendarView : UIView

- (void)setupWithMonthDateComponents:(NSDateComponents *)components;

- (void)updateWithSignDayArray:(NSArray *)signDayArray;

@end
