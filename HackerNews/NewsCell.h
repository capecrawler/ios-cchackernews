//
//  NewsCell.h
//  HackerNews
//
//  Created by Mario Antonio Cape on 4/15/15.
//  Copyright (c) 2015 capecrawler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"

@interface NewsCell : UITableViewCell

@property (nonatomic, strong) News * news;
@property (nonatomic, copy) void (^ authorButtonOnClick)(NSString * authorId);
@property (nonatomic, copy) void (^ contentButtonOnClick)(NSString * contentUrl);

@end
