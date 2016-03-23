//
//  LXMCalendarDayCell.h
//  LXMDemo_Calendar
//
//  Created by luxiaoming on 16/3/22.
//  Copyright © 2016年 luxiaoming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LXMSignModel.h"

static NSString * const LXMCalendarDayCellIdentifier = @"LXMCalendarDayCell";

@interface LXMCalendarDayCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

- (void)configureWithSignModel:(LXMSignModel *)signModel;

@end
