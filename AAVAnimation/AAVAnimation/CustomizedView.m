//
//  CustomizedView.m
//  AAVAnimation
//
//  Created by Alex Vijay on 01/02/13.
//  Copyright (c) 2013 J Alex Antony Vijay. All rights reserved.
//

#import "CustomizedView.h"

@implementation CustomizedView

@synthesize titleBar;
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        titleBar = [[UILabel alloc] initWithFrame:CGRectMake(0, 1, 310, 39)];
        [titleBar setBackgroundColor:[UIColor brownColor]];
        [titleBar setTextAlignment:UITextAlignmentCenter];
        [self addSubview:titleBar];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [delegate touchesBegan:touches withEvent:event];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [delegate touchesCancelled:touches withEvent:event];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [delegate touchesEnded:touches withEvent:event];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [delegate touchesMoved:touches withEvent:event];
}

@end
