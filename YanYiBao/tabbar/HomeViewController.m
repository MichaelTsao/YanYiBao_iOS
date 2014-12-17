//
//  HomeViewController.m
//  YanYiBao
//
//  Created by 郭 旭 on 14-8-1.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import "HomeViewController.h"
#import "ContViewController.h"
#import "ATableViewCell.h"
#import "AFNetworking.h"
#import "AFHTTPClient.h"
#import "JSONKit.h"
#import "UserInfoData.h"
#import "UIColor+Helper.h"

@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    UIImageView *topView;
    UITableView *table1;
    ShowListData *showListData;
    NSString *searchStr;
    UITextField *text1;
    ShowSearchData *searchData;
    BOOL isSearch;
}

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //self.title = @"主页";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //navigationBar 返回按钮的颜色
    //[[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    isSearch = NO;
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIImage *top_ima = [UIImage imageNamed:@"Red_rec"];
    UIImage *logo_ima = [UIImage imageNamed:@"logo"];
    UIImage *search_ima = [UIImage imageNamed:@"choose"];
    UIImage *search_btn = [UIImage imageNamed:@"Search"];
    
    CGRect top_frame = CGRectMake(0, 0, 320, top_ima.size.height);
    CGRect logo_frame = CGRectMake(110, 30, logo_ima.size.width, logo_ima.size.height);
    CGRect search_frame = CGRectMake(10, 70, search_ima.size.width, search_ima.size.height);
    
    topView = [[UIImageView alloc] initWithImage:top_ima];
    [topView setFrame:top_frame];
    [self.view addSubview:topView];
    topView.userInteractionEnabled = YES;
    
    UIImageView *logoView = [[UIImageView alloc] initWithImage:logo_ima];
    [logoView setFrame:logo_frame];
    [topView addSubview:logoView];
    
    UIImageView *search_back = [[UIImageView alloc] initWithImage:search_ima];
    [search_back setFrame:search_frame];
    [topView addSubview:search_back];
    
    UIImageView *search = [[UIImageView alloc] initWithImage:search_btn];
    [search setFrame:CGRectMake(260, 5, search_btn.size.width, search_btn.size.height)];
    [search_back addSubview:search];
    
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [searchBtn setFrame:CGRectMake(260, 70, 43, 32)];
    [searchBtn setBackgroundColor:[UIColor clearColor]];
    [searchBtn addTarget:self action:@selector(searchBarPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:searchBtn];
    
    CGRect textFrame = CGRectMake(15, 70, 245, 30);
    text1 = [[UITextField alloc] initWithFrame:textFrame];
    [text1 setBackgroundColor:[UIColor clearColor]];
    [text1 setPlaceholder:@"搜索"];
    [text1 setFont:[UIFont systemFontOfSize:13]];
    text1.returnKeyType = UIReturnKeyDone;
    text1.delegate = self;
    [self.view addSubview:text1];
    
    [UserInfoData showLoading:@"加载中..."];
    [self sendRequest];
}

-(void)searchBarPress:(id)sender
{
    [self sendSearchRequest];
}

-(void)sendSearchRequest
{
    isSearch = YES;
    if (text1.text.length > 0) {
        [UserInfoData showLoading:@"加载中..."];
        NSString *path = @"/show/search";
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",HOSTURL]];
        AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:url];
        NSDictionary *parems = @{@"words":text1.text,};
        
        [client getPath:path parameters:parems success:^(AFHTTPRequestOperation *operation, id responseObject)
         {
             [UserInfoData hideLoading];
             NSLog(@"success obj == %@",responseObject);
              [[UserInfoData shareInstance] decodeObjectShowSearchData:responseObject];
             searchData = [UserInfoData shareInstance].showSearchData;
             [self showSearchData];
             
         }failure:^(AFHTTPRequestOperation *operation, NSError *error){
             NSLog(@" request faild , error == %@ ",error);
         }];
    }else{
        [UserInfoData alterShow:@"搜索信息为空，请输入搜索信息"];
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self modelViewLoad];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField;
{
    //NSLog(@"%@",searchBar.text);
    if (text1.text.length > 0) {
        [UserInfoData showLoading:@"加载中..."];
        [self sendSearchRequest];
        [self removeModelView];
    }else{
        [UserInfoData alterShow:@"搜索信息为空，请输入搜索信息"];
        [self removeModelView];
    }
    [text1 resignFirstResponder];
    return YES;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (![text1 isExclusiveTouch])
    {
        [text1 resignFirstResponder];
        [self removeModelView];
    }
}

