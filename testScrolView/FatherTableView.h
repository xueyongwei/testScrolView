//
//  FatherTableView.h
//  testScrolView
//
//  Created by 薛永伟 on 2017/3/23.
//  Copyright © 2017年 薛永伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FatherTableView : UITableView
@property (nonatomic,assign) BOOL stopScrol;
@property (nonatomic,strong)UITableView *childrenTbaleView;
@end
