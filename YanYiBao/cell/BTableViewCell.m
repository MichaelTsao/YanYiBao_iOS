//
//  BTableViewCell.m
//  YanYiBao
//
//  Created by 郭 旭 on 14-8-6.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import "BTableViewCell.h"
#import "UIColor+Helper.h"

@implementation BTableViewCell
@synthesize image = _image, label = _label, label1 = _label1;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIImage *image = [UIImage imageNamed:@"my_car"];
        UIImage *image_arrow = [UIImage imageNamed:@"my_arrow"];
        
        CGRect image_frame = CGRectMake(30, 10, image.size.width, image.size.height);
        CGRect arrow_frame = CGRectMake(290, 15, image_arrow.size.width, image_arrow.size.height);
        CGRect lab_frame = CGRectMake(90, 10, 100, 23);
        CGRect lab1_frame = CGRectMake(250, 10, 30, 25);
        
        _image = [[UIImageView alloc] init];
        [_image setFrame:image_frame];
        [self addSubview:_image];
        
        UIImageView *arrowView = [[UIImageView alloc] init];
        [arrowView setImage:image_arrow];
        [arrowView setFrame:arrow_frame];
        [self addSubview:arrowView];
        
        _label = [[UILabel alloc] init];
        [_label setFrame:lab_frame];
        [_label setFont:[UIFont systemFontOfSize:14]];
        [_label setTextColor:[UIColor colorWithHexString:@"#a1a1a1" withAlpha:1.0]];
        [_label setBackgroundColor:[UIColor clearColor]];
        [self addSubview:_label];
        
        _label1 = [[UILabel alloc] init];
        [_label1 setFrame:lab1_frame];
        [_label1 setFont:[UIFont systemFontOfSize:14]];
        [_label1 setTextAlignment:NSTextAlignmentRight];
        [_label1 setTextColor:[UIColor blackColor]];
        [_label1 setBackgroundColor:[UIColor clearColor]];
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
