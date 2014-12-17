//
//  JmTableViewCell.m
//  YanYiBao
//
//  Created by 郭 旭 on 14-8-18.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import "JmTableViewCell.h"
#import "UIColor+Helper.h"

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