-(void)modelViewLoad
{
    CGRect frame = CGRectMake(0, 108, self.view.frame.size.width, self.view.frame.size.height-80);
    UIView *modelView = [[UIView alloc] init];
    [modelView setFrame:frame];
    [modelView setTag:401];
    [modelView setBackgroundColor:[UIColor colorWithHexString:@"#dddddd" withAlpha:0.6]];
    [self.view addSubview:modelView];
}

-(void)removeModelView
{
    UIView *view = (UIView*)[self.view viewWithTag:401];
    [view removeFromSuperview];
}

-(void)showSearchData
{
    [table1 reloadData];
}

-(void)sendRequest
{
    NSString *path = @"/show/list";
    NSDictionary *param = nil;
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",HOSTURL]];
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:url];
    [client getPath:path parameters:param
            success:^(AFHTTPRequestOperation *operation, id responseObject){
                [UserInfoData hideLoading];
                NSLog(@"请求成功");
                [[UserInfoData shareInstance] decodeObjectShowListData:responseObject];
                showListData = [UserInfoData shareInstance].showListData;
                [self initView];
            }
            failure:^(AFHTTPRequestOperation *operation, NSError *error){
                NSLog(@" request faild , error == %@ ",error);
                [UserInfoData hideLoading];
                [UserInfoData alterShow:@"数据加载失败，请检查网络"];
                [self initView];
            }];
}

-(void)initView
{
    CGRect table_frame = CGRectMake(0, 110, 320, self.view.frame.size.height-160);
    
    table1 = [[UITableView alloc] initWithFrame:table_frame style:UITableViewStylePlain];
    [table1 setDelegate:self];
    [table1 setDataSource:self];
    table1.rowHeight = 120;
    //table1.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:table1];
}

-(void)btnPress:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if (sender.selected) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 108, 320, self.view.frame.size.height-44)];
        [view setTag:101];
        [self.view addSubview:view];
        
        UIImage *image = [UIImage imageNamed:@"repert_total"];
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        [imageView setFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        [view addSubview:imageView];
        
    }else{
        UIView *view = (UIView*)[self.view viewWithTag:101];
        [view removeFromSuperview];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (isSearch == NO) {
        return [showListData listCount];
    }else{
        return [searchData searchCount];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIImage *image = [UIImage imageNamed:@"Icon"];

    static NSString *CellIdentifier1 = @"Cell1";
    ATableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier1];
    if(cell == nil)
    {
        cell = [[ATableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier1];
        //[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    if (isSearch == NO) {
        NSString *urlimage = [showListData showListPicture:indexPath.row];
        NSURL *url = [NSURL URLWithString:urlimage];
        [cell.contImage setImageWithURL:url placeholderImage:image];
        [cell.titleLab setText:[showListData showListName:indexPath.row]];
        [cell.timeLab setText:[showListData showListTime:indexPath.row]];
        [cell.placeLab setText:[showListData showListPlace:indexPath.row]];
        [cell.likeLab setText:[showListData showListRate:indexPath.row]];
    }else{
        NSString *urlimage = [searchData showSearchPicture:indexPath.row];
        NSURL *url = [NSURL URLWithString:urlimage];
        [cell.contImage setImageWithURL:url placeholderImage:image];
        [cell.titleLab setText:[searchData showSearchName:indexPath.row]];
        [cell.timeLab setText:[searchData showSearchTime:indexPath.row]];
        [cell.placeLab setText:[searchData showSearchPlace:indexPath.row]];
        [cell.likeLab setText:[searchData showSearchRate:indexPath.row]];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ContViewController *contVC = [[ContViewController alloc] init];
    contVC.programID = [showListData showListId:indexPath.row];
    contVC.titleStr = [showListData showListName:indexPath.row];
    [self.tabBarController.tabBar setHidden:YES];
    [self.navigationController pushViewController:contVC animated:YES];
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

//设置状态栏颜色
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
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
