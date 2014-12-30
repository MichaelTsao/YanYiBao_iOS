//
//  JmTableViewCell.h
//  YanYiBao
//
//  Created by 郭 旭 on 14-8-18.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JmTableViewCell : UITableViewCell
{
    UIImageView *imageView;
}

@property (nonatomic, strong) UIImageView *imageView;

- (void)loadImage:(NSURL*)url;

@end
