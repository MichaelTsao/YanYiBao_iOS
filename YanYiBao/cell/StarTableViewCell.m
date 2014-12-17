//
//  StarTableViewCell.m
//  YanYiBao
//
//  Created by 郭 旭 on 14-8-18.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import "StarTableViewCell.h"
#import "UIColor+Helper.h"

@implementation StarTableViewCell
@synthesize imageView = _imageView, label1 = _label1;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setBackgroundColor:[UIColor colorWithHexString:@"#f7f8f8" withAlpha:1.0]];
        
        CGRect frameImage1 = CGRectMake(20, 15, 70, 70);
        
        _imageView = [[UIImageView alloc] init];
        [_imageView setFrame:frameImage1];
        [_imageView setBackgroundColor:[UIColor clearColor]];
        [self addSubview:_imageView];
        
        CGRect frameLab = CGRectMake(110, 35, 180, 30);
        _label1 = [[UILabel alloc] init];
        [_label1 setFrame:frameLab];
        [_label1 setFont:[UIFont systemFontOfSize:13]];
        [_label1 setBackgroundColor:[UIColor clearColor]];
        //[_label1 setText:@"汪峰"];
        [_label1 setTextColor:[UIColor colorWithHexString:@"#b5b6b6"withAlpha:1.0]];
        [self addSubview:_label1];
        
        
    }
    return self;
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
