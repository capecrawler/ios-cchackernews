//
//  NewsCell.m
//  HackerNews
//
//  Created by Mario Antonio Cape on 4/15/15.
//  Copyright (c) 2015 capecrawler. All rights reserved.
//

#import "NewsCell.h"

@interface NewsCell()

@property (nonatomic, strong) UILabel * label;
@property (nonatomic, strong) UIButton * authorButton;
@property (nonatomic, strong) UIButton * contentButton;

@end


@implementation NewsCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        self.label = [[UILabel alloc] initWithFrame:CGRectZero];
        self.label.font = [UIFont systemFontOfSize:16];
        self.label.numberOfLines = 1;
        self.label.lineBreakMode = NSLineBreakByTruncatingTail;
        [self.contentView addSubview:self.label];
        
        self.authorButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.authorButton setTitle:@"Author" forState:UIControlStateNormal];
        self.authorButton.backgroundColor = [UIColor redColor];
        [self.authorButton addTarget:self action:@selector(authorButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.authorButton];
        
        self.contentButton = [[UIButton alloc] initWithFrame:CGRectZero];
        [self.contentButton setTitle:@"Content" forState:UIControlStateNormal];
        self.contentButton.backgroundColor = [UIColor blueColor];
        [self.contentButton addTarget:self action:@selector(contentButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.contentButton];
        
    }
    return self;
}

- (void) layoutSubviews{
    [super layoutSubviews];
    self.label.frame = CGRectMake(10, 10, self.bounds.size.width - 20, 20);
    self.label.text = self.news.title;
    self.authorButton.frame = CGRectMake(10, 10 +self.label.frame.origin.y + self.label.frame.size.height, 150, 44);
    self.contentButton.frame = CGRectMake(10 + self.authorButton.frame.size.width + 20, 10 +self.label.frame.origin.y + self.label.frame.size.height, 150, 44);
}


- (void) authorButtonClicked{
    if (self.authorButtonOnClick){
        self.authorButtonOnClick(self.news.by);
    }
}

- (void) contentButtonClicked{
    if (self.contentButtonOnClick){
        self.contentButtonOnClick(self.news.url);
    }
}



@end
