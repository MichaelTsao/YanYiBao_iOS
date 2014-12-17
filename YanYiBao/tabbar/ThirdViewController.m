//
//  ThirdViewController.m
//  YanYiBao
//
//  Created by 郭 旭 on 14-8-3.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import "ThirdViewController.h"
#import "UIColor+Helper.h"
#import "BTableViewCell.h"
#import "UserViewController.h"

@interface ThirdViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *table1;
    UIScrollView *scrollView;
}
@end

@implementation ThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor colorWithHexString:@"#f7f7f7" withAlpha:1.0]];
    
    UIImage *ima_logo = [UIImage imageNamed:@"my_logo"];
    CGRect logo_frame = CGRectMake(0, 0, ima_logo.size.width, ima_logo.size.height);
    CGRect table_frame = CGRectMake(0, 20, 320, 315);
    
    UIImageView *logoView = [[UIImageView alloc] initWithImage:ima_logo];
    [logoView setFrame:logo_frame];
    [self.view addSubview:logoView];
    
    UILabel *lab1 = [[UILabel alloc] init];
    [lab1 setFrame:CGRectMake(130, 120, 60, 20)];
    [lab1 setText:@"过路的猫"];
    [lab1 setFont:[UIFont systemFontOfSize:14]];
    [lab1 setTextColor:[UIColor whiteColor]];
    [lab1 setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:lab1];
    
    UILabel *lab2 = [[UILabel alloc] init];
    [lab2 setFrame:CGRectMake(240, 120, 80, 20)];
    [lab2 setText:@"积分：200"];
    [lab2 setFont:[UIFont systemFontOfSize:12]];
    [lab2 setTextColor:[UIColor whiteColor]];
    [lab2 setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:lab2];
    
    CGRect scroll_frame = CGRectMake(0, 158, 320, 380);
    scrollView = [[UIScrollView alloc] initWithFrame:scroll_frame];
    [scrollView setContentSize:CGSizeMake(320,460)];
    [scrollView setDelegate:self];
    [self.view addSubview:scrollView];
    
    if ([[UIScreen mainScreen] bounds].size.height > 500){
        scrollView.scrollEnabled = NO;
    }
    
    table1 = [[UITableView alloc] initWithFrame:table_frame style:UITableViewStylePlain];
    [table1 setDelegate:self];
    [table1 setDataSource:self];
    table1.rowHeight = 45;
    [table1 setScrollEnabled:NO];
    //table1.separatorStyle = UITableViewCellSeparatorStyleNone;
    [scrollView addSubview:table1];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIImage *image = [UIImage imageNamed:@"my_user"];
    UIImage *image1 = [UIImage imageNamed:@"my_car"];
    UIImage *image2 = [UIImage imageNamed:@"my_star"];
    UIImage *image3 = [UIImage imageNamed:@"my_glass"];
    UIImage *image4 = [UIImage imageNamed:@"my_cup"];
    UIImage *image5 = [UIImage imageNamed:@"my_near"];
    UIImage *image6 = [UIImage imageNamed:@"my_dor"];

    
    NSArray *arr = [NSArray arrayWithObjects:image,image1,image2,image3,image4,image5,image6, nil];
    NSArray *arr1 = [NSArray arrayWithObjects:@"我的账户",@"我的订单",@"我的收藏",@"我的明星",@"我的抽奖",@"收货地址",@"优惠券",nil];
    NSArray *arr2 = [NSArray arrayWithObjects:@"",@"8",@"0",@"0",@"3",@"",@"2",nil];
    
    static NSString *CellIdentifier1 = @"Cell1";
    BTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier1];
    if(cell == nil)
    {
        cell = [[BTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier1];
        //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    [cell.image setImage:[arr objectAtIndex:indexPath.row]];
    [cell.label setText:[arr1 objectAtIndex:indexPath.row]];
    [cell.label1 setText:[arr2 objectAtIndex:indexPath.row]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        UserViewController *userVC = [[UserViewController alloc] init];
        [self.tabBarController.tabBar setHidden:YES];
        [self.navigationController pushViewController:userVC animated:YES];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
    [self.tabBarController.tabBar setHidden:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
