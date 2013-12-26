//
//  ViewController.h
//  shooting
//
//  Created by 野村　孔命 on 13/12/12.
//  Copyright (c) 2013年 University of kitakyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    CGRect tonoFrame;
}



@property int bector;      //進行方向を保存する変数
@property int pushjudge;   //方向ボタンが押されているかどうかを判定する

@property (weak, nonatomic) IBOutlet UIImageView *tono;        //殿画像

@property (weak, nonatomic) IBOutlet UIImageView *rance;   //槍画像

-(IBAction)pushDownButton:(id)sender; 
- (IBAction)pushUpButton:(id)sender;

-(void)moveChara;
-(void)limitCharaPoint ;
-(void)ranceMove;

@end
