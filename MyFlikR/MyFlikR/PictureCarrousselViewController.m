//
//  PictureCarrousselViewController.m
//  MyFlikR
//
//  Created by fitec on 09/07/2014.
//  Copyright (c) 2014 Mugiwaranojo. All rights reserved.
//

#import "PictureCarrousselViewController.h"
#import "ReaderView.h"
#import "Picture.h"
#import "FlikRPictureFetcher.h"

@interface PictureCarrousselViewController ()
<ReaderViewDelegate>

@property (weak, nonatomic) IBOutlet ReaderView *readerView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) NSArray * pictures;

@end

@implementation PictureCarrousselViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //temporaire:
    PictureFetcherLocation location;
    location.latitude= -20.300842;
    location.longitude= 57.582092;
    
    self.readerView.hidden = YES;
    
    FlikRPictureFetcher * fetcher= [FlikRPictureFetcher new];
    [fetcher pictureArroundLocation:location completion:^(NSArray *pictures){
        self.pictures = pictures;
        self.readerView.hidden = NO;
        [self.readerView displayPageAtIndex:0 animated:NO];
        
        self.activityIndicator.hidden=TRUE;
    }];
    self.readerView.delegate = self;
    
}

- (int)numberOfPages
{
    return self.pictures.count;
}

-(UIView *)viewForPageAtIndex:(NSInteger)idx
{
    Picture * p = self.pictures[idx];
    NSData * imageData = [NSData dataWithContentsOfURL: p.url];
    UIImage * testImage= [UIImage imageWithData:imageData];
    UIImageView * imageView = [[UIImageView alloc]initWithImage:testImage];
    imageView.contentMode= UIViewContentModeScaleAspectFit;
    
    return imageView;
}
@end
