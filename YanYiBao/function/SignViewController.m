//
//  SignViewController.m
//  YanYiBao
//
//  Created by 郭 旭 on 14-8-9.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import "SignViewController.h"
#import "UIColor+Helper.h"

@interface SignViewController ()<UITextFieldDelegate>
{
    UITextField *text1;
}
@end

@implementation SignViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"注册";
        
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
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIImage *image = [UIImage imageNamed:@"sign_top"];
    UIImage *image1 = [UIImage imageNamed:@"phone"];
    UIImage *btn_image = [UIImage imageNamed:@"login_bin"];
    UIImage *green_image = [UIImage imageNamed:@"btn_green"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [imageView setFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    [self.view addSubview:imageView];
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:image1];
    [imageView1 setFrame:CGRectMake(0, 80, image1.size.width, image1.size.height)];
    [self.view addSubview:imageView1];
    
    text1 = [[UITextField alloc] init];
    [text1 setFrame:CGRectMake(90, 80, 220, 45)];
    [text1 setPlaceholder:@"请输入您的手机号码"];
    text1.returnKeyType = UIReturnKeyDone;
    text1.delegate = self;
    //[text1 setBackgroundColor:[UIColor redColor]];
    [text1 setFont:[UIFont systemFontOfSize:14]];
    text1.tintColor = [UIColor colorWithHexString:@"#b5b6b6" withAlpha:1.0];
    [self.view addSubview:text1];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(17, 150, btn_image.size.width, btn_image.size.height)];
    [btn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [btn setBackgroundImage:btn_image forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:green_image];
    [imageView2 setFrame:CGRectMake(17, 200, green_image.size.width, green_image.size.height)];
    [self.view addSubview:imageView2];
    
    UILabel *label = [[UILabel alloc] init];
    [label setFrame:CGRectMake(50, 195, 100, 30)];
    [label setText:@"我已阅读并同意"];
    [label setFont:[UIFont systemFontOfSize:14]];
    [label setTextColor:[UIColor colorWithHexString:@"#797979" withAlpha:1.0]];
    [label setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:label];
    
    UILabel *label1 = [[UILabel alloc] init];
    [label1 setFrame:CGRectMake(155, 195, 100, 30)];
    [label1 setText:@"演艺宝用户协议"];
    [label1 setFont:[UIFont systemFontOfSize:14]];
    [label1 setTextColor:[UIColor colorWithHexString:@"#ff9900" withAlpha:1.0]];
    [label1 setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:label1];
    
}

-(void)btnPress:(UIButton *)sender
{
    NSLog(@"nihao");
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [text1 resignFirstResponder];
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [text1 resignFirstResponder];
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
