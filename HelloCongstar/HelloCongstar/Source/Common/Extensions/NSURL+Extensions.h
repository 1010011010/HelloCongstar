#import <Foundation/Foundation.h>

@interface NSURL (QueryItem)

- (NSURL *)URLByAppendingQueryItemWithName:(NSString *)name value:(NSString *)value;

@end
