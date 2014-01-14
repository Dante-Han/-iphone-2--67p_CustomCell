//
//  CartDelegate.h
//  CustomCell201
//
//  Created by SDT-1 on 2014. 1. 7..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol ProductCellDelegate <NSObject>

 -(void)addItem:(id)sender;

@end

@protocol CartCellDelegate <NSObject>


-(void)incQuantity:(NSString *)productCode;
-(void)decQuantity:(NSString *)productCode;

@end






