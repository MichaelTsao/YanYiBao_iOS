//
//  WebViewController.m
//  YanYiBao
//
//  Created by 郭 旭 on 14-8-18.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate>
{
    UIWebView *webView;
    UIActivityIndicatorView *activityIndicator;
}

@end

@implementation WebViewController
@synthesize urlString = _urlString,titleString = _titleString;

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
        
        UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [shareBtn setFrame:CGRectMake(0, 0, 60, 30)];
        [shareBtn setTitle:@"后退" forState:UIControlStateNormal];
        [shareBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [shareBtn addTarget:self action:@selector(backWeb:) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc] init];
        [rightBtn setCustomView:shareBtn];
        self.navigationItem.rightBarButtonItem = rightBtn;
    }
    return self;
}

-(void)backWeb:(UIButton *)sender
{
    [webView goBack];
}

-(void)backController:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = _titleString;
    [self.view setBackgroundColor:[UIColor whiteColor]];
    //self.navigationController.navigationBar.translucent = NO;
    
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0,320, self.view.frame.size.height)];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:_urlString]];
    [self.view addSubview: webView];
    [webView setDelegate:self];
    [webView loadRequest:request];
    [self beginLoading];
}

-(void)beginLoading
{
    CGPoint viewCenter = CGPointMake(160, 180);
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
    [view setTag:101];
    [view setBackgroundColor:[UIColor whiteColor]];
    //[view setAlpha:0.2];
    [self.view addSubview:view];
    
    activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];
    [activityIndicator setCenter:viewCenter];
    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [self.view addSubview:activityIndicator];
    [activityIndicator startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    UIView *view = (UIView*)[self.view viewWithTag:101];
    [view removeFromSuperview];
    [activityIndicator stopAnimating];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    UIView *view = (UIView*)[self.view viewWithTag:101];
    [view removeFromSuperview];
    [activityIndicator stopAnimating];
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
