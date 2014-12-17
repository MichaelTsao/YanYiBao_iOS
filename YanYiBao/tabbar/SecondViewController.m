//
//  SecondViewController.m
//  YanYiBao
//
//  Created by 郭 旭 on 14-8-3.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import "SecondViewController.h"
#import "UIColor+Helper.h"
#import "ATableViewCell.h"
#import "ContViewController.h"

@interface SecondViewController ()<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UITextField *text1;
    UITableView *table1;
}
@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIImage *image = [UIImage imageNamed:@"near_top"];
    UIImage *image1 = [UIImage imageNamed:@"near_map"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [imageView setFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    [self.view addSubview:imageView];
    
    UILabel *label = [[UILabel alloc] init];
    [label setFrame:CGRectMake(120, 30, 80, 30)];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setText:@"演出周边"];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setTextColor:[UIColor whiteColor]];
    [label setFont:[UIFont systemFontOfSize:18]];
    [imageView addSubview:label];
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:image1];
    [imageView1 setFrame:CGRectMake(0, 106, image1.size.width, image1.size.height)];
    [self.view addSubview:imageView1];
    
    text1 = [[UITextField alloc] init];
    [text1 setFrame:CGRectMake(25, 76, 250, 21)];
    [text1 setPlaceholder:@"输入您的地址"];
    text1.returnKeyType = UIReturnKeyDone;
    text1.delegate = self;
    [text1 setFont:[UIFont systemFontOfSize:12]];
    [text1 setBackgroundColor:[UIColor clearColor]];
    text1.tintColor = [UIColor colorWithHexString:@"#b5b6b6" withAlpha:1.0];
    [self.view addSubview:text1];
    
    CGRect table_frame = CGRectMake(0, 306, 320, self.view.frame.size.height-355);
    table1 = [[UITableView alloc] initWithFrame:table_frame style:UITableViewStylePlain];
    [table1 setDelegate:self];
    [table1 setDataSource:self];
    table1.rowHeight = 120;
    //table1.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:table1];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIImage *image = [UIImage imageNamed:@"1"];
    UIImage *image1 = [UIImage imageNamed:@"2"];
    UIImage *image2 = [UIImage imageNamed:@"3"];
    UIImage *image3 = [UIImage imageNamed:@"4"];
    
    NSArray *arr = [NSArray arrayWithObjects:image,image1,image2,image3, nil];
    
    static NSString *CellIdentifier1 = @"Cell1";
    ATableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier1];
    if(cell == nil)
    {
        cell = [[ATableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier1];
        //[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    [cell.contImage setImage:[arr objectAtIndex:indexPath.row]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ContViewController *contVC = [[ContViewController alloc] init];
    [self.tabBarController.tabBar setHidden:YES];
    [self.navigationController pushViewController:contVC animated:YES];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [text1 resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [text1 resignFirstResponder];
    return YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
    [self.tabBarController.tabBar setHidden:NO];
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
