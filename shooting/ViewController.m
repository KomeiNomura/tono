//
//  ViewController.m
//  shooting
//
//  Created by 野村　孔命 on 13/12/12.
//  Copyright (c) 2013年 University of kitakyu. All rights reserved.
//

#import "ViewController.h"

#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    _pushjudge = 0;
    
    CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(moveChara)];
    displayLink.frameInterval = 1;
    [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(IBAction)pushDownButton:(id)sender{   //ボタンをしたときの処理
    UIButton* button = sender;
    _bector = button.tag;       //押されているボタンの判定　左4,右6
    _pushjudge = 1;    //ボタンが押されている状態にする
    if(_bector == 6)   //右が押されているときは
        _tono.image = [UIImage imageNamed:@"tono_right.gif"];  //画像を右向きにする
    else              //左が押されているなら
        _tono.image = [UIImage imageNamed:@"tono.gif"];  //画像を左向きにする
}

- (IBAction)pushUpButton:(id)sender {  //ボタンを離したときの処理
    _pushjudge = 0;    //ボタンが離されて状態にする
}

-(void)moveChara{     //キャラの動き描画
    
    tonoFrame = _tono.frame;
    if(_pushjudge == 1){     //ボタンが押されているかどうか
        if(_bector == 4)     //押されている向きが左なら
            tonoFrame.origin.x = _tono.frame.origin.x - 5;
            
        else{               //押されている向きが右なら
            tonoFrame.origin.x = _tono.frame.origin.x + 5;
        }
        [self limitCharaPoint];
        [_tono setFrame:tonoFrame];  //画像の描画
    }
}


-(void)limitCharaPoint{   //キャラの移動範囲制限
    
    float tonoWidth = tonoFrame.size.width;
    if(tonoFrame.origin.x < 0){   //左端に到達したら
        tonoFrame.origin.x = 0;
    }else if(tonoFrame.origin.x > 320-tonoWidth){//右端に到達したら
        tonoFrame.origin.x = 320-tonoWidth;
    }
    
}


-(void)ranceMove{
    
    
}




@end
