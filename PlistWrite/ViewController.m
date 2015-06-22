//
//  ViewController.m
//  PlistWrite
//
//  Created by MAEDAHAJIME on 2015/06/22.
//  Copyright (c) 2015年 MAEDAHAJIME. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lbString;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // ホームディレクトリを取得
    NSString *homeDir = NSHomeDirectory();
    
    // 書き込みたいplistのパスを作成
    NSString *filePath = [homeDir stringByAppendingPathComponent:@"sample.plist"];
    
    // 書き込むデータを作成
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"Snoopy", @"name",
                          [NSNumber numberWithInt:3], @"age",
                          nil];
    
    // 書き込み
    BOOL result = [dict writeToFile:filePath atomically:YES];
    if (!result) {
        NSLog(@"ファイルの書き込みに失敗");
        self.lbString.text = @"ファイルの書き込みに失敗";
    }
    
    NSLog(@"ファイルの書き込みが完了しました");
    self.lbString.text = @"ファイルの書き込みが完了しました";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
