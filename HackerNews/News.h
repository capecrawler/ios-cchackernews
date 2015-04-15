//
//  News.h
//  HackerNews
//
//  Created by Mario Antonio Cape on 4/15/15.
//  Copyright (c) 2015 capecrawler. All rights reserved.
//

#import "RemoteData.h"

@interface News : RemoteData

@property (nonatomic, strong) NSString * by;
@property (nonatomic, assign) NSInteger descendants;
@property (nonatomic, assign) NSInteger newsId;
@property (nonatomic, strong) NSArray * kidsIds;
@property (nonatomic, assign) NSInteger score;
@property (nonatomic, assign) NSInteger time;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * type;
@property (nonatomic, strong) NSString * url;

@end
