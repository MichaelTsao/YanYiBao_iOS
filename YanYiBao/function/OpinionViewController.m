//
//  OpinionViewController.m
//  ZCStrategy
//
//  Created by 郭 旭 on 14-4-11.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import "OpinionViewController.h"
#import "AFHTTPClient.h"
#import "UserInfoData.h"
#import "UIColor+Helper.h"
//#import "UIViewController+MMDrawerController.h"

@interface OpinionViewController () <UITextViewDelegate,UITextFieldDelegate,UIAlertViewDelegate>
{
    UITextView *textView1;
    UILabel *textLab;
    UITextField *text1;
}
@end

@implementation OpinionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"意见反馈";
        UIImage *image = [UIImage imageNamed:@"back"];
        
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [backButton setFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        [backButton setBackgroundImage:image forState:UIControlStateNormal];
        [backButton.titleLabel setFont:[UIFont systemFontOfSize:16]];
        [backButton addTarget:self action:@selector(backController:) forControlEvents:UIControlEventTouchUpInside];
        //[backButton setTitle:@"返回" forState:UIControlStateNormal];
        UIBarButtonItem * leftButton = [[UIBarButtonItem alloc] init];
        [leftButton setCustomView:backButton];
        self.navigationItem.leftBarButtonItem = leftButton;
        
        UIButton *subButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [subButton setFrame:CGRectMake(0, 0, 40, 44)];
        [subButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [subButton addTarget:self action:@selector(submitPress:) forControlEvents:UIControlEventTouchUpInside];
        [subButton setTitle:@"提交" forState:UIControlStateNormal];
        [subButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        UIBarButtonItem * rightButton = [[UIBarButtonItem alloc] init];
        [rightButton setCustomView:subButton];
        self.navigationItem.rightBarButtonItem = rightButton;
    }
    return self;
}

-(void)backController:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)submitPress:(UIButton *)sender
{
    NSLog(@"submit finishde");
    if (textView1.text.length > 0) {
        [UserInfoData showLoading:@"加载中..."];
        NSString *path = @"test/index.php?r=mobyouxi/getfankui";
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",HOSTURL]];
        AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:url];
        NSDictionary *parems = @{@"content":textView1.text,
                                 @"contact":text1.text
                                 };
        
        [client postPath:path parameters:parems success:^(AFHTTPRequestOperation *operation, id responseObject)
         {
             [UserInfoData hideLoading];
             NSLog(@"success obj == %@",responseObject);
             //NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
             
             UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示" message:@"提交成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
             [alter show];
         }failure:^(AFHTTPRequestOperation *operation, NSError *error){
             NSLog(@" request faild , error == %@ ",error);
         }];
    }else{
        [UserInfoData alterShow:@"反馈信息为空，请输入反馈信息"];
    }
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [textView1 becomeFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationController.navigationBar.translucent = NO;
    
    UIImage *image = [UIImage imageNamed:@"textView"];
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView setFrame:CGRectMake(5, 10, image.size.width, image.size.height)];
    [imageView setImage:image];
    [self.view addSubview:imageView];
    
    CGRect textViewFrame = CGRectMake(6, 11, image.size.width-2, image.size.height-2);
    textView1 = [[UITextView alloc] initWithFrame:textViewFrame];
    //[textView1 setBackgroundColor:[UIColor colorWithHexString:@"#b5b6b6" withAlpha:1.0]];
    [textView1.layer setMasksToBounds:YES];
    [textView1.layer setCornerRadius:3];
    textView1.returnKeyType = UIReturnKeyDone;
    textView1.delegate = self;
    textView1.tintColor = [UIColor colorWithHexString:@"#b5b6b6" withAlpha:1.0];
    [self.view addSubview:textView1];
    
    CGRect labelFrame = CGRectMake(6, 0, 180, 30);
    textLab = [[UILabel alloc] init];
    [textLab setFrame:labelFrame];
    [textLab setText:@"您的意见对我们来说很宝贵."];
    [textLab setFont:[UIFont systemFontOfSize:14]];
    [textLab setTextColor:[UIColor colorWithHexString:@"#b5b6b6" withAlpha:1.0]];
    [textLab setBackgroundColor:[UIColor clearColor]];
    [textView1 addSubview:textLab];

    CGRect textFrame = CGRectMake(10, 160, 300, 30);
    text1 = [[UITextField alloc] initWithFrame:textFrame];
    //[text1 setBackgroundColor:[UIColor redColor]];
    text1.tintColor = [UIColor colorWithHexString:@"#b5b6b6" withAlpha:1.0];
    [text1 setPlaceholder:@"留下QQ号或E-mail方便与你联系"];
    [text1.layer setMasksToBounds:YES];
    [text1.layer setCornerRadius:3];
    text1.returnKeyType = UIReturnKeyDone;
    text1.delegate = self;
    text1.borderStyle = UITextBorderStyleRoundedRect;
    [text1 setFont:[UIFont systemFontOfSize:14]];
    [self.view addSubview:text1];
    
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([text1 isFirstResponder]) {
        if ([[UIScreen mainScreen] bounds].size.height < 500) {
            [self.view setCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2+60)];
        }
    }
    [text1 resignFirstResponder];
    [textView1 resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [text1 resignFirstResponder];
    if ([[UIScreen mainScreen] bounds].size.height < 500) {
        [self.view setCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2+60)];
    }
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField;
{
    if ([[UIScreen mainScreen] bounds].size.height < 500) {
        [self.view setCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2+30)];
    }
    return YES;
}

-(void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length > 0) {
        [textLab setHidden:YES];
    }else{
        [textLab setHidden:NO];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
