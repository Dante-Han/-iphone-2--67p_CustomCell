//
//  Cart.m
//  CustomCell201
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "Cart.h"
#import "CartItem.h"
#import "CartDelegate.h"

@interface Cart()

@end

@implementation Cart



static Cart *_instance = nil;



+(id)defaultCart{
    if(nil == _instance)
        _instance = [[Cart alloc]init];
    return _instance;
}//싱글톤 만드는 코드
-(id)   init
{
    self=[super init];
    if(self)
    {
        self.items = [[NSMutableArray alloc]init];
        
    }
    return self;
}

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
        [self incQuantity:item.code];
    }
}

-(void)incQuantity:(NSString *)productCode{
    CartItem *item = [self cartItemWith:productCode];
    item.quantity++;
    NSLog(@"%d",item.quantity);
}


-(void)decQuantity:(NSString *)productCode{
    CartItem *item = [self cartItemWith:productCode];
    item.quantity--;
    
    // 제품 수량이 0이면 삭제
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
