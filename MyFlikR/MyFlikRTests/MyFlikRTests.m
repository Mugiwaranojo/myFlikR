//
//  MyFlikRTests.m
//  MyFlikRTests
//
//  Created by fitec on 08/07/2014.
//  Copyright (c) 2014 Mugiwaranojo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "City+DAO.h"

@interface MyFlikRTests : XCTestCase

@end

@implementation MyFlikRTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInsertObjectReturnsAnObject
{
    XCTAssertNotNil([City new]);
}

- (void) testAllCitiesReturnsAnArray
{
    XCTAssertNotNil([City allCities]);
}

- (void) testInsert
{
    NSArray * allcities = [City allCities];
    int countBefore = allcities.count;
    
    // insert
    [City new];
    
    NSArray * newAllCities = [City allCities];
    int countAfter = newAllCities.count;
    
    XCTAssertEqual(countAfter, countBefore + 1);
}

- (void) testDelete
{
    // insert
    City * c = [City new];
    
    NSArray * allcities = [City allCities];
    int countBefore = allcities.count;
    
    // insert
    [City delete:c];
    
    NSArray * newAllCities = [City allCities];
    int countAfter = newAllCities.count;
    
    XCTAssertEqual(countAfter, countBefore - 1);
}

@end
