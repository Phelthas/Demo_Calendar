//
//  LXMCalendarDayCell.m
//  LXMDemo_Calendar
//
//  Created by luxiaoming on 16/3/22.
//  Copyright © 2016年 luxiaoming. All rights reserved.
//

#import "LXMCalendarDayCell.h"

@implementation LXMCalendarDayCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

- (void)configureWithSignModel:(LXMSignModel *)signModel {
    if (signModel.signType == LXMSignTypeNone) {
        self.contentLabel.textColor = [UIColor blackColor];
    } else {
        self.contentLabel.textColor = [UIColor redColor];
    }
    self.contentLabel.text = signModel.dayText;
}

@end
