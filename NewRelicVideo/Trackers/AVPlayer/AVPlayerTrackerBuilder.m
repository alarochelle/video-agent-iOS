//
//  AVPlayerTrackerBuilder.m
//  NewRelicVideo
//
//  Created by Andreu Santaren on 01/05/2019.
//  Copyright © 2019 New Relic Inc. All rights reserved.
//

#import "AVPlayerTrackerBuilder.h"
#import "AVPlayerTracker.h"
#import "NewRelicVideoAgent.h"

@import AVKit;

@implementation AVPlayerTrackerBuilder

+ (NSNumber *)startWithPlayer:(id)player {
    if ([player isKindOfClass:[AVPlayer class]]) {
        NSNumber *trackerId = [NewRelicVideoAgent startWithTracker:[[AVPlayerTracker alloc] initWithAVPlayer:(AVPlayer *)player]];
        AV_LOG(@"Created AVPlayerTracker");
        return trackerId;
    }
    else if ([player isKindOfClass:[AVPlayerViewController class]]) {
        NSNumber *trackerId = [NewRelicVideoAgent startWithTracker:[[AVPlayerTracker alloc] initWithAVPlayerViewController:(AVPlayerViewController *)player]];
        AV_LOG(@"Created AVPlayerViewControllerTracker");
        return trackerId;
    }
    else {
        return nil;
    }
}

@end
