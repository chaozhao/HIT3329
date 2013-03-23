
#import <Foundation/Foundation.h>
#import "AddressBook.h"

int main( int argc, const char *argv[] ) 
{
	
    // create a new instance
	AddressBook *book = [[AddressBook alloc] init];
	
	[book displayName];
	[book displayPhoneNumber];
	[book displayAddress];
	[book displayFax];   
    
    [book release];
    return 0;
        
}