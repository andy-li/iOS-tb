//
//  SettingViewController.h
//  WS03
//
//  Created by andy li on 13-3-7.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingTableView.h"

@interface SettingViewController : UIViewController <SettingTableDelegate>

@property (nonatomic, retain) SettingTableView *tableView;

@end
