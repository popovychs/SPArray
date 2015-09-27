//
//  main.m
//  SPArray
//
//  Created by popovychs on 24.09.15.
//  Copyright © 2015 popovychs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPArray.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        SPArray *arr1 = [[SPArray alloc]initWithSize:9];
        [arr1 showOnScreen];
        [arr1 start];
        
        sleep(3);
        NSLog(@"Program is finished!");

    }
    return 0;
}
