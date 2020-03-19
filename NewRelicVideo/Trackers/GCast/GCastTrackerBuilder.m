//
//  GCastTrackerBuilder.m
//  NewRelicVideo
//
//  Created by Andreu Santaren on 01/05/2019.
//  Copyright © 2019 New Relic Inc. All rights reserved.
//

#import "GCastTrackerBuilder.h"
#import "NewRelicVideoAgent.h"
#import "GCastTracker.h"
#import <GoogleCast/GoogleCast.h>

@implementation GCastTrackerBuilder

+ (NSNumber *)startWithPlayer:(id)player {
    if ([player isKindOfClass:[GCKSessionManager class]]) {
        NSNumber *trackerId = [NewRelicVideoAgent startWithTracker:[[GCastTracker alloc] initWithGoogleCast:(GCKSessionManager *)player]];
        AV_LOG(@"Created GCastTracker");
        return trackerId;
    }
    return nil;
}

@end
