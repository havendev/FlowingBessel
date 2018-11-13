//
//  InsideLineView.h
//  LineDemo
//
//  Created by Haven on 2018/11/13.
//  Copyright © 2018 Haven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InsideLineView : UIView
{
    float t;
    float tem;
    float width;
    float deviation;
    
    CGContextRef ref;
    
    int count;
}
@end
