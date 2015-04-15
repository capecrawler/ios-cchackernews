//
//  NewsViewController.m
//  HackerNews
//
//  Created by Mario Antonio Cape on 4/15/15.
//  Copyright (c) 2015 capecrawler. All rights reserved.
//

#import "NewsViewController.h"
#import <AFNetworking/AFHTTPRequestOperation.h>
#import <AFNetworking/AFHTTPRequestOperationManager.h>
#import "NewsCell.h"
#import "WebBrowserViewController.h"

@interface NewsViewController()

@property (nonatomic, strong) AFHTTPRequestOperation * operation;
@property (nonatomic, strong) NSArray * newsId;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger remaining;
@property (nonatomic, strong) NSMutableArray * newsData;
@property (nonatomic, assign) BOOL loading;

@end

@implementation NewsViewController


- (void) viewDidLoad{
    [super viewDidLoad];
    self.newsId = @[];
    self.newsData = [@[] mutableCopy];
    self.count = 0;
    self.remaining = 0;
    [self runGetNews:@"https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty"];
    
}


- (void)  runGetNews: (NSString * ) api{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    self.operation = [manager GET:api parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject isKindOfClass:[NSArray class]]){
            self.newsId = (NSArray *) responseObject;
            self.remaining = self.newsId.count;
            [self loadNews:0];
        }else{
            NSLog(@"invalid format");
            UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"Get News" message:@"Failed to get news" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alertView show];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error: %@", [error localizedDescription]);
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"Get News" message:[error localizedDescription] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
    }];
}


- (NSString *) createApiForNewsDetails: (NSString *) newsId{
    return [NSString stringWithFormat:@"https://hacker-news.firebaseio.com/v0/item/%@.json?print=pretty", newsId];
}

- (void) runGetNewsDetails: (NSString *) newsId success:(void (^)())success
                   failure:(void (^)())failure{
    NSString * api = [self createApiForNewsDetails:newsId];
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    self.operation = [manager GET:api parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        News * news = [[News alloc] initWithDictionary:responseObject];
        [self.newsData addObject:news];
        if (success){
            success();
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error: %@", [error localizedDescription]);
        if (failure){
            failure();
        }
    }];
}

- (void) loadNews:(NSInteger) count{
    if (count < 10){
        [self runGetNewsDetails:[self.newsId[count] stringValue] success:^{
            [self loadNews: count+1];
        } failure:^{
            UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Failed to load news" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alertView show];
        }];
    }else{
        [self.tableView reloadData];
    }
}



#pragma mark - UITableViewDataSource

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.newsData.count;
}


- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellId = @"CellId";
    NewsCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil){
        cell = [[NewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.news = self.newsData[indexPath.row];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.authorButtonOnClick = ^(NSString * authorId){
        [self openAuthor:authorId];
    };
    cell.contentButtonOnClick = ^(NSString * contentUrl){
        [self openContent:contentUrl];
    };
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40 + 44 + 10;
}


- (void) openContent: (NSString *) url{
    WebBrowserViewController * controller = [[WebBrowserViewController alloc] init];
    controller.url = url;
    [self.navigationController pushViewController:controller animated:YES];
}

- (void) openAuthor: (NSString * ) authorId{
    WebBrowserViewController * controller = [[WebBrowserViewController alloc] init];
    controller.url = [NSString stringWithFormat:@"https://news.ycombinator.com/user?id=%@", authorId];
    [self.navigationController pushViewController:controller animated:YES];
}





@end
