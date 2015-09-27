//
//  SPArray.h
//  SPArray
//
//  Created by popovychs on 24.09.15.
//  Copyright © 2015 popovychs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPArray : NSOperation

@property (strong) NSMutableArray *myArray;
@property (strong) NSOperationQueue *primeQueue;
@property (readonly, getter=isExecuting) BOOL executing;
@property (readonly, getter=isFinished) BOOL finished;

-(id)initWithSize:(NSInteger)size;
-(void)showOnScreen;
-(void)start;
-(void)main;
-(BOOL)isConcurrent;
//-(CGFloat)sumOfElements:(SPArray*)array;
//-(CGFloat)arithmeticalAverege:(SPArray*)array;

@end
