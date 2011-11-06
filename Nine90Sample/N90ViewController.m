//
//  N90ViewController.m
//  Nine90Sample
//
//  Created by David Schaefgen on 11/6/11.
//  Copyright (c) 2011 David Schaefgen. All rights reserved.
//

#import "N90ViewController.h"

@interface N90ViewController () <N90SelectControlDelegate,N90SelectControlDataSource>

@property (nonatomic, strong) NSArray *options;

@end

@implementation N90ViewController

@synthesize selectButton = selectButton_;

@synthesize options = options_;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.options = [NSArray arrayWithObjects:@"Memphis", @"Bartlett", @"Germantown", 
                    @"Collierville", @"Arlington", @"Millington", nil];
    self.selectButton.delegate = self;
    self.selectButton.dataSource = self;
    self.selectButton.title = @"Collierville";
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)toggleTitle
{
    if ([self.selectButton.title isEqualToString:@"Title One"]) {
        self.selectButton.title = @"Title Two";
    } else {
        self.selectButton.title = @"Title One";
    }
}

#pragma mark -
#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}

#pragma mark -
#pragma mark N90SelectControlDelegate
- (NSString *)selectControl:(N90SelectControl *)selectControl titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.options objectAtIndex:row];
}

- (NSInteger)selectControl:(N90SelectControl *)selectControl rowForTitle:(NSString *)title forComponent:(NSInteger)component
{
    return [self.options indexOfObject:title];
}

#pragma mark -
#pragma mark N90SelectControlDataSource
- (NSInteger)numberOfComponentsForSelectControl:(N90SelectControl *)selectControl;
{
    return 1;
}

- (NSInteger)selectControl:(N90SelectControl *)selectControl numberOfRowsInComponent:(NSInteger)component
{
    return [self.options count];
}

@end
