//
//  RemoteData.m
//  HackerNews
//
//  Created by Mario Antonio Cape on 4/15/15.
//  Copyright (c) 2015 capecrawler. All rights reserved.
//

#import "RemoteData.h"

@implementation RemoteData

- (id) initWithDictionary: (NSDictionary *) data{
    self = [super init];
    if (self){
        [self parseDictionary:data];
    }
    return self;
}

- (void) parseDictionary: (NSDictionary *) data{
    
    
}
@end
