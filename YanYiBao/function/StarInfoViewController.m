//
//  StarInfoViewController.m
//  YanYiBao
//
//  Created by 郭 旭 on 14-10-19.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import "StarInfoViewController.h"
#import "AFNetworking.h"
#import "AFHTTPClient.h"
#import "UserInfoData.h"
#import "UIColor+Helper.h"

@interface StarInfoViewController ()
{
    ShowStarInfo *data;
}
@end

@implementation StarInfoViewController
@synthesize starInfoId = _starInfoId, starInfoName = _starInfoName;

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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _starInfoName;
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
    [UserInfoData showLoading:@"加载中"];
    [self sendRequest];
}

-(void)sendRequest
{
    NSString *path = @"/show/starInfo";
    NSString *star = [NSString stringWithFormat:@"%d",_starInfoId];
    NSDictionary *param = @{@"id":star};
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",HOSTURL]];
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:url];
    [client getPath:path parameters:param
            success:^(AFHTTPRequestOperation *operation, id responseObject){
                [UserInfoData hideLoading];
                [[UserInfoData shareInstance] decodeobjectShowStarInfo:responseObject];
                data = [UserInfoData shareInstance].showStarInfo;
                [self initView];
            }
            failure:^(AFHTTPRequestOperation *operation, NSError *error){
                NSLog(@" request faild , error == %@ ",error);
                [UserInfoData hideLoading];
                [UserInfoData alterShow:@"数据加载失败，请检查网络"];
            }];
}

-(void)initView
{
    UIImage *image = [UIImage imageNamed:@"avatar1"];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView setFrame:CGRectMake(10, 10, image.size.width, image.size.height)];
    NSString *urlimage = [data showStarInfoPortrait:0];
    NSURL *url = [NSURL URLWithString:urlimage];
    [imageView setImageWithURL:url];
    [self.view addSubview:imageView];
    
    CGRect frameLab = CGRectMake(100, 25, 200, 30);
    UILabel *label1 = [[UILabel alloc] init];
    [label1 setFrame:frameLab];
    [label1 setFont:[UIFont systemFontOfSize:15]];
    [label1 setBackgroundColor:[UIColor clearColor]];
    [label1 setText:[data showStarInfoName:0]];
    [label1 setTextColor:[UIColor colorWithHexString:@"#b5b6b6"withAlpha:1.0]];
    [self.view addSubview:label1];
    
    NSArray *array = [data showStarInfoPic:0];
    for (int i = 0; i < [array count]; i++) {
        NSString *urlimage = [array objectAtIndex:i];
        NSURL *url = [NSURL URLWithString:urlimage];
        NSInteger height = i/5;
        NSInteger width = i%5;
        UIImageView *picView = [[UIImageView alloc] init];
        [picView setFrame:CGRectMake(10 + (60 * width), 120 + (70 * height), 50, 50)];
        [picView setImageWithURL:url];
        [self.view addSubview:picView];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
