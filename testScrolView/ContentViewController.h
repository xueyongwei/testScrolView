//
//  ContentViewController.h
//  testScrolView
//
//  Created by 薛永伟 on 2017/3/23.
//  Copyright © 2017年 薛永伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChildTableView.h"
@interface ContentViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) ChildTableView *tableView;
@end
