//
//  ImageViewController.h
//  Recupery2
//
//  Created by Lauren on 2/28/16.
//  Copyright © 2016 Recupery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageViewController : UIViewController

@property(nonatomic) UIImage *imageToDisplay;

- (instancetype)initWithImage:(UIImage *)image;

@end
