//
//  LcStopwatch.h
//  Minimal Sudoku
//
//  Created by Christoph Lauterbach on 20.10.13.
//  Copyright (c) 2013 Christoph Lauterbach. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCSFStopwatch : NSObject

+ (instancetype)stopwatchWithName:(NSString *)name;
+ (instancetype)stopwatchWithName:(NSString *)name startOffset:(NSTimeInterval)startOffset;

- (instancetype)initWithName:(NSString *)name;
- (instancetype)initWithName:(NSString *)name startOffset:(NSTimeInterval)startOffset;

- (void)start;

- (void)pause;

- (void)continueAfterPause;

- (void)stop;

@property(readonly, nonatomic) NSString *name;

@property(readonly, nonatomic) NSDate *startDate;
@property(readonly, nonatomic) NSDate *stopDate;

@property(readonly, nonatomic) NSTimeInterval elapsedTime;

@property(readonly, nonatomic) BOOL isPaused;
@property(readonly, nonatomic) BOOL isStopped;


@end
