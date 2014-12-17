//
//  TalkViewController.m
//  YanYiBao
//
//  Created by 郭 旭 on 14-8-7.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import "TalkViewController.h"
#import "UIColor+Helper.h"
#import "AFNetworking.h"
#import "AFHTTPClient.h"

@interface TalkViewController ()<UITextViewDelegate>
{
    UITextView *textView1;
    UILabel *textLab;
    NSNumber *rate_value;
    UIButton *btn1;
    UIButton *btn2;
    UIButton *btn3;
    UIButton *btn4;
    UIButton *btn5;
}
@end

@implementation TalkViewController
@synthesize programID = _programID;

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
        rate_value = [NSNumber numberWithInt:0];
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
    [self.view setBackgroundColor:[UIColor colorWithHexString:@"#f7f8f8" withAlpha:1.0]];
    
    UIImage *image = [UIImage imageNamed:@"comment_star_gray"];
    UIImage *image_star = [UIImage imageNamed:@"comment_star"];
    UIImage *btn_image = [UIImage imageNamed:@"login_bin"];
    
    CGRect text_frame = CGRectMake(0, 70, 320, 100);
    
    btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setFrame:CGRectMake(40, 18, image.size.width, image.size.height)];
    [btn1 setBackgroundImage:image forState:UIControlStateNormal];
    [btn1 setBackgroundImage:image_star forState:UIControlStateSelected];
    [btn1 addTarget:self action:@selector(changeRate:) forControlEvents:UIControlEventTouchUpInside];
    btn1.tag = 1;
    [self.view addSubview:btn1];
    
    btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setFrame:CGRectMake(90, 18, image.size.width, image.size.height)];
    [btn2 setBackgroundImage:image forState:UIControlStateNormal];
    [btn2 setBackgroundImage:image_star forState:UIControlStateSelected];
    [btn2 addTarget:self action:@selector(changeRate:) forControlEvents:UIControlEventTouchUpInside];
    btn2.tag = 2;
    [self.view addSubview:btn2];
    
    btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn3 setFrame:CGRectMake(140, 18, image.size.width, image.size.height)];
    [btn3 setBackgroundImage:image forState:UIControlStateNormal];
    [btn3 setBackgroundImage:image_star forState:UIControlStateSelected];
    [btn3 addTarget:self action:@selector(changeRate:) forControlEvents:UIControlEventTouchUpInside];
    btn3.tag = 3;
    [self.view addSubview:btn3];
    
    btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn4 setFrame:CGRectMake(190, 18, image.size.width, image.size.height)];
    [btn4 setBackgroundImage:image forState:UIControlStateNormal];
    [btn4 setBackgroundImage:image_star forState:UIControlStateSelected];
    [btn4 addTarget:self action:@selector(changeRate:) forControlEvents:UIControlEventTouchUpInside];
    btn4.tag = 4;
    [self.view addSubview:btn4];
    
    btn5 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn5 setFrame:CGRectMake(240, 18, image.size.width, image.size.height)];
    [btn5 setBackgroundImage:image forState:UIControlStateNormal];
    [btn5 setBackgroundImage:image_star forState:UIControlStateSelected];
    [btn5 addTarget:self action:@selector(changeRate:) forControlEvents:UIControlEventTouchUpInside];
    btn5.tag = 5;
    [self.view addSubview:btn5];
    
    textView1 = [[UITextView alloc] initWithFrame:text_frame];
    [textView1.layer setMasksToBounds:YES];
    [textView1.layer setCornerRadius:3];
    textView1.returnKeyType = UIReturnKeyDone;
    textView1.delegate = self;
    [textView1 setFont:[UIFont systemFontOfSize:14]];
    textView1.tintColor = [UIColor colorWithHexString:@"#b5b6b6" withAlpha:1.0];
    [self.view addSubview:textView1];
    
    CGRect labelFrame = CGRectMake(6, 0, 180, 30);
    textLab = [[UILabel alloc] init];
    [textLab setFrame:labelFrame];
    [textLab setText:@"留下您的口水...至少输入6字"];
    [textLab setFont:[UIFont systemFontOfSize:14]];
    [textLab setTextColor:[UIColor colorWithHexString:@"b5b5b6" withAlpha:1.0]];
    [textLab setBackgroundColor:[UIColor clearColor]];
    [textView1 addSubview:textLab];
    
    UILabel *label = [[UILabel alloc] init];
    [label setFrame:CGRectMake(0, 70, 320, 1)];
    [label setBackgroundColor:[UIColor colorWithHexString:@"#cccccc" withAlpha:1.0]];
    [self.view addSubview:label];
    
    UILabel *label1 = [[UILabel alloc] init];
    [label1 setFrame:CGRectMake(0, 170, 320, 1)];
    [label1 setBackgroundColor:[UIColor colorWithHexString:@"#cccccc" withAlpha:1.0]];
    [self.view addSubview:label1];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(17, 190, btn_image.size.width, btn_image.size.height)];
    [btn setTitle:@"提交" forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [btn setBackgroundImage:btn_image forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

-(void)btnPress:(UIButton *)sender
{
    [self sendRequest];
}

-(void)changeRate:(UIButton *)sender
{
    long value = (long)sender.tag;
    NSArray *buttons = [[NSArray alloc] initWithObjects:btn1, btn2, btn3, btn4, btn5, nil];
    for (int i = 0; i < 5; i++) {
        [buttons[i] setSelected:NO];
    }
    for (int i = 0; i < value; i++) {
        [buttons[i] setSelected:YES];
    }
    rate_value = [NSNumber numberWithLong:value];
}

-(void)sendRequest
{
    NSString *path = @"/show/rate";
    NSString *proId = [NSString stringWithFormat:@"%ld",(long)_programID];
    NSDictionary *param = @{@"id":proId, @"value":rate_value, @"words":textView1.text};
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",HOSTURL]];
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:url];
    [client getPath:path parameters:param
            success:^(AFHTTPRequestOperation *operation, id responseObject){
                [self.navigationController popViewControllerAnimated:YES];
                /*
                [UserInfoData hideLoading];
                [[UserInfoData shareInstance] decodeObjectShowInfoData:responseObject];
                data = [UserInfoData shareInstance].showInfoData;
                [self initView];
                 */
            }
            failure:^(AFHTTPRequestOperation *operation, NSError *error){
                [self.navigationController popViewControllerAnimated:YES];
                /*
                NSLog(@" request faild , error == %@ ",error);
                [UserInfoData hideLoading];
                [UserInfoData alterShow:@"数据加载失败，请检查网络"];
                [self initView];
                 */
            }];
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
    [textView1 resignFirstResponder];
}

-(void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length > 0) {
        [textLab setHidden:YES];
    }else{
        [textLab setHidden:NO];
    }
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
