//
//  City.h
//  MyFlikR
//
//  Created by fitec on 10/07/2014.
//  Copyright (c) 2014 Mugiwaranojo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface City : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;

@end
