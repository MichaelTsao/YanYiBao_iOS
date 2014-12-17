//
//  CTableViewCell.m
//  YanYiBao
//
//  Created by 郭 旭 on 14-8-7.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import "CTableViewCell.h"
#import "UIColor+Helper.h"

@implementation CTableViewCell
@synthesize label1 = _label1, image = _image;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        UIImage *image_arrow = [UIImage imageNamed:@"my_arrow"];
        
        CGRect arrow_frame = CGRectMake(290, 15, image_arrow.size.width, image_arrow.size.height);
        CGRect lab1_frame = CGRectMake(20, 10, 150, 25);
        
        _image = [[UIImageView alloc] init];
        [_image setImage:image_arrow];
        [_image setFrame:arrow_frame];
        [self addSubview:_image];
        
        _label1 = [[UILabel alloc] init];
        [_label1 setFrame:lab1_frame];
        [_label1 setFont:[UIFont systemFontOfSize:14]];
        [_label1 setTextAlignment:NSTextAlignmentLeft];
        [_label1 setTextColor:[UIColor colorWithHexString:@"#a1a1a1" withAlpha:1.0]];
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
