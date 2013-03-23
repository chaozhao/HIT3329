#import <Foundation/NSObject.h>
#import "AddressBookDelegate.h"

@interface AddressBook: NSObject <AddressBookDelegate> 

@property (nonatomic, retain) NSInteger rows;
@property (nonatomic, retain) NSString title;

@end

