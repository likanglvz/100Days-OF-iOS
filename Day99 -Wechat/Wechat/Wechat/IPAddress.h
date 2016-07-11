//
//  IPAddress.h
//  WhatsMyIP
//
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#ifndef WhatsMyIP_IPAddress_h
#define WhatsMyIP_IPAddress_h



#endif

/*  
 *  IPAdress.h  
 *  
 *  
 */  

#define MAXADDRS    32  

extern char *if_names[MAXADDRS];  
extern char *ip_names[MAXADDRS];  
extern char *hw_addrs[MAXADDRS];  
extern unsigned long ip_addrs[MAXADDRS];  

// Function prototypes  

void InitAddresses();  
void FreeAddresses();  
void GetIPAddresses();  
void GetHWAddresses();  
