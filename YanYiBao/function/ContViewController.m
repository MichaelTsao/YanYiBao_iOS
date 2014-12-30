//
//  ContViewController.m
//  YanYiBao
//
//  Created by 郭 旭 on 14-8-6.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import "ContViewController.h"
#import "UIColor+Helper.h"
#import "TalkViewController.h"
#import "ShareView.h"
#import "HuifuViewController.h"
#import "LoginViewController.h"
#import "WebViewController.h"
#import "JiemuViewController.h"
#import "StarViewController.h"
#import "JuzhaoViewController.h"
#import "OpinionViewController.h"
#import "AFNetworking.h"
#import "AFHTTPClient.h"
#import "JSONKit.h"
#import "UserInfoData.h"

@interface ContViewController ()<UIScrollViewDelegate>
{
    UIScrollView *scrollView;
    ShareView *shareView;
    BOOL isFlag;
    ShowInfoData *data;
    UIImageView *backgroundImage;
}

@end

@implementation ContViewController
@synthesize programID = _programID, titleStr = _titleStr;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //self.navigationItem.title = title;
        UIImage *image = [UIImage imageNamed:@"back"];
        UIImage *image1 = [UIImage imageNamed:@"xq_share"];
        
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        [backButton setBackgroundImage:image forState:UIControlStateNormal];
        [backButton addTarget:self action:@selector(backController:) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem * leftButton = [[UIBarButtonItem alloc] init];
        [leftButton setCustomView:backButton];
        self.navigationItem.leftBarButtonItem = leftButton;
        
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

-(void)backController:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;

    // Do any additional setup after loading the view.
    self.title = _titleStr;
    self.navigationController.navigationBar.translucent = NO;
    [self.view setBackgroundColor:[UIColor whiteColor]];
    isFlag = NO;
    
    CGRect scrollFrame = CGRectMake(0, 0, 320, self.view.frame.size.height);
    scrollView = [[UIScrollView alloc] initWithFrame:scrollFrame];
    [scrollView setContentSize:CGSizeMake(320,650)];
    [scrollView setDelegate:self];
    [self.view addSubview:scrollView];
    //[self initView];
    
    [UserInfoData showLoading:@"加载中..."];
    [self sendRequest];
}

-(void)sendRequest
{
    NSString *path = @"/show/info";
    NSString *proId = [NSString stringWithFormat:@"%ld",(long)_programID];
    NSDictionary *param = @{@"id":proId};
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",HOSTURL]];
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:url];
    [client getPath:path parameters:param
            success:^(AFHTTPRequestOperation *operation, id responseObject){
                [UserInfoData hideLoading];
                [[UserInfoData shareInstance] decodeObjectShowInfoData:responseObject];
                data = [UserInfoData shareInstance].showInfoData;
                [self initView];
            }
            failure:^(AFHTTPRequestOperation *operation, NSError *error){
                NSLog(@" request faild , error == %@ ",error);
                [UserInfoData hideLoading];
                [UserInfoData alterShow:@"数据加载失败，请检查网络"];
                [self initView];
            }];
}

- (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur {
    CIImage *inputImage = [CIImage imageWithCGImage:image.CGImage];
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"
                                  keysAndValues:kCIInputImageKey, inputImage,
                        @"inputRadius", @(blur), nil];
    
    CIImage *outputImage = filter.outputImage;
    CIContext *context = [CIContext contextWithOptions:nil]; // save it to self.context
    CGImageRef outImage = [context createCGImage:outputImage fromRect:[outputImage extent]];
    return [UIImage imageWithCGImage:outImage];
}

-(void)initView
{
    UIImage *image2 = [UIImage imageNamed:@"btns3"];
    UIImage *image3 = [UIImage imageNamed:@"pinglun"];
    UIImage *image4 = [UIImage imageNamed:@"xq_btn"];
    UIImage *image6 = [UIImage imageNamed:@"rateStar_back"];
    
    CGRect image_frame = CGRectMake(-10, -10, 340, 245);
    CGRect image_frame1 = CGRectMake(0, 232, 320, image2.size.height);
    CGRect image_frame2 = CGRectMake(0, 470, image3.size.width, image3.size.height);
    
//    UIImageView *imageVeiw = [[UIImageView alloc] initWithImage:image1];
//    [imageVeiw setFrame:image_frame];
//    [scrollView addSubview:imageVeiw];
    
    NSString *bgImaStr = [data showInfoBackground];
    NSURL *url = [NSURL URLWithString:bgImaStr];
    
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:imageData];
    
    backgroundImage = [[UIImageView alloc] init];
    [backgroundImage setFrame:image_frame];
    [backgroundImage setImage:[self blurryImage:image withBlurLevel:3.0]];
    [scrollView addSubview:backgroundImage];
    
    NSString *postImaStr = [data showInfoPicture];
    NSURL *postUrl = [NSURL URLWithString:postImaStr];
    
    UIImageView *posterImage = [[UIImageView alloc] init];
    [posterImage setFrame:CGRectMake(23, 30, 138, 186)];
    [posterImage setImageWithURL:postUrl];
    posterImage.layer.masksToBounds = YES;
    posterImage.layer.borderColor = [UIColor whiteColor].CGColor;
    posterImage.layer.borderWidth = 2;
    [backgroundImage addSubview:posterImage];

    NSString *rate = [data showInfoRate];
    
    UILabel *label1 = [[UILabel alloc] init];
    [label1 setFrame:CGRectMake(270, 25, 45, 25)];
    [label1 setText:[NSString stringWithFormat:@"%@分",rate]];
    [label1 setFont:[UIFont systemFontOfSize:15]];
    [label1 setTextColor:[UIColor colorWithHexString:@"#ffc000" withAlpha:1.0]];
    [label1 setBackgroundColor:[UIColor clearColor]];
    [backgroundImage addSubview:label1];
    
    UIImageView *rateStar_back = [[UIImageView alloc] init];
    [rateStar_back setFrame:CGRectMake(175, 30, image6.size.width, image6.size.height)];
    [rateStar_back setImage:image6];
    [backgroundImage addSubview:rateStar_back];
    
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber * nRate = [f numberFromString:rate];
    
    for (int i=0; i<5; i++) {
        CGFloat x = 183 + 12 * i;
        
        UIImage *image_star = nil;
        if (i < [nRate intValue]) {
            image_star = [UIImage imageNamed:@"rateStar_1"];
        }else{
            image_star = [UIImage imageNamed:@"rateStar_0"];
        }
        
        UIImageView *rateStar = [[UIImageView alloc] init];
        [rateStar setFrame:CGRectMake(x, 32, image_star.size.width, image_star.size.height)];
        [rateStar setImage:image_star];
        [backgroundImage addSubview:rateStar];
    }
    
    UILabel *label2 = [[UILabel alloc] init];
    [label2 setFrame:CGRectMake(170, 55, 120, 12)];
    NSString *rateStr = [data showInfoRateMan];
    [label2 setText:[NSString stringWithFormat:@"已有%@人参与评分",rateStr]];
    [label2 setFont:[UIFont systemFontOfSize:11]];
    [label2 setTextColor:[UIColor colorWithHexString:@"#ffffff" withAlpha:1.0]];
    [label2 setBackgroundColor:[UIColor clearColor]];
    [backgroundImage addSubview:label2];
    
    for (int i = 0; i < 4; i++) {
        UILabel *label = [[UILabel alloc] init];
        [label setFrame:CGRectMake(170, 98 +(i * 15), 32, 12)];
        [label setFont:[UIFont systemFontOfSize:11]];
        [label setTextColor:[UIColor colorWithHexString:@"#ffffff" withAlpha:1.0]];
        [label setBackgroundColor:[UIColor clearColor]];
        [backgroundImage addSubview:label];
        switch (i) {
            case 0:
                [label setText:@"类型:"];
                break;
            case 1:
                [label setText:@"场馆:"];
                break;
            case 2:
                [label setText:@"时间:"];
                break;
            case 3:
                [label setText:@"价格:"];
                break;
                
            default:
                break;
        }
    }
    
    CGRect btn_frame = CGRectMake(200, 185, image4.size.width, image4.size.height);
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:[UIColor clearColor]];
    [btn setBackgroundImage:image4 forState:UIControlStateNormal];
    [btn setFrame:btn_frame];
    [btn addTarget:self action:@selector(btnPress1:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:btn];
    
    for (int i = 0; i < 4; i++) {
        UILabel *label = [[UILabel alloc] init];
        [label setFrame:CGRectMake(203, 98 +(i * 15), 110, 12)];
        CGFloat f = 11;
        if (i == 2) {
            f = 9;
        }
        [label setFont:[UIFont systemFontOfSize:f]];
        [label setTextColor:[UIColor colorWithHexString:@"#ffffff" withAlpha:1.0]];
        [label setBackgroundColor:[UIColor clearColor]];
        label.lineBreakMode = NSLineBreakByWordWrapping;
        [scrollView addSubview:label];
        switch (i) {
            case 0:
                [label setText:[data showInfoType]];
                break;
            case 1:
                [label setText:[data showInfoPlace]];
                break;
            case 2:
                [label setText:[data showInfoTime]];
                break;
            case 3:
                [label setText:[data showInfoPrice]];
                break;
                
            default:
                break;
        }
    }
    
    UIImageView *imageVeiw1 = [[UIImageView alloc] initWithImage:image2];
    [imageVeiw1 setFrame:image_frame1];
    [scrollView addSubview:imageVeiw1];
    
    for (int i = 0; i < 6; i++) {
        NSInteger height = i/3;
        NSInteger width = i%3;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundColor:[UIColor clearColor]];
        [btn setTag:i];
        [btn setFrame:CGRectMake(0+(width * 106), 232+(height * 106), 106, 106)];
        [btn addTarget:self action:@selector(contBtnPress:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:btn];
    }
    
    UIButton *imageVeiw2 = [[UIButton alloc] init];
    [imageVeiw2 setFrame:image_frame2];
    [imageVeiw2 setImage:image3 forState:UIControlStateNormal];
    [imageVeiw2 addTarget:self action:@selector(commentPress:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:imageVeiw2];
}

-(void)contBtnPress:(UIButton *)sender
{
    switch (sender.tag) {
        case 0:
        {
            NSLog(@"观演指南");
            WebViewController *webView = [[WebViewController alloc] init];
            webView.urlString = [data showInfoGuideUrl];
            webView.titleString = @"观演指南";
            [self.navigationController pushViewController:webView animated:YES];
        }
            
            break;
        case 1:
        {
             NSLog(@"节目单");
            JiemuViewController *jieVC = [[JiemuViewController alloc] init];
            jieVC.programId = [data showInfoId];
            [self.navigationController pushViewController:jieVC animated:YES];
        }
           
            break;

        case 2:
        {
            NSLog(@"精彩剧照");
            JuzhaoViewController *jzVC = [[JuzhaoViewController alloc] init];
            jzVC.galleryId = [data showInfoId];
            [self.navigationController pushViewController:jzVC animated:YES];
            
        }
            
            break;

        case 3:
        {
            NSLog(@"明星追踪");
            StarViewController *starVC = [[StarViewController alloc] init];
            starVC.starId = [data showInfoId];
            [self.navigationController pushViewController:starVC animated:YES];
        }
            break;

        case 4:
        {
            NSLog(@"疯狂抢购");
            WebViewController *webView1 = [[WebViewController alloc] init];
            webView1.urlString = [data showInfoBuyUrl];
            webView1.titleString = @"疯狂抢购";
            [self.navigationController pushViewController:webView1 animated:YES];
        }
            break;
            
        case 5:
        {
            NSLog(@"建言");
            OpinionViewController *opinionVC = [[OpinionViewController alloc] init];
            [self.navigationController pushViewController:opinionVC animated:YES];
            break;
        }
            
        default:
            break;
    }
}

-(void)btnPress1:(UIButton *)sender
{
    NSLog(@"评论");
//    LoginViewController *loginVC = [[LoginViewController alloc] init];
//    [self.navigationController pushViewController:loginVC animated:YES];
    
    TalkViewController *talkVC = [[TalkViewController alloc] init];
    talkVC.title = self.title;
    talkVC.programID = self.programID;
    [self.navigationController pushViewController:talkVC animated:YES];
}

-(void)btnPress2:(UIButton *)sender
{
    NSLog(@"吐槽");
    TalkViewController *talkVC = [[TalkViewController alloc] init];
    [self.navigationController pushViewController:talkVC animated:YES];
}

-(void)commentPress:(UIButton *)sender
{
    NSLog(@"hahahhacommm");
    HuifuViewController *huifuVC = [[HuifuViewController alloc] init];
    [self.navigationController pushViewController:huifuVC animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
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
