//
//  LcStopwatch.m
//  Minimal Sudoku
//
//  Created by Christoph Lauterbach on 20.10.13.
//  Copyright (c) 2013 Christoph Lauterbach. All rights reserved.
//

#import "LCSFStopwatch.h"

@interface LCSFStopwatch ()

@property(readwrite, nonatomic) NSDate         *startDate;
@property(readwrite, nonatomic) NSDate         *stopDate;
@property(readwrite, nonatomic) NSDate         *pauseStartDate;
@property(readwrite, nonatomic) NSTimeInterval pausedTimeInterval;
@property(readwrite, nonatomic) NSTimeInterval startOffset;

@property(readwrite, nonatomic) NSString *name;
@property(readwrite, nonatomic) BOOL     isPaused;
@property(readwrite, nonatomic) BOOL     isStopped;

@end

@implementation LCSFStopwatch

+ (instancetype)stopwatchWithName:(NSString *)name
{
    return [[LCSFStopwatch alloc] initWithName:name];
}
+ (instancetype)stopwatchWithName:(NSString *)name startOffset:(NSTimeInterval)startOffset
{
    return [[LCSFStopwatch alloc] initWithName:name startOffset:startOffset];
}

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];

    if (self) {
        _name = name;
    }

    return self;
}

- (instancetype)initWithName:(NSString *)name startOffset:(NSTimeInterval)startOffset
{
    self = [super init];
    
    if (self) {
        _name = name;
        _startOffset = startOffset;
    }
    
    return self;
}

- (void)start
{
    self.startDate = [NSDate date];
}

- (void)pause
{
    if (!self.isPaused) {
        self.pauseStartDate = [NSDate date];
    }
}

- (BOOL)isPaused
{
    return (self.pauseStartDate != nil);
}

- (void)setIsPaused:(BOOL)isPaused
{
    if (!isPaused) {
        self.pauseStartDate = nil;
    }
}

- (BOOL)isStopped
{
    return (self.stopDate != nil);
}

- (void)setIsStopped:(BOOL)isStopped
{
    if (!isStopped) {
        self.stopDate = nil;
    }
}

- (void)continueAfterPause
{
    if (self.isPaused) {
        self.pausedTimeInterval -= [self.pauseStartDate timeIntervalSinceNow];
        self.isPaused = NO;
    }
}

- (void)stop
{
    self.stopDate  = [NSDate date];
    self.isStopped = YES;
}

- (NSTimeInterval)elapsedTime
{
    NSTimeInterval elapsedTime;
    if (_stopDate != nil) {
        elapsedTime = -[_startDate timeIntervalSinceDate:_stopDate];
    }
    else if (_pauseStartDate != nil) {
        elapsedTime = -[_startDate timeIntervalSinceDate:_pauseStartDate];
    }
    else {
        elapsedTime = -[_startDate timeIntervalSinceNow];
    }

    elapsedTime -= _pausedTimeInterval;
    elapsedTime += _startOffset;

    return elapsedTime;
}

- (BOOL)isEqual:(id)other
{
    if (other == self) {
        return YES;
    } else if (![super isEqual:other]) {
        return NO;
    } else {
        LCSFStopwatch *otherStopwatch = other;
        return ([self.name isEqualToString:otherStopwatch.name] &&
                [self.startDate isEqual:otherStopwatch.startDate] &&
                self.isPaused == otherStopwatch.isPaused &&
                self.isStopped == otherStopwatch.isStopped);
    }
}

- (NSUInteger)hash
{
    return self.name.hash ^ self.startDate.hash;
}

- (NSString *)description
{
    NSString *descriptionSpecifics;
    if (self.isPaused) {
        descriptionSpecifics = [NSString stringWithFormat:@"paused at %@", self.pauseStartDate];
    }
    else if (self.isStopped) {
        descriptionSpecifics = [NSString stringWithFormat:@"stopped at %@", self.stopDate];
    }
    
    return [NSString stringWithFormat:@"%@(name: %@, started: %@, elapsed: %3.5f, %@)", NSStringFromClass([self class]), self.name, self.startDate, self.elapsedTime, descriptionSpecifics];
}

@end
