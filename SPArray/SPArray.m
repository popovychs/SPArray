//
//  SPArray.m
//  SPArray
//
//  Created by popovychs on 24.09.15.
//  Copyright © 2015 popovychs. All rights reserved.
//

#import "SPArray.h"

@implementation SPArray
@synthesize executing;
@synthesize finished;

@synthesize myArray;

-(id)initWithSize:(NSInteger)size
{
    self = [super init];
    if(self)
    {
        _primeQueue = [NSOperationQueue new];
        executing = NO;
        finished = NO;
        self.myArray = [[NSMutableArray alloc]init];
        for (int i = 0; i < size; i++) {
            [self.myArray addObject:[NSNumber numberWithInteger:arc4random()%101]];
        }
    }
    return self;
}

-(void)showOnScreen
{
    for (int i = 0; i < [self.myArray count]; i++) {
        NSLog(@"arr[%d] = %.2f",i,[[self.myArray objectAtIndex:i]floatValue]);
    }
}

-(void)start
{
    if ([self isCancelled]) {
        [self willChangeValueForKey:@"isFinished"];
        finished = YES;
        [self didChangeValueForKey:@"isFinished"];
        return;
    }
    [self willChangeValueForKey:@"isExecuting"];
    [NSThread detachNewThreadSelector:@selector(main) toTarget:self withObject:nil];
    executing = YES;
    [self didChangeValueForKey:@"isExecuting"];
}

-(void)main
{
    @autoreleasepool {
        
        NSLog(@"-------------------- Sum of lements in array ------|");
        CGFloat sum1 = 0;
        for (int i = 0; i < [self.myArray count]; i++) {
            sum1 += [[self.myArray objectAtIndex:i]floatValue];
        }
        NSLog(@"Sum = %.2f",sum1);
        
        NSLog(@"-------------------- Arithmetical averege ---------|");
        CGFloat sum2 = 0;
        for (int i = 0; i < [self.myArray count]; i++) {
            sum2 += [[self.myArray objectAtIndex:i]floatValue];
        }
        CGFloat result = sum2 / [self.myArray count];
        NSLog(@"Arithmetical averege = %.2f",result);
        
        NSLog(@"---------------------------------------------------|");
        NSLog(@"Operatins are finished");
        NSLog(@"---------------------------------------------------|");
    }
}

-(BOOL)isConcurrent
{
    return YES;
}

-(BOOL)isExecuting
{
    return executing;
}

-(BOOL)isFinished
{
    return finished;
}
/*
-(CGFloat)sumOfElements:(SPArray*)array
{
    CGFloat sum = 0;
        for (int i = 0; i < [self.myArray count]; i++) {
            sum += [[self.myArray objectAtIndex:i]floatValue];
    }
            return sum;
}

-(CGFloat)arithmeticalAverege:(SPArray*)array
{
    CGFloat sum = 0;
        for (int i = 0; i < [self.myArray count]; i++) {
            sum += [[self.myArray objectAtIndex:i]floatValue];
    }
    CGFloat result = sum / [self.myArray count];
    return result;
}
*/
@end
