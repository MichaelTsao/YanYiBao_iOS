//
//  JmTableViewCell.m
//  YanYiBao
//
//  Created by 郭 旭 on 14-8-18.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import "JmTableViewCell.h"
#import "UIColor+Helper.h"
#import "AFNetworking.h"
#import "AFHTTPClient.h"

@implementation JmTableViewCell
@synthesize imageView = _imageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setBackgroundColor:[UIColor colorWithHexString:@"#f7f8f8" withAlpha:1.0]];
        
        CGRect frameImage1 = CGRectMake(0, 0, 320, 88);
        
        _imageView = [[UIImageView alloc] init];
        [_imageView setFrame:frameImage1];
        [self addSubview:_imageView];
    }
    return self;
}

- (void)loadImage:(NSURL*)url
{
    [_imageView setImageWithURLRequest:[[NSURLRequest alloc] initWithURL:url] placeholderImage:nil success:
     ^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image){
         CGFloat w = image.size.width;
         CGFloat h = image.size.height;
         CGRect frameImage1 = CGRectMake(0, 0, 320, 320*h/w);
         [_imageView setFrame:frameImage1];
     } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error){
     }];
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
