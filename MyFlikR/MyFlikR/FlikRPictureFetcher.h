//
//  FlikRPictureFetcher.h
//  MyFlikR
//
//  Created by fitec on 09/07/2014.
//  Copyright (c) 2014 Mugiwaranojo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct {
    double longiture;
    double latitude;
} PictureFetcherLocation;

@interface FlikRPictureFetcher : NSObject

-(NSArray *) picturesArroundLocation: (PictureFetcherLocation) location;

@end
