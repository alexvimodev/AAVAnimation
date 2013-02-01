//
//  AVViewController.m
//  AAVAnimation
//
//  Created by Alex Vijay on 01/02/13.
//  Copyright (c) 2013 J Alex Antony Vijay. All rights reserved.
//

#import "AVViewController.h"
#import "CustomizedView.h"

#define kCustomizedViewYIncreaseBy 40

@implementation AVViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Simple View Animation";
    // Do any additional setup after loading the view from its nib.
    menuList = [[NSMutableArray alloc] initWithObjects:@"One", @"Two", @"Three", @"Four", @"Five", nil];
    int yCoordinate = 0;
    int index = 0;
    customizedViewList = [[NSMutableArray alloc] init];
    for (NSString *item in menuList) {
        CustomizedView *cView = [[CustomizedView alloc] initWithFrame:CGRectMake(5, yCoordinate, 310, 460)];
        [cView.titleBar setText:[menuList objectAtIndex:index]];
        [cView setDelegate:self];
        [customizedViewList addObject:cView];
        [self.view addSubview:cView];
        yCoordinate = yCoordinate + kCustomizedViewYIncreaseBy;
        index++;
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSEnumerator *enumerator = touches.objectEnumerator;
    UITouch *value = nil;
    while (value = [enumerator nextObject]) {
        if ([value.view isKindOfClass:CustomizedView.class]) {
            UIView *currentView = value.view;
            viewYAxis = currentView.frame.origin.y;
            touchBeganY = [value locationInView:value.view].y;
        }
    }
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSEnumerator *enumerator = touches.objectEnumerator;
    UITouch *value = nil;
    while (value = [enumerator nextObject]) {
        if ([value.view isKindOfClass:CustomizedView.class]) {
            UIView *currentView = value.view;
            [UIView animateWithDuration:0.5 animations:^{
                CGRect rect = currentView.frame;
                rect.origin.y = viewYAxis;
                value.view.frame = rect;
            }];
            int indexOf = [customizedViewList indexOfObject:value.view];
            for (int i=indexOf+1; i<[customizedViewList count]; i++) {
                [UIView animateWithDuration:0.5 animations:^{
                    UIView *views = [customizedViewList objectAtIndex:i];
                    CGRect rect = views.frame;
                    rect.origin.y = (i * kCustomizedViewYIncreaseBy);
                    views.frame = rect;
                }];
            }
        }
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    NSEnumerator *enumerator = touches.objectEnumerator;
    UITouch *value = nil;
    while (value = [enumerator nextObject]) {
        if ([value.view isKindOfClass:CustomizedView.class]) {
            UIView *currentView = value.view;
            touchMovedY = [value locationInView:currentView].y;
            CGRect rect = currentView.frame;
            rect.origin.y = rect.origin.y + (touchMovedY - touchBeganY);
            value.view.frame = rect;
            int indexOf = [customizedViewList indexOfObject:value.view];
            for (int i=indexOf+1; i<[customizedViewList count]; i++) {
                UIView *views = [customizedViewList objectAtIndex:i];
                CGRect rect = views.frame;
                rect.origin.y = rect.origin.y + (touchMovedY - touchBeganY);
                views.frame = rect;
            }
        }
    }
}

@end
