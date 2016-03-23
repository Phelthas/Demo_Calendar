//
//  LXMCalendarViewController.h
//  LXMDemo_Calendar
//
//  Created by luxiaoming on 16/3/22.
//  Copyright © 2016年 luxiaoming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXMCalendarViewController : UIViewController

@property (nonatomic, strong) NSDateComponents *monthDateComponents;
@property (nonatomic, weak) UIViewController *ownerViewController;

@end
