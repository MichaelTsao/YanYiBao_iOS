//
//  ForthViewController.m
//  YanYiBao
//
//  Created by 郭 旭 on 14-8-3.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import "ForthViewController.h"
#import "UIColor+Helper.h"
#import "CTableViewCell.h"

@interface ForthViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *table1;
}
@end

@implementation ForthViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"更多设置";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;
    [self.view setBackgroundColor:[UIColor colorWithHexString:@"#f7f7f7" withAlpha:1.0]];
    CGRect table_frame = CGRectMake(0, 0, 320, self.view.frame.size.height-40);
    
    table1 = [[UITableView alloc] initWithFrame:table_frame style:UITableViewStyleGrouped];
    [table1 setDelegate:self];
    [table1 setDataSource:self];
    table1.rowHeight = 45;
    //[table1 setScrollEnabled:NO];
    //table1.sectionHeaderHeight = 10;
    //table1.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:table1];
    
    if ([[UIScreen mainScreen] bounds].size.height > 500){
        [table1 setScrollEnabled:NO];
    }}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    }
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSArray *arr = [[NSArray alloc] initWithObjects:@"演出通知提醒",@"账号分享",@"清理缓存",nil];
    NSArray *arr1 = [[NSArray alloc] initWithObjects:@"喜欢演艺宝？去评分吧",@"意见反馈",@"应用推荐",@"检测新版本",@"关于",nil];
    
    static NSString *CellIdentifier1 = @"Cell1";
    CTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier1];
    if(cell == nil)
    {
        cell = [[CTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier1];
        //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            [cell.image setImage:nil];
            UISwitch *mySwitch = [[UISwitch alloc] init];
            mySwitch.on = YES;
            cell.accessoryView = mySwitch;
        }
        [cell.label1 setText:[arr objectAtIndex:indexPath.row]];
    }else{
        [cell.label1 setText:[arr1 objectAtIndex:indexPath.row]];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
