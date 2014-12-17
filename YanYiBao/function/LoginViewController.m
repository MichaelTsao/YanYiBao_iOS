//
//  LoginViewController.m
//  YanYiBao
//
//  Created by 郭 旭 on 14-8-9.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import "LoginViewController.h"
#import "UIColor+Helper.h"
#import "ForgetViewController.h"
#import "SignViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>
{
    UITextField *text1;
    UITextField *text2;
}
@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"登录";
        
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
    
    UIImage *image = [UIImage imageNamed:@"login_logo"];
    UIImage *image1 = [UIImage imageNamed:@"login_user"];
    UIImage *btn_image = [UIImage imageNamed:@"login_bin"];
    UIImage *third_image = [UIImage imageNamed:@"login_third"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [imageView setFrame:CGRectMake(135, 30, image.size.width, image.size.height)];
    [self.view addSubview:imageView];
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:image1];
    [imageView1 setFrame:CGRectMake(0, 120, image1.size.width, image1.size.height)];
    [self.view addSubview:imageView1];
    
    UILabel *label = [[UILabel alloc] init];
    [label setFrame:CGRectMake(10, 95, 120, 20)];
    [label setText:@"演艺宝用户登录"];
    [label setFont:[UIFont systemFontOfSize:14]];
    [label setTextColor:[UIColor colorWithHexString:@"#797979" withAlpha:1.0]];
    [label setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:label];
    
    UILabel *label1 = [[UILabel alloc] init];
    [label1 setFrame:CGRectMake(10, self.view.frame.size.height-155, 120, 20)];
    [label1 setText:@"其他登录方式"];
    [label1 setFont:[UIFont systemFontOfSize:14]];
    [label1 setTextColor:[UIColor colorWithHexString:@"#797979" withAlpha:1.0]];
    [label1 setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:label1];
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:third_image];
    [imageView2 setFrame:CGRectMake(0, self.view.frame.size.height-130, third_image.size.width, third_image.size.height)];
    [self.view addSubview:imageView2];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(17, 230, btn_image.size.width, btn_image.size.height)];
    [btn setTitle:@"立即登录" forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [btn setBackgroundImage:btn_image forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setFrame:CGRectMake(10, 280, 70, 30)];
    [btn1.titleLabel setTextColor:[UIColor redColor]];
    [btn1 setTitle:@"忘记密码" forState:UIControlStateNormal];
    [btn1.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [btn1 setTitleColor:[UIColor colorWithHexString:@"#ff9900" withAlpha:1.0] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btnPress1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setFrame:CGRectMake(240, 280, 70, 30)];
    [btn2 setTintColor:[UIColor redColor]];
    [btn2 setTitle:@"马上注册 >" forState:UIControlStateNormal];
    [btn2.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [btn2 setTitleColor:[UIColor colorWithHexString:@"#ff9900" withAlpha:1.0] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btnPress2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    text1 = [[UITextField alloc] init];
    [text1 setFrame:CGRectMake(50, 120, 260, 45)];
    [text1 setPlaceholder:@"手机号/邮箱/用户名"];
    text1.returnKeyType = UIReturnKeyDone;
    text1.delegate = self;
    [text1 setFont:[UIFont systemFontOfSize:14]];
    text1.tintColor = [UIColor colorWithHexString:@"#b5b6b6" withAlpha:1.0];
    [self.view addSubview:text1];
    
    text2 = [[UITextField alloc] init];
    [text2 setFrame:CGRectMake(50, 165, 260, 45)];
    [text2 setPlaceholder:@"登录密码"];
    text2.returnKeyType = UIReturnKeyDone;
    text2.delegate = self;
    [text2 setFont:[UIFont systemFontOfSize:14]];
    text2.tintColor = [UIColor colorWithHexString:@"#b5b6b6" withAlpha:1.0];
    [self.view addSubview:text2];

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [text1 resignFirstResponder];
    [text2 resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [text1 resignFirstResponder];
    [text2 resignFirstResponder];
    return YES;
}

-(void)btnPress:(UIButton *)sender
{
    NSLog(@"立即登录");
}

-(void)btnPress1:(UIButton *)sender
{
    ForgetViewController *forgetVC = [[ForgetViewController alloc] init];
    [self.navigationController pushViewController:forgetVC animated:YES];
}

-(void)btnPress2:(UIButton *)sender
{
    SignViewController *signVC = [[SignViewController alloc] init];
    [self.navigationController pushViewController:signVC animated:YES];
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
