//
//  SettingTableView.h
//  WS03
//
//  Created by andy li on 13-3-14.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SettingTableDelegate;


@interface SettingTableView : UITableView <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) NSMutableArray *data;
@property (nonatomic, retain) id<SettingTableDelegate> settingTableDelegate;

@end


@protocol SettingTableDelegate <NSObject>

- (void)didSelectedTableCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath;

@end