//
//  SignViewController.m
//  YanYiBao
//
//  Created by 郭 旭 on 14-8-9.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import "SignViewController.h"
#import "UIColor+Helper.h"
#import "AFNetworking.h"
#import "AFHTTPClient.h"
#import "JSONKit.h"

@interface SignViewController() <UITextFieldDelegate>
{
    UITextField *text1;
    UITextField *text2;
    UITextField *text3;
    UITextField *text4;
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
    
    UIImage *image = [UIImage imageNamed:@"login_logo"];
//    UIImage *image1 = [UIImage imageNamed:@"login_user"];
    UIImage *btn_image = [UIImage imageNamed:@"login_bin"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [imageView setFrame:CGRectMake(135, 30, image.size.width, image.size.height)];
    [self.view addSubview:imageView];
    
//    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:image1];
//    [imageView1 setFrame:CGRectMake(0, 120, image1.size.width, image1.size.height)];
//    [self.view addSubview:imageView1];
    
    UILabel *label = [[UILabel alloc] init];
    [label setFrame:CGRectMake(10, 95, 120, 20)];
    [label setText:@"注册"];
    [label setFont:[UIFont systemFontOfSize:14]];
    [label setTextColor:[UIColor colorWithHexString:@"#797979" withAlpha:1.0]];
    [label setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:label];
    
    text1 = [[UITextField alloc] init];
    [text1 setFrame:CGRectMake(30, 120, 260, 45)];
    [text1 setPlaceholder:@"用户ID"];
    text1.returnKeyType = UIReturnKeyDone;
    text1.delegate = self;
    [text1 setFont:[UIFont systemFontOfSize:14]];
    text1.tintColor = [UIColor colorWithHexString:@"#b5b6b6" withAlpha:1.0];
    text1.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:text1];
    
    text2 = [[UITextField alloc] init];
    [text2 setFrame:CGRectMake(30, 170, 260, 45)];
    [text2 setPlaceholder:@"登录密码"];
    text2.returnKeyType = UIReturnKeyDone;
    text2.delegate = self;
    [text2 setFont:[UIFont systemFontOfSize:14]];
    text2.tintColor = [UIColor colorWithHexString:@"#b5b6b6" withAlpha:1.0];
    text2.borderStyle = UITextBorderStyleRoundedRect;
    text2.secureTextEntry = YES;
    [self.view addSubview:text2];
    
    text3 = [[UITextField alloc] init];
    [text3 setFrame:CGRectMake(30, 220, 260, 45)];
    [text3 setPlaceholder:@"确认密码"];
    text3.returnKeyType = UIReturnKeyDone;
    text3.delegate = self;
    [text3 setFont:[UIFont systemFontOfSize:14]];
    text3.tintColor = [UIColor colorWithHexString:@"#b5b6b6" withAlpha:1.0];
    text3.borderStyle = UITextBorderStyleRoundedRect;
    text3.secureTextEntry = YES;
    [self.view addSubview:text3];
    
    text4 = [[UITextField alloc] init];
    [text4 setFrame:CGRectMake(30, 270, 260, 45)];
    [text4 setPlaceholder:@"用户名字"];
    text4.returnKeyType = UIReturnKeyDone;
    text4.delegate = self;
    [text4 setFont:[UIFont systemFontOfSize:14]];
    text4.tintColor = [UIColor colorWithHexString:@"#b5b6b6" withAlpha:1.0];
    text4.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:text4];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(17, 340, btn_image.size.width, btn_image.size.height)];
    [btn setTitle:@"注册" forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [btn setBackgroundImage:btn_image forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btnCancle = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnCancle setFrame:CGRectMake(17, 400, btn_image.size.width, btn_image.size.height)];
    [btnCancle setTitle:@"取消" forState:UIControlStateNormal];
    [btnCancle.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [btnCancle setBackgroundColor:[UIColor grayColor]];
    [btnCancle addTarget:self action:@selector(btnCancle:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnCancle];
    
    /*
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
    */
}

-(void)btnPress:(UIButton *)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"有问题"
                                                    message:@""
                                                   delegate:self
                                          cancelButtonTitle:@"确认"
                                          otherButtonTitles:nil];
    
    if (![text2.text isEqualToString:text3.text]) {
        alert.message = @"两次密码不一样";
        [alert show];
        return;
    }
    if ([text1.text isEqualToString:@""]) {
        alert.message = @"用户名不可为空";
        [alert show];
        return;
    }
    if ([text2.text isEqualToString:@""]) {
        alert.message = @"密码不可为空";
        [alert show];
        return;
    }
    if ([text4.text isEqualToString:@""]) {
        alert.message = @"名字不可为空";
        [alert show];
        return;
    }
    
    NSString *path = @"/user/create";
    NSDictionary *param = @{@"user_id":text1.text, @"password":text2.text, @"name":text4.text};
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",HOSTURL]];
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:url];
    [client getPath:path parameters:param
            success:^(AFHTTPRequestOperation *operation, id responseObject){
                JSONDecoder *decoder = [[JSONDecoder alloc]init];
                NSDictionary *dic = [decoder objectWithData:responseObject];
                NSLog(@"%@", dic);
                int status = [[dic objectForKey:@"status"] intValue];
                if (status == 0) {
                    alert.message = @"注册成功";
                }else if (status == 2) {
                    alert.message = @"参数不可为空";
                }else if (status == 4) {
                    alert.message = @"用户ID已经存在";
                }else if (status == 5) {
                    alert.message = @"用户名字已经存在";
                }
                if (![alert.message isEqualToString:@""]) {
                    [alert show];
                }
                if (status == 0) {
                    [self dismissViewControllerAnimated:YES completion:nil];
                }
            }
            failure:^(AFHTTPRequestOperation *operation, NSError *error){
            }];
}

-(void)btnCancle:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
