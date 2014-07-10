//
//  City+DAO.m
//  MyFlikR
//
//  Created by fitec on 10/07/2014.
//  Copyright (c) 2014 Mugiwaranojo. All rights reserved.
//

#import "City+DAO.h"
#import "AppDelegate.h"

@implementation City (DAO)

+(NSManagedObjectContext *) getContext
{
    AppDelegate * appDelegate = [[UIApplication sharedApplication] delegate];
    return appDelegate.managedObjectContext;
}

+(void) delete:(City *) city
{
    [[self getContext] deleteObject:city];
}

+(NSArray *) allCities
{
    NSFetchRequest * request = [[NSFetchRequest alloc]initWithEntityName:@"City"];
    NSArray * result = [[self getContext] executeFetchRequest:request error:nil];
    return result;
}

+(City *) new
{
    City * city = [NSEntityDescription insertNewObjectForEntityForName:@"City" inManagedObjectContext:[self getContext]];
    
    if(random()%2==0){
        city.name = @"Noisy le sec";
        city.latitude=@(48.8894);
        city.longitude=@(2.4503);
    }else{
        city.name = @"Ile maurice";
        city.latitude=@(-20.300842);
        city.longitude=@(57.582092);
    }
    return city;
}

@end
