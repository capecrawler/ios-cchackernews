//
//  WebBrowserViewController.m
//  HackerNews
//
//  Created by Mario Antonio Cape on 4/15/15.
//  Copyright (c) 2015 capecrawler. All rights reserved.
//

#import "WebBrowserViewController.h"

@interface WebBrowserViewController()

@property (nonatomic, strong) UIWebView * webView;

@end

@implementation WebBrowserViewController

- (void) viewDidLoad{
    [super viewDidLoad];
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.webView];
    [self.webView loadRequest:[NSURLRequest requestWithURL: [NSURL URLWithString:self.url]]];
}

@end
