//
//  RemoteData.h
//  HackerNews
//
//  Created by Mario Antonio Cape on 4/15/15.
//  Copyright (c) 2015 capecrawler. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RemoteData : NSObject

- (id) initWithDictionary: (NSDictionary *) data;
- (void) parseDictionary: (NSDictionary *) data;

@end
