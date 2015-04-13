//
//  ViewController.h
//  计算器
//
//  Created by wen@yoho on 15/4/9.
//  Copyright (c) 2015年 wen@yoho. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, Operation) {
    OperationAdd = 100, //+
    OperationMius, //-
    OperationMti, //*
    OperationDiv // ÷
};

typedef NS_ENUM(NSUInteger, ResultTag) {
    ResultTagReset = 1000, // 归零
    ResultTagRevers, //+
    ResultTagDivide100, //除以100
    ResultTagEquel //*
};

@interface ViewController : UIViewController


@end
