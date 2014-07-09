//
//  FlikRPictureFetcher.m
//  MyFlikR
//
//  Created by fitec on 09/07/2014.
//  Copyright (c) 2014 Mugiwaranojo. All rights reserved.
//

#import "FlikRPictureFetcher.h"
#import "Picture.h"

#define API_KEY @"4c058ed825f8dd3bfcb2eb6ce698af1e"
//

@implementation FlikRPictureFetcher

-(NSArray *) picturesArroundLocation: (PictureFetcherLocation) location
{
    
    NSURL * generatedUrl= [NSURL URLWithString:[NSString stringWithFormat:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=%@&lat=%g&lon=%g&format=json&nojsoncallback=1;", API_KEY, location.latitude, location.longitude]];
    
    NSData * data= [NSData dataWithContentsOfURL:generatedUrl];
    
    NSDictionary * jsonArray =[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    NSMutableArray * pictures= [self parseJsonToPicturesArray: jsonArray] ;
    return [pictures copy];
}

-(void) pictureArroundLocation:(PictureFetcherLocation)location completion:(CompletionBlock)completion
{
    
    dispatch_queue_t backGroundQ = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    
    dispatch_async(backGroundQ, ^{
        NSArray * pictures = [self picturesArroundLocation:location];
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(pictures);
            });
        });
    
}

-(NSMutableArray *) parseJsonToPicturesArray: (NSDictionary *) jsonArray
{
    NSMutableArray * pictures= [NSMutableArray new];
    for(NSDictionary * detail in jsonArray[@"photos"][@"photo"]){
        NSString * farmid = detail[@"farm"];
        NSString * serverid = detail[@"server"];
        NSString * idPicture= detail[@"id"];
        NSString * secret= detail[@"secret"];
        NSURL* urlPicture = [NSURL URLWithString:[NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_%@.jpg", farmid, serverid, idPicture, secret]];
        NSString * titlePicture= detail[@"title"];
        Picture * picture= [Picture new];
        picture.title= titlePicture;
        picture.url= urlPicture;
        [pictures addObject:picture];
    }
    return pictures;
}
@end
