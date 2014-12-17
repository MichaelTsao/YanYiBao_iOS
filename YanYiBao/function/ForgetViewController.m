//
//  ForgetViewController.m
//  YanYiBao
//
//  Created by 郭 旭 on 14-8-10.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import "ForgetViewController.h"
#import "UIColor+Helper.h"

@interface ForgetViewController ()<UITextFieldDelegate>
{
    UITextField *text1;
    UITextField *text2;
}
@end

@implementation ForgetViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"找回密码";
        
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
    UIImage *image = [UIImage imageNamed:@"mima_di"];
    UIImage *image1 = [UIImage imageNamed:@"mima_btn"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [imageView setFrame:CGRectMake(0, 40, image.size.width, image.size.height)];
    [self.view addSubview:imageView];
    
    UILabel *label = [[UILabel alloc] init];
    [label setFrame:CGRectMake(10, 5, 140, 30)];
    [label setText:@"输入您的手机号码"];
    [label setFont:[UIFont systemFontOfSize:14]];
    [label setTextColor:[UIColor colorWithHexString:@"#797979" withAlpha:1.0]];
    [label setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:label];
    
    UILabel *label1 = [[UILabel alloc] init];
    [label1 setFrame:CGRectMake(10, 85, 240, 30)];
    [label1 setText:@"输入您的验证码:  (点击刷新验证码)"];
    [label1 setFont:[UIFont systemFontOfSize:14]];
    [label1 setTextColor:[UIColor colorWithHexString:@"#797979" withAlpha:1.0]];
    [label1 setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:label1];
    
    text1 = [[UITextField alloc] init];
    [text1 setFrame:CGRectMake(10, 40, 300, 40)];
    [text1 setPlaceholder:@"请输入手机号码"];
    text1.returnKeyType = UIReturnKeyDone;
    text1.delegate = self;
    //[text1 setBackgroundColor:[UIColor redColor]];
    [text1 setFont:[UIFont systemFontOfSize:14]];
    text1.tintColor = [UIColor colorWithHexString:@"#b5b6b6" withAlpha:1.0];
    [self.view addSubview:text1];
    
    text2 = [[UITextField alloc] init];
    [text2 setFrame:CGRectMake(10, 118, 300, 40)];
    [text2 setPlaceholder:@"请输入右侧验证码"];
    text2.returnKeyType = UIReturnKeyDone;
    text2.delegate = self;
    //[text2 setBackgroundColor:[UIColor redColor]];
    [text2 setFont:[UIFont systemFontOfSize:14]];
    text2.tintColor = [UIColor colorWithHexString:@"#b5b6b6" withAlpha:1.0];
    [self.view addSubview:text2];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(17, 180, image1.size.width, image1.size.height)];
    [btn setTitle:@"发送短信验证码" forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [btn setBackgroundImage:image1 forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

-(void)btnPress:(UIButton *)sender
{
    NSLog(@"发送短信验证码");
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
