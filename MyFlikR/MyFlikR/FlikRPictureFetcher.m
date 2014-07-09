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
    
    NSURL * generatedUrl= [NSURL URLWithString:[NSString stringWithFormat:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=%@&lat=00&lon=00&format=json&nojsoncallback=1;", API_KEY]];
    
    NSData * data= [NSData dataWithContentsOfURL:generatedUrl];
    
    NSDictionary * jsonArray =[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    NSMutableArray * pictures= [self parseJsonToPicturesArray: jsonArray] ;
    return [pictures copy];
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
