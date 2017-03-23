//
//  FatherTableView.m
//  testScrolView
//
//  Created by 薛永伟 on 2017/3/23.
//  Copyright © 2017年 薛永伟. All rights reserved.
//

#import "FatherTableView.h"

@implementation FatherTableView
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesBegan");
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesMoved");
}
-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"motionBegan");
}
-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"motionEnded");
}

//-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
//{
//    if (_stopScrol) {
//        NSLog(@"让给我的子view处理");
//        return self.childrenTbaleView;
//    }
//    NSLog(@"我处理");
//    return self;
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
