//
//  ImageViewController.m
//  Recupery2
//
//  Created by Lauren on 2/28/16.
//  Copyright © 2016 Recupery. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()
@property(nonatomic) UIImageView *imageView;
@end

@implementation ImageViewController

- (instancetype)initWithImage:(UIImage *)image {
  self = [super init];
  if (self) {
    self.imageToDisplay = image;
  }
  return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  self.imageView = [[UIImageView alloc] initWithImage:self.imageToDisplay];
  [self.view addSubview:self.imageView];
  self.imageView.frame = self.view.frame;
  self.view.backgroundColor = [UIColor blackColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
