//
//  ATableViewCell.h
//  YanYiBao
//
//  Created by 郭 旭 on 14-8-6.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ATableViewCell : UITableViewCell

@property(nonatomic, strong) UIImageView *contImage;
@property(nonatomic, strong) UILabel *titleLab;
@property(nonatomic, strong) UILabel *timeLab;
@property(nonatomic, strong) UILabel *placeLab;
@property(nonatomic, strong) UILabel *likeLab;

@end
