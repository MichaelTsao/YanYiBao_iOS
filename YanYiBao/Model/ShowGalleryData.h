//
//  ShowGalleryData.h
//  YanYiBao
//
//  Created by 郭 旭 on 14-9-28.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import <Foundation/Foundation.h>

//演出剧照 /show/gallery/[id]
@interface ShowGalleryData : NSObject

-(void)decodeObjectWithShowGalleryData:(NSData *)data;

-(NSInteger)galleryCount;
-(NSString *)galleryUrl:(NSInteger)index;
@end
