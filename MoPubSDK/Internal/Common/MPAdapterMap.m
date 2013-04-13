//
//  MPAdapterMap.m
//  MoPub
//
//  Created by Andrew He on 1/26/11.
//  Copyright 2011 MoPub, Inc. All rights reserved.
//

#import "MPAdapterMap.h"

@interface MPAdapterMap ()

@property (nonatomic, retain) NSDictionary *interstitialAdapterMap;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////

@implementation MPAdapterMap

@synthesize interstitialAdapterMap;

+ (id)sharedAdapterMap
{
    static MPAdapterMap *sharedAdapterMap = nil;
    @synchronized(self)
    {
        if (sharedAdapterMap == nil)
            sharedAdapterMap = [[self alloc] init];
    }
    return sharedAdapterMap;
}

- (id)init
{
    if (self = [super init])
    {
        interstitialAdapterMap = [[NSDictionary dictionaryWithObjectsAndKeys:
                                   @"MPHTMLInterstitialAdapter",        @"html",
                                   @"MPMRAIDInterstitialAdapter",       @"mraid",
                                   @"MPIAdInterstitialAdapter",         @"iAd_full",
                                   @"MPGoogleAdMobInterstitialAdapter", @"admob_full",
                                   @"MPMillennialInterstitialAdapter",  @"millennial_full",
                                   nil] retain];
    }
    return self;
}

- (void)dealloc
{
    self.interstitialAdapterMap = nil;
    [super dealloc];
}

- (Class)interstitialAdapterClassForNetworkType:(NSString *)networkType
{
    return NSClassFromString([self.interstitialAdapterMap objectForKey:networkType]);
}

@end
