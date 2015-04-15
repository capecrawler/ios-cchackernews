//
//  News.m
//  HackerNews
//
//  Created by Mario Antonio Cape on 4/15/15.
//  Copyright (c) 2015 capecrawler. All rights reserved.
//

#import "News.h"

@implementation News

- (void) parseDictionary:(NSDictionary *)data{
    [super parseDictionary:data];
    self.by = data[@"by"];
    self.descendants = [data[@"descendants"] integerValue];
    self.newsId = [data[@"id"] integerValue];
    self.kidsIds = data[@"kids"];
    self.score = [data[@"score"] integerValue];
    self.time = [data[@"time"]integerValue];
    self.title = data[@"title"];
    self.type = data[@"type"];
    self.url = data[@"url"];    
}

@end
