//
//  CoverScreenViewController.m
//  Recupery2
//
//  Created by Lauren on 2/27/16.
//  Copyright © 2016 Recupery. All rights reserved.
//

#import "CoverScreenViewController.h"
#import "RootViewController.h"

@interface CoverScreenViewController () <UITextFieldDelegate>
@property (nonatomic) UIImageView *coverPage;
@property (nonatomic) UITextField *nameTextField;
@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic) UIButton *coverButton;
@end

@implementation CoverScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView = [[UIScrollView alloc]init];
    self.scrollView.frame = self.view.frame;
    [self.view addSubview:self.scrollView];

    self.coverPage = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"cover_image"]];
    self.coverPage.frame = self.view.frame;
    [self.scrollView addSubview: self.coverPage];

    self.nameTextField = [[UITextField alloc]init];
    self.nameTextField.frame = CGRectMake(220, 470, 150, 50);
    [self.scrollView addSubview: self.nameTextField];
    self.nameTextField.backgroundColor = [UIColor clearColor];
  self.nameTextField.textColor = [UIColor whiteColor];

    self.nameTextField.delegate = self;
    self.coverButton = [[UIButton alloc]init];
    self.coverButton.frame = CGRectMake(105, 550, 160, 50);
    [self.scrollView addSubview: self.coverButton];
    self.coverButton.backgroundColor = [UIColor clearColor];
    [self.coverButton addTarget:self action:@selector(buttonWasTapped) forControlEvents:UIControlEventTouchUpInside];

    self.scrollView.contentSize = self.coverPage.frame.size;
  [self registerForKeyboardNotifications];
}

- (void)buttonWasTapped {
    RootViewController *tutorialScreen = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"RootViewController"];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:tutorialScreen];
    [self presentViewController:navController animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Call this method somewhere in your view controller setup code.
- (void)registerForKeyboardNotifications
{
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(keyboardWasShown:)
                                               name:UIKeyboardDidShowNotification object:nil];

  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(keyboardWillBeHidden:)
                                               name:UIKeyboardWillHideNotification object:nil];

}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
  NSDictionary* info = [aNotification userInfo];
  CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;

  UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
  self.scrollView.contentInset = contentInsets;
  self.scrollView.scrollIndicatorInsets = contentInsets;

  // If active text field is hidden by keyboard, scroll it so it's visible
  // Your app might not need or want this behavior.
  CGRect aRect = self.view.frame;
  aRect.size.height -= kbSize.height;
  if (!CGRectContainsPoint(aRect, self.nameTextField.frame.origin) ) {
    [self.scrollView scrollRectToVisible:self.nameTextField.frame animated:YES];
  }
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
  UIEdgeInsets contentInsets = UIEdgeInsetsZero;
  self.scrollView.contentInset = contentInsets;
  self.scrollView.scrollIndicatorInsets = contentInsets;
}


@end
