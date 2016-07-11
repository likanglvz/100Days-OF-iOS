//
//  ViewController.m
//  0513数据库
//
//  Created by AppleUser on 16/5/13.
//  Copyright © 2016年 heyanan. All rights reserved.
//

#import "ViewController.h"
#import  <sqlite3.h>

@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *lines;

@end

@implementation ViewController

-(NSString * )dataFiledPath
{
       //返回数据库路径
       NSArray * path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
       NSString * documentDir = path[0];
       NSLog(@"%@",documentDir);
       return [documentDir stringByAppendingPathComponent:@"data.sqlite"];
}
- (void)viewDidLoad {
       [super viewDidLoad];
       // Do any additional setup after loading the view, typically from a nib.
     //数据库指针
       sqlite3 * database ;
       //打开数据库
       if (sqlite3_open([[self dataFiledPath]UTF8String], &database) !=SQLITE_OK) {
              sqlite3_close(database);
              NSAssert(0, @"Failed to open database");
       }
      //创建表的sql语句，表名为fields，字段row，整数，主键，field_data，文本类型
       NSString * createSQL = @"CREATE TABLE IF NOT EXISTS FIELDS(ROW INTEGER PRIMARY KEY,FIELDS_DATA TEXT)";
       
       char * errorMsg;
       //执行创建表的sql语句
       if (sqlite3_exec(database, [createSQL UTF8String], NULL, NULL, &errorMsg)!= SQLITE_OK) {
              sqlite3_close(database);
               NSAssert(0, @"error crreating table:%s",errorMsg);
       }
       
       
       //读取四条记录写入四个文本框
       //查询表中的数据并排序
       NSString * query = @"SELECT ROW,FIELD_DATA FROM FIELDS ORDER BY ROW";
       //对上面SQL语句的预编译结果
       sqlite3_stmt * statement ;
       
       //对SQL预编译
       if (sqlite3_prepare_v2(database, [query UTF8String], -1, &statement, nil) == SQLITE_OK) {
              
              //单步执行SQL语句
              while (sqlite3_step(statement) == SQLITE_ROW) {
                     //取得返回行的第0页数据整数类型
                     int row = sqlite3_column_int(statement, 0);
                     //取得第一列返回行，文本
                     char * rowData =(char * ) sqlite3_column_text(statement, 1);
                     //c字符串转为string
                     NSString * fieldValue = [[NSString alloc]initWithUTF8String:rowData];
                     //更具行号写文本框
                     UITextField * thrField = self.lines[row];
                     thrField.text = fieldValue;
                     
                     
                     
              }
      }
       //清除statement
              sqlite3_finalize(statement);
              
              sqlite3_close(database);

       UIApplication *app = [UIApplication sharedApplication];
       [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(applicationWillResignActive:) name:UIApplicationWillResignActiveNotification object:app];
}
-(void)applicationWillResignActive:(NSNotification * )notification
{
       sqlite3 * database;
       if (sqlite3_open([[self dataFiledPath]UTF8String], &database) !=SQLITE_OK) {
              sqlite3_close(database);
              NSAssert(0, @"failed to open database");
              
       }
       for (int i = 0; i<4; i++) {
              UITextField * field = self.lines[i];
             //SQL语句执行的是插入或替换
              char * update = "INSERT OR REPLACE INTO FIELDS(ROW,FIELD_DATA) VALEUS(?,?)";
              char * errorMsg;
              sqlite3_stmt * stmt;
              if (sqlite3_prepare_v2(database, update, -1, &stmt, NULL)==SQLITE_OK) {
                     //int执行变量绑定
                     sqlite3_bind_int(stmt, 1, i);
                     //text变量绑定
                     sqlite3_bind_text(stmt, 2, [field.text UTF8String], -1, NULL);
              }
              //执行更新
              if (sqlite3_step(stmt)!=SQLITE_DONE) {
                     NSAssert(0,@"error updating table");
                     
              }
              sqlite3_finalize(stmt);
       }
       sqlite3_close(database);
}
- (void)didReceiveMemoryWarning {
       [super didReceiveMemoryWarning];
       // Dispose of any resources that can be recreated.
}

@end
