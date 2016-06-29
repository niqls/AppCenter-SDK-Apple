#import "AVADeviceLog.h"

@implementation AVADeviceLog

- (instancetype)init {
  self = [super init];
  if (self) {
    // initialize property's default value, if any
    
  }
  return self;
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"osApiLevel", @"carrierName", @"carrierCountry"];
  return [optionalProperties containsObject:propertyName];
}

@end