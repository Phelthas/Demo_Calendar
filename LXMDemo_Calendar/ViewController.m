//
//  ViewController.m
//  LXMDemo_Calendar
//
//  Created by luxiaoming on 16/3/22.
//  Copyright © 2016年 luxiaoming. All rights reserved.
//

#import "ViewController.h"
#import "LXMCalendarViewController.h"



@interface ViewController ()

@property (nonatomic, strong) UIPageViewController *pageViewController;

@property (nonatomic, strong) NSCalendar *calendar;
@property (nonatomic, strong) NSDateComponents *todayMonthDateComponents;
@property (nonatomic, strong) NSDateComponents *currentMonthDateComponents;
@property (nonatomic, strong) NSDate *today;//服务器返回的今天的日期，不能取本机时间，因为系统时间可以手动改

@property (weak, nonatomic) IBOutlet UILabel *monthLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.today = [NSDate date];//test,理论上应该从服务器获取
    
    NSDateComponents *dateComponents = [self.calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self.today];
    self.todayMonthDateComponents = dateComponents;
    self.currentMonthDateComponents = dateComponents;
    
    [self updateMonthLabel];
    [self setupPageViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - PrivateMethod

- (void)setupPageViewController {
    if (self.pageViewController) {
        [self.pageViewController willMoveToParentViewController:nil];
        [self.pageViewController.view removeFromSuperview];
        [self.pageViewController removeFromParentViewController];
    }
    UIPageViewController *pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    
    LXMCalendarViewController *viewController = [self calendarViewControllerWithMonth:self.currentMonthDateComponents];
    [pageViewController setViewControllers:@[viewController] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:^(BOOL finished) {
    }];
    
    
    [self addChildViewController:pageViewController];
    [self.view addSubview:pageViewController.view];
    
    CGFloat height = kLXMScreenHeight - 74 - 20;
    CGRect pageViewRect = CGRectMake(0, 94, kLXMScreenWidth, height);
    pageViewController.view.frame = pageViewRect;
    
    [pageViewController didMoveToParentViewController:self];
    self.pageViewController = pageViewController;
}


- (LXMCalendarViewController *)calendarViewControllerWithMonth:(NSDateComponents *)dateComponents {
    LXMCalendarViewController *viewController = [[LXMCalendarViewController alloc] init];
    viewController.monthDateComponents = dateComponents;
    viewController.ownerViewController = self;
    return viewController;
}

- (void)updateMonthLabel {
    
    self.monthLabel.text = [NSString stringWithFormat:@"%@年%@月", @(self.currentMonthDateComponents.year), @(self.currentMonthDateComponents.month)];
}

#pragma mark - Action

- (IBAction)handleHeaderViewLeftButtonTapped:(UIButton *)sender {
    NSDateComponents *previousDateComponents = [[NSDateComponents alloc] init];
    NSInteger year = self.currentMonthDateComponents.year;
    NSInteger month = self.currentMonthDateComponents.month - 1;
    if (month == 0) {
        month = 12;
        year = year - 1;
    }
    previousDateComponents.year = year;
    previousDateComponents.month = month;
    previousDateComponents.day = 1;
    LXMCalendarViewController *viewController = [self calendarViewControllerWithMonth:previousDateComponents];
    
    __weak typeof(self)weakSelf = self;
    [self.pageViewController setViewControllers:@[viewController] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:^(BOOL finished) {
        weakSelf.currentMonthDateComponents = previousDateComponents;
        [weakSelf updateMonthLabel];
    }];
    
}

- (IBAction)handleHeaderViewRightButtonTapped:(UIButton *)sender {
    NSDateComponents *nextDateComponents = [[NSDateComponents alloc] init];
    NSInteger year = self.currentMonthDateComponents.year;
    NSInteger month = self.currentMonthDateComponents.month + 1;
    if (month == 13) {
        month = 1;
        year = year + 1;
    }
    
    nextDateComponents.year = year;
    nextDateComponents.month = month;
    nextDateComponents.day = 1;
    LXMCalendarViewController *viewController = [self calendarViewControllerWithMonth:nextDateComponents];
    __weak typeof(self)weakSelf = self;
    [self.pageViewController setViewControllers:@[viewController] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:^(BOOL finished) {
        weakSelf.currentMonthDateComponents = nextDateComponents;
        [weakSelf updateMonthLabel];
    }];
}


#pragma mark - property

- (NSCalendar *)calendar {
    if (!_calendar) {
        _calendar = [NSCalendar currentCalendar];
        _calendar.firstWeekday = 2;
        _calendar.minimumDaysInFirstWeek = 1;
    }
    return _calendar;
}

@end
