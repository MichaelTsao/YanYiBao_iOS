//
//  HuifuViewController.m
//  YanYiBao
//
//  Created by 郭 旭 on 14-8-9.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import "HuifuViewController.h"
#import "UIColor+Helper.h"

@interface HuifuViewController ()

@end

@implementation HuifuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.title = @"回复-过路的猫";
        UIImage *image = [UIImage imageNamed:@"back"];
        
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
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
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor colorWithHexString:@"#fcfcfc" withAlpha:1.0]];
    
    UIImage *image1 = [UIImage imageNamed:@"comm1"];
    UIImage *image2 = [UIImage imageNamed:@"comm2"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image1];
    [imageView setFrame:CGRectMake(0, 20, image1.size.width, image1.size.height)];
    [imageView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:imageView];
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:image2];
    [imageView1 setFrame:CGRectMake(0, 140, image2.size.width, image2.size.height)];
    //[imageView1 setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:imageView1];
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
