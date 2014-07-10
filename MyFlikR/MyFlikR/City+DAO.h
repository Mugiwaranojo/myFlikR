//
//  City+DAO.h
//  MyFlikR
//
//  Created by fitec on 10/07/2014.
//  Copyright (c) 2014 Mugiwaranojo. All rights reserved.
//

#import "City.h"

@interface City (DAO)

+(void) delete:(City *) city;

+(NSArray *) allCities;

+(City *) new;

@end
