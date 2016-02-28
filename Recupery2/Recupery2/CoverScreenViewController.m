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
    self.nameTextField.backgroundColor = [UIColor whiteColor];
    self.scrollView.contentSize = self.coverPage.frame.size;
    self.nameTextField.delegate = self;
    self.coverButton = [[UIButton alloc]init];
    self.coverButton.frame = CGRectMake(105, 550, 160, 50);
    [self.scrollView addSubview: self.coverButton];
    self.coverButton.backgroundColor = [UIColor blackColor];
    [self.coverButton addTarget:self action:@selector(buttonWasTapped) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
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

#define kOFFSET_FOR_KEYBOARD 80.0

-(void)keyboardWillShow {
    // Animate the current view out of the way
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)keyboardWillHide {
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)sender
{
    if ([sender isEqual:self.nameTextField])
    {
        //move the main view, so that the keyboard does not hide it.
        if  (self.view.frame.origin.y >= 0)
        {
            [self setViewMovedUp:YES];
        }
    }
}

//method to move the view up/down whenever the keyboard is shown/dismissed
-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;
    if (movedUp)
    {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    }
    else
    {
        // revert back to the normal state.
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}


@end
