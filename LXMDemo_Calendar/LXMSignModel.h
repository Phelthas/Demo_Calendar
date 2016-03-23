//
//  LXMSignModel.h
//  LXMDemo_Calendar
//
//  Created by luxiaoming on 16/3/23.
//  Copyright © 2016年 luxiaoming. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, LXMSignType) {
    LXMSignTypeNone = 0,
    LXMSignTypeSigned = 1,
};

@interface LXMSignModel : NSObject

@property (nonatomic, copy) NSString *dayText;
@property (nonatomic, assign) LXMSignType signType;

@end
