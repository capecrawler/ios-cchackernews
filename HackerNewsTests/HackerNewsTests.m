//
//  HackerNewsTests.m
//  HackerNewsTests
//
//  Created by Mario Antonio Cape on 4/15/15.
//  Copyright (c) 2015 capecrawler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NewsViewController.h"



@interface NewsViewController(Tests)


- (NSString *) createApiForNewsDetails: (NSString *) newsId;

@end


@interface HackerNewsTests : XCTestCase

@end

@implementation HackerNewsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//- (void)testExample {
//    // This is an example of a functional test case.
//    XCTAssert(YES, @"Pass");
//}
//
//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}



- (void) testAPIForNewsDetails{
    NewsViewController * controller = [[NewsViewController alloc] init];
    NSString * api = [controller createApiForNewsDetails:@"9376391"];
    NSString * correctAPI = @"https://hacker-news.firebaseio.com/v0/item/9376391.json?print=pretty";
    XCTAssertEqualObjects(api, correctAPI, @"API function error");
}

@end
