#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSURL (QueryItem)

- (NSURL *)URLByAppendingQueryItemWithName:(NSString *)name value:(nullable NSString *)value;

@end

NS_ASSUME_NONNULL_END
