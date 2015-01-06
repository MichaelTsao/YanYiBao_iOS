//
//  JuzhaoViewController.m
//  YanYiBao
//
//  Created by 郭 旭 on 14-8-22.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import "JuzhaoViewController.h"
#import "UIColor+Helper.h"
#import "AFHTTPClient.h"
#import "UserInfoData.h"
#import "JmTableViewCell.h"
#import "AFNetworking.h"
#import "ShareView.h"

@interface JuzhaoViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    UIScrollView *scrollView;
    UITableView *table1;
    ShowGalleryData *galleryData;
    BOOL isFlag;
    ShareView *shareView;
}
@end

@implementation JuzhaoViewController
@synthesize galleryId = _galleryId;

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
        
        UIImage *image1 = [UIImage imageNamed:@"xq_share"];
        UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [shareBtn setFrame:CGRectMake(0, 0, image1.size.width, image1.size.height)];
        [shareBtn setBackgroundImage:image1 forState:UIControlStateNormal];
        [shareBtn addTarget:self action:@selector(sharePress:) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc] init];
        [rightBtn setCustomView:shareBtn];
        self.navigationItem.rightBarButtonItem = rightBtn;
    }
    return self;
}

-(void)sharePress:(UIButton *)sender
{
    NSLog(@"rightBtn");
    sender.selected = !sender.selected;
    if (isFlag == NO) {
        isFlag = YES;
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
        [view setTag:101];
        [view setBackgroundColor:[UIColor colorWithHexString:@"#aaaaaa" withAlpha:0.2]];
        //[view setAlpha:0.2];
        [self.view addSubview:view];
        
        shareView = [[ShareView alloc] init];
        if ([[UIScreen mainScreen] bounds].size.height > 500) {
            [shareView setFrame:CGRectMake(0, 190, 320, 0)];
        }else{
            [shareView setFrame:CGRectMake(0, 104, 320, 0)];
        }
        [view addSubview:shareView];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:CGRectMake(0, view.frame.size.height -60, 320, 60)];
        [btn setBackgroundColor:[UIColor clearColor]];
        [btn addTarget:self action:@selector(shareBtn:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn];
    }else{
        isFlag = NO;
        UIView *view = (UIView*)[self.view viewWithTag:101];
        [view removeFromSuperview];
    }
}

-(void)shareBtn:(UIButton *)sender
{
    isFlag = NO;
    UIView *view = (UIView*)[self.view viewWithTag:101];
    [view removeFromSuperview];
}

-(void)backController:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"精彩剧照";
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self sendRequest];
}

-(void)sendRequest
{
    NSString *path = @"/show/gallery";
    NSString *juzhao = [NSString stringWithFormat:@"%ld",(long)_galleryId];
    NSDictionary *param = @{@"id":juzhao};
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",HOSTURL]];
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:url];
    [client getPath:path parameters:param
            success:^(AFHTTPRequestOperation *operation, id responseObject){
                [UserInfoData hideLoading];
                [[UserInfoData shareInstance] decodeObjectShowGalleryData:responseObject];
                galleryData = [UserInfoData shareInstance].showGalleryData;
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
    table1.rowHeight = 88;
    //table1.rowHeight = UITableViewAutomaticDimension;
    table1.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:table1];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [galleryData galleryCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier1 = @"Cell1";
    JmTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier1];
    if(cell == nil)
    {
        cell = [[JmTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier1];
        //[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    NSString *imageStr = [galleryData galleryUrl:indexPath.row];
    NSURL *imageUrl = [NSURL URLWithString:imageStr];
    [cell loadImage:imageUrl];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 320 * [[galleryData galleryHeight:indexPath.row] intValue] / [[galleryData galleryWidth:indexPath.row] intValue];
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
