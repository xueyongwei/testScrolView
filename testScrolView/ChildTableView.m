//
//  ChildTableView.m
//  testScrolView
//
//  Created by 薛永伟 on 2017/3/23.
//  Copyright © 2017年 薛永伟. All rights reserved.
//

#import "ChildTableView.h"

@implementation ChildTableView

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (self.stopScrol) {
        return nil;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
