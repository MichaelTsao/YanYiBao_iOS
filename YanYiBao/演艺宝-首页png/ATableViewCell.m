//
//  ATableViewCell.m
//  YanYiBao
//
//  Created by 郭 旭 on 14-8-6.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import "ATableViewCell.h"
#import "UIColor+Helper.h"

@implementation ATableViewCell
@synthesize contImage = _contImage;
@synthesize timeLab = _timeLab,titleLab = _titleLab,placeLab = _placeLab,likeLab = _likeLab;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setBackgroundColor:[UIColor colorWithHexString:@"#f7f8f8" withAlpha:1.0]];
        
        UIImage *image = [UIImage imageNamed:@"avatar1"];
        UIImage *image_arrow = [UIImage imageNamed:@"right_arrow"];
        
        CGRect frame_image = CGRectMake(20, 10, image.size.width, image.size.height);
        CGRect frame_lab1 = CGRectMake(105, 10, 200, 30);
        CGRect frame_lab2 = CGRectMake(140, 40, 160, 20);
        CGRect frame_lab3 = CGRectMake(140, 60, 140, 20);
        CGRect frame_lab4 = CGRectMake(140, 80, 25, 30);
        CGRect frame_time = CGRectMake(105, 40, 30, 20);
        CGRect frame_place = CGRectMake(105, 60, 30, 20);
        CGRect frame_like = CGRectMake(105, 87, 30, 20);
        CGRect frame_score = CGRectMake(165, 88, 20, 20);
        CGRect frame_image1 = CGRectMake(290, 90, image_arrow.size.width, image_arrow.size.height);
        
        _contImage = [[UIImageView alloc] init];
        [_contImage setFrame:frame_image];
        [self addSubview:_contImage];
        
        _titleLab = [[UILabel alloc] init];
        [_titleLab setFrame:frame_lab1];
        [_titleLab setBackgroundColor:[UIColor clearColor]];
        [_titleLab setTextColor:[UIColor blackColor]];
        [_titleLab setFont:[UIFont systemFontOfSize:14]];
        [self addSubview:_titleLab];
        
        UILabel *time = [[UILabel alloc] init];
        [time setFrame:frame_time];
        [time setBackgroundColor:[UIColor clearColor]];
        [time setText:@"时间:"];
        [time setTextColor:[UIColor colorWithHexString:@"#8f8f8f" withAlpha:1.0]];
        [time setFont:[UIFont systemFontOfSize:12]];
        [self addSubview:time];
        
        _timeLab = [[UILabel alloc] init];
        [_timeLab setFrame:frame_lab2];
        [_timeLab setBackgroundColor:[UIColor clearColor]];
        [_timeLab setTextColor:[UIColor colorWithHexString:@"#8f8f8f" withAlpha:1.0]];
        [_timeLab setFont:[UIFont systemFontOfSize:12]];
        [self addSubview:_timeLab];
        
        UILabel *place = [[UILabel alloc] init];
        [place setFrame:frame_place];
        [place setBackgroundColor:[UIColor clearColor]];
        [place setText:@"场馆:"];
        [place setTextColor:[UIColor colorWithHexString:@"#8f8f8f" withAlpha:1.0]];
        [place setFont:[UIFont systemFontOfSize:12]];
        [self addSubview:place];
        
        _placeLab = [[UILabel alloc] init];
        [_placeLab setFrame:frame_lab3];
        [_placeLab setBackgroundColor:[UIColor clearColor]];
        [_placeLab setTextColor:[UIColor colorWithHexString:@"#8f8f8f" withAlpha:1.0]];
        [_placeLab setFont:[UIFont systemFontOfSize:12]];
        [self addSubview:_placeLab];
        
        UILabel *like = [[UILabel alloc] init];
        [like setFrame:frame_like];
        [like setBackgroundColor:[UIColor clearColor]];
        [like setText:@"热度:"];
        [like setTextColor:[UIColor colorWithHexString:@"#8f8f8f" withAlpha:1.0]];
        [like setFont:[UIFont systemFontOfSize:12]];
        [self addSubview:like];
        
        _likeLab = [[UILabel alloc] init];
        [_likeLab setFrame:frame_lab4];
        [_likeLab setBackgroundColor:[UIColor clearColor]];
        [_likeLab setTextAlignment:NSTextAlignmentCenter];
        [_likeLab setTextColor:[UIColor colorWithHexString:@"#ff981f" withAlpha:1.0]];
        [_likeLab setFont:[UIFont systemFontOfSize:14]];
        [self addSubview:_likeLab];
        
        UILabel *score = [[UILabel alloc] init];
        [score setText:@"分"];
        [score setFrame:frame_score];
        [score setTextColor:[UIColor colorWithHexString:@"#ff981f" withAlpha:1.0]];
        [score setFont:[UIFont systemFontOfSize:10]];
        [score setBackgroundColor:[UIColor clearColor]];
        [self addSubview:score];
        
        UIImageView *arrow = [[UIImageView alloc] init];
        [arrow setFrame:frame_image1];
        [arrow setImage:image_arrow];
        [self addSubview:arrow];
        
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
