//
//  StarViewController.m
//  YanYiBao
//
//  Created by 郭 旭 on 14-8-18.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import "StarViewController.h"
#import "StarTableViewCell.h"
#import "AFHTTPClient.h"
#import "UserInfoData.h"
#import "ShowStarListData.h"
#import "AFNetworking.h"
#import "StarInfoViewController.h"

@interface StarViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *table1;
    ShowStarListData *data;
}
@end

@implementation StarViewController
@synthesize starId = _starId;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UIImage *image = [UIImage imageNamed:@"back"];
        
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [backButton setFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        [backButton setBackgroundImage:image forState:UIControlStateNormal];
        [backButton addTarget:self action:@selector(backController:) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem * leftButton = [[UIBarButtonItem alloc] init];
        [leftButton setCustomView:backButton];
        self.navigationItem.leftBarButtonItem = leftButton;
    }
    return self;
}

-(void)backController:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"明星列表";
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
    
    [UserInfoData showLoading:@"加载中..."];
    [self sendRequest];
}

-(void)sendRequest
{
    NSString *path = @"/show/star";
    NSString *proId = [NSString stringWithFormat:@"%ld",(long)_starId];
    NSDictionary *param = @{@"id":proId};
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",HOSTURL]];
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:url];
    [client getPath:path parameters:param
            success:^(AFHTTPRequestOperation *operation, id responseObject){
                
                [UserInfoData hideLoading];
                [[UserInfoData shareInstance] decodeobjectShowStarListData:responseObject];
                data = [UserInfoData shareInstance].showStarListData;
                NSLog(@"data = %@",data);
                [self initView];
            }
            failure:^(AFHTTPRequestOperation *operation, NSError *error){
                NSLog(@" request faild , error == %@ ",error);
                [UserInfoData hideLoading];
                [UserInfoData alterShow:@"数据加载失败，请检查网络"];
                //[self initView];
            }];
}

-(void)initView
{
    CGRect table_frame = CGRectMake(0, 0, 320, self.view.frame.size.height);
    table1 = [[UITableView alloc] initWithFrame:table_frame style:UITableViewStylePlain];
    [table1 setDelegate:self];
    [table1 setDataSource:self];
    table1.rowHeight = 100;
    table1.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:table1];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [data showStarListCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier1 = @"Cell1";
    StarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier1];
    if(cell == nil)
    {
        cell = [[StarTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier1];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    NSString *imageStr = [data showStarPortrait:indexPath.row];
    NSURL *imageUrl = [NSURL URLWithString:imageStr];
    [cell.label1 setText:[data showStarName:indexPath.row]];
    [cell.imageView setImageWithURL:imageUrl];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    StarInfoViewController *starInfoVC = [[StarInfoViewController alloc] init];
    starInfoVC.starInfoId = [data showStarId:indexPath.row];
    starInfoVC.starInfoName = [data showStarName:indexPath.row];
    [self.navigationController pushViewController:starInfoVC animated:YES];
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
