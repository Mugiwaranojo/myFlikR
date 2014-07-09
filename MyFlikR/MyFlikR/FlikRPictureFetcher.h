//
//  FlikRPictureFetcher.h
//  MyFlikR
//
//  Created by fitec on 09/07/2014.
//  Copyright (c) 2014 Mugiwaranojo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct {
    double longitude;
    double latitude;
} PictureFetcherLocation;

typedef void(^CompletionBlock)(NSArray * pictures);

@interface FlikRPictureFetcher : NSObject

-(void) pictureArroundLocation:(PictureFetcherLocation)location completion:(CompletionBlock)completion;

@end
