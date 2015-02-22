//
//  SCSession.m
//  SelfConference
//
//  Created by Jeff Burt on 2/21/15.
//  Copyright (c) 2015 Self Conference. All rights reserved.
//

#import "SCSession.h"
#import <Parse/PFObject+Subclass.h>

@implementation SCSession

@dynamic name, details, scheduledAt, room, speakers;

#pragma mark - PFSubclassing

+ (NSString *)parseClassName {
    return @"Session";
}

+ (void)getLocalSessionsWithCompletionBlock:(SCSessionFetchSessionsWithErrorBlock)block {
    PFQuery *query = [self query];
    [query fromLocalDatastore];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (block) {
            block(objects, error);
        }
    }];
}

@end