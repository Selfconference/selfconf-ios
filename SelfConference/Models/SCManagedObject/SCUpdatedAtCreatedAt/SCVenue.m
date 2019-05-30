//
//  Venue.m
//  SelfConference
//
//  Created by Jeff Burt on 5/11/15.
//  Copyright (c) 2015 Self Conference. All rights reserved.
//

#import "SCVenue.h"
#import "SCAPIStrings.h"
#import "SCRoom.h"
#import "SelfConference-Swift.h"
#import "NSString+SCFromDate.h"

@implementation SCVenue

@dynamic venueID;
@dynamic about;
@dynamic mapsUrlString;
@dynamic name;
@dynamic address;
@dynamic events;
@dynamic rooms;

#pragma mark - Typed API requests

+ (void)getVenuesWithCompletionBlock:(SCManagedObjectObjectsWithErrorBlock)completionBlock {
    [self getObjectsFromUrlString:[self getAllVenuesUrlString]
                  completionBlock:completionBlock];
}

#pragma mark - Internal

/** Returns a url string to GET all of the venues */
+ (NSString *)getAllVenuesUrlString {    
    return [SCAPIRelativeUrlStrings.venues
            stringByAppendingString:[NSString SC_fromDateUrlParameterStringForClass:[self class]]];
}

#pragma mark MagicalRecord

- (BOOL)importAbout:(NSString *)about {
    self.about = about.SC_convertedHTMLTagString;
    return YES;
}

@end
