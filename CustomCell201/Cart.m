//
//  Cart.m
//  CustomCell201
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "Cart.h"
#import "ViewController.h"
#import "CartDelegate.h"

@interface Cart()

@end

@implementation Cart

// 이 메소드를 누가 쓰게 하려고 만들었나?
-(void)addProduct:(Product *)item {
    // 카트내 동일 상품 검색
    CartItem *cartItem = [self cartItemWith:item.code];
    if (cartItem == nil) {
        // 동일 제품 검색 실패 -> 새로운 상품을 카트에 추가
        cartItem = [[CartItem alloc] init];
        cartItem.product = item;
        cartItem.quantity = 1;
        [self.items addObject:cartItem];
    } else {
        // 동일 제품 검색 성공 -> 제품 수량 증가
        [self incQuantity1:item.code];
    }
}

-(void)incQuantity1:(NSString *)productCode{
    CartItem *item = [self cartItemWith:productCode];
    item.quantity++;
    NSLog(@"%d",item.quantity);
}


-(void)decQuantity1:(NSString *)productCode{
    CartItem *item = [self cartItemWith:productCode];
    item.quantity--;
    
    
    if(0==item.quantity)
        [self.items removeObject:item];
}

-(CartItem *)cartItemWith:(NSString *)productCode{
    for(CartItem *item in self.items){
        if([item.product isEqualProduct:productCode]){
            return item;
        }
    }
    return nil;
}
@end
