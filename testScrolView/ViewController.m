//
//  ViewController.m
//  testScrolView
//
//  Created by 薛永伟 on 2017/3/23.
//  Copyright © 2017年 薛永伟. All rights reserved.
//

#import "ViewController.h"
#import "FatherTableView.h"
#import "ContentViewController.h"
#import "ATableViewController.h"
#import "BTableViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet FatherTableView *tableView;
//@property (strong, nonatomic) ContentViewController *contentVC;
@property (strong, nonatomic) UITableViewController *currentContentVC;
@property (strong, nonatomic) UIView *headerView;
@property (nonatomic,assign) BOOL HaveFloat;
@end

@implementation ViewController
-(UIView *)headerView
{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
        _headerView.backgroundColor = [UIColor lightGrayColor];
        UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn1 setTitle:@"111" forState:UIControlStateNormal];
        [btn1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [btn1 addTarget:self action:@selector(onBtn1Click:) forControlEvents:UIControlEventTouchUpInside];
        btn1.frame = CGRectMake(0, 0, 44, 44);
        [_headerView addSubview:btn1];
        UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn2 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [btn2 addTarget:self action:@selector(onBtn2Click:) forControlEvents:UIControlEventTouchUpInside];
        [btn2 setTitle:@"222" forState:UIControlStateNormal];
        btn2.frame = CGRectMake(50, 0, 44, 44);
        [_headerView addSubview:btn2];
    }
    return _headerView;
}
-(void)onBtn2Click:(UIButton *)sender{
    self.currentContentVC = self.childViewControllers.lastObject;
    [self adjustTableView];
    [self.tableView beginUpdates];
    
    [UIView performWithoutAnimation:^{
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationLeft];
    }];
    [self.tableView endUpdates];
//    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationLeft];
    
}
-(void)onBtn1Click:(UIButton *)sender{
    self.currentContentVC = self.childViewControllers.firstObject;
    [self adjustTableView];
    [UIView performWithoutAnimation:^{
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationRight];
    }];
//    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationRight];
    
}
-(void)adjustTableView{
    if (self.HaveFloat) {
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1] atScrollPosition:UITableViewScrollPositionTop animated:NO];
    }else{
        
    }
//    UIView *view =  self.headerView;
//    NSLog(@"view %@",NSStringFromCGRect(view.frame));
//    CGPoint point = [self.tableView convertPoint:CGPointMake(view.frame.origin.x, view.frame.origin.y) fromView:self.view];
//    NSLog(@"point %@",NSStringFromCGPoint(point));
//    [self.tableView setContentOffset:point];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addCHDV];
//    ContentViewController *contentVC = [[ContentViewController alloc]init];
//    self.contentVC = contentVC;
//    [self addChildViewController:contentVC];
//    self.tableView.childrenTbaleView = contentVC.tableView;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
    view.backgroundColor = [UIColor redColor];
    self.tableView.tableHeaderView = view;
    // Do any additional setup after loading the view, typically from a nib.
    
}
-(void)addCHDV{
    ATableViewController *a = [[ATableViewController alloc]init];
    [a viewDidLoad];
    [self addChildViewController:a];
    
    BTableViewController *b = [[BTableViewController alloc]init];
    [b viewDidLoad];
    [self addChildViewController:b];
    self.currentContentVC = a;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section ==0) {
        return 2;
    }else{
       return  [self.currentContentVC tableView:self.currentContentVC.tableView numberOfRowsInSection:0];
    }
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"nb:%ld",section];
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section ==0) {
        return [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0.1)];
    }else{
        return self.headerView;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.1;
    }else{
        return 50;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        }
        cell.textLabel.text = [NSString stringWithFormat:@"%ld,%ld",indexPath.section,indexPath.row];
        return cell;
    }else{
        return [self.currentContentVC tableView: self.currentContentVC.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:0]];
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==0) {
        return 44;
    }else{
        return  [self.currentContentVC tableView:self.currentContentVC.tableView heightForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:0]];
    }
}
-(void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 1) {
        NSLog(@"HaveFloat");
        self.HaveFloat = YES;
//        self.tableView.stopScrol = YES;
    }
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"VC  touchesMoved");
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 1) {
        self.HaveFloat = NO;
        NSLog(@"Have NOT Float");
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
