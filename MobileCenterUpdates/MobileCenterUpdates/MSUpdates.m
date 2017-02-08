/*
 * Copyright (c) Microsoft Corporation. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import "MSUpdates.h"
#import "MSLogger.h"
#import "MSLogManager.h"
#import "MSMobileCenterInternal.h"

/**
 * Service storage key name.
 */
static NSString *const kMSServiceName = @"Updates";

@interface MSUpdates ()

@end

@implementation MSUpdates

#pragma mark - Service initialization

- (instancetype)init {
  if ((self = [super init])) {
  }
  return self;
}

#pragma mark - MSServiceAbstract

- (void)applyEnabledState:(BOOL)isEnabled {
  [super applyEnabledState:isEnabled];

  // Enabling
  if (isEnabled) {
    MSLogInfo([MSUpdates logTag], @"Updates service has been enabled.");
  } else {
    MSLogInfo([MSUpdates logTag], @"Updates service has been disabled.");
  }
}

#pragma mark - MSServiceInternal

+ (instancetype)sharedInstance {
  static id sharedInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
      sharedInstance = [[self alloc] init];
  });
  return sharedInstance;
}

- (void)startWithLogManager:(id <MSLogManager>)logManager appSecret:(NSString *)appSecret {
  [super startWithLogManager:logManager appSecret:appSecret];
  MSLogVerbose([MSUpdates logTag], @"Started Updates service.");
}

+ (NSString *)logTag {
  return @"MobileCenterUpdates";
}

- (NSString *)storageKey {
  return kMSServiceName;
}

- (MSPriority)priority {
  return MSPriorityHigh;
}

@end
