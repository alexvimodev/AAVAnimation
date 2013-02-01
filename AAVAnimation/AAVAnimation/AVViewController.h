//
//  AVViewController.h
//  AAVAnimation
//
//  Created by Alex Vijay on 01/02/13.
//  Copyright (c) 2013 J Alex Antony Vijay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AVViewController : UIViewController {
    NSMutableArray *menuList;
    NSMutableArray *customizedViewList;
    
    int viewYAxis;
    int touchBeganY;
    int touchMovedY;
}

@end
