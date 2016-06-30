//
//  ViewController.m
//  homework0515
//
//  Created by 李康 on 16/5/15.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>



@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *linesFields;

@property (weak, nonatomic) IBOutlet UILabel *label;

@property(assign,nonatomic) int number;

@property (weak, nonatomic) IBOutlet UILabel *num;


@end

@implementation ViewController


-(NSString *)dataFilePath{
     //返回数据库文件路径
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString * documentDir = paths[0];
    
    NSLog(@"%@",documentDir);
    
    return [documentDir stringByAppendingPathComponent:@"data.sqlite"];
    
}





- (void)viewDidLoad {
    [super viewDidLoad];
    self.number = 0;
    // Do any additional setup after loading the view, typically from a nib.
    
    //数据库指针
    sqlite3 * database;
    //打开数据库
    if (sqlite3_open([[self dataFilePath]UTF8String], &database) != SQLITE_OK) {
        
        sqlite3_close(database);
        NSAssert(0, @"Failed to open database");
        
    }
    
    //创建表的sql语句，表名称为fields，字段row，整数，主键。field_data，文本类型
    NSString * createSQL = @"CREATE TABLE IF NOT EXISTS FIELDS(ID INTEGER PRIMARY KEY, CLASS TEXT, NAME TEXT ,NUMBER INT)";
    
    char * errorMsg;
    
    //执行创建表的sql语句
    if (sqlite3_exec(database, [createSQL UTF8String], NULL, NULL, &errorMsg) != SQLITE_OK ) {
        
        sqlite3_close(database);
        NSAssert(0, @"error creating table: %s ",errorMsg);
        
    }
    sqlite3_close(database);

   
    
    
}
- (IBAction)save:(UIButton *)sender {
    sqlite3 * database;
    if (sqlite3_open([[self dataFilePath]UTF8String], &database) != SQLITE_OK ) {
        sqlite3_close(database);
        NSAssert(0, @"failed to open database");
    }
    
    UITextField * field0 = self.linesFields[0];
    UITextField * field1 = self.linesFields[1];
    UITextField * field2 = self.linesFields[2];
    self.num.text =[NSString stringWithFormat:@"%d",self.number];
    //sql语句，执行插入或替换
    //        char * update = "INSERT OR REPLACE INTO FIELDS(ROW,FIELD_DATA) VALUES(?,?)";
    char * update = "INSERT OR REPLACE INTO FIELDS(ID,CLASS,NAME,NUMBER) VALUES(?,?,?,?)";
    sqlite3_stmt * stmt;
    if (sqlite3_prepare_v2(database, update, -1, &stmt, NULL) == SQLITE_OK) {
        //id变量绑定
        sqlite3_bind_text(stmt, 1, [field0.text UTF8String], -1, NULL);
        //class变量绑定
        sqlite3_bind_text(stmt, 2, [field1.text UTF8String], -1, NULL);
        //name变量绑定
        sqlite3_bind_text(stmt, 3, [field2.text UTF8String], -1, NULL);
        
        //int sqlite3_bind_int(sqlite3_stmt*, int, int);
        
        sqlite3_bind_int(stmt, 4, self.number);
        
        
        
        //执行更新
        if (sqlite3_step(stmt)!=SQLITE_DONE) {
            
            NSAssert(0, @"error updating table");
            
        }
        
        sqlite3_finalize(stmt);
        
    }
    
    self.number++;
    
    
    
    sqlite3_close(database);
    
    self.label.text=@"保存成功";
    
}

- (IBAction)clear:(id)sender {
    
    for (int i=0; i<3; i++) {
        UITextField * field = self.linesFields[i];
        field.text=@"";
    }
    self.label.text=@"清除成功";
  
    
}

- (IBAction)search:(id)sender {
    sqlite3 * database;
    //打开数据库
    if (sqlite3_open([[self dataFilePath]UTF8String], &database) != SQLITE_OK) {
        
        sqlite3_close(database);
        NSAssert(0, @"Failed to open database");
        
    }
    
    //查询表中的数据
    UITextField * field0 = self.linesFields[0];
    NSString *searchStr=[NSString stringWithFormat:@"SELECT * FROM FIELDS WHERE ID = %@",field0.text];

    sqlite3_stmt * statement;
    
    //对sql预编译
    if (sqlite3_prepare_v2(database, [searchStr UTF8String], -1, &statement, nil) == SQLITE_OK ) {
        
        //单步执行sql语句
        while (sqlite3_step(statement) == SQLITE_ROW ) {
            //取得返回行的第0列数据，整数类型。
            char * idNum = (char *)sqlite3_column_text(statement, 0);
            //取得返回行第一列，文本
            char * idClass = (char *)sqlite3_column_text(statement, 1);
            char * idName = (char *)sqlite3_column_text(statement, 2);
            char *num1 = (char *)sqlite3_column_text(statement, 3);
            
            
            
            //c字符串转为nsstring
            NSString * fieldValueID = [[NSString alloc]initWithUTF8String:idNum];
            NSString * fieldValueClass = [[NSString alloc]initWithUTF8String:idClass];
            NSString * fieldValueName = [[NSString alloc]initWithUTF8String:idName];
            
            NSString * Num = [[NSString alloc]initWithUTF8String:num1];
            //根据行号写文本框
            UITextField * theField1 = self.linesFields[0];
            theField1.text =fieldValueID;
            UITextField * theField2 = self.linesFields[1];
            theField2.text =fieldValueClass;
            UITextField * theField3 = self.linesFields[2];
            theField3.text =fieldValueName;
            self.num.text = Num;
            
            
            
        }
        self.label.text=@"搜索成功";
    }
    else{
        self.label.text=@"搜索失败";
    }
    
    
    //清除statement
    sqlite3_finalize(statement);
    sqlite3_close(database);
    
}

- (IBAction)last:(id)sender {

    //数据库指针
    sqlite3 * database;
    //打开数据库
    if (sqlite3_open([[self dataFilePath]UTF8String], &database) != SQLITE_OK) {
        
        sqlite3_close(database);
        NSAssert(0, @"Failed to open database");
        
    }
    //查询表中的数据
    
    
    int search = self.num.text.intValue;
    
    NSString *searchStr=[NSString stringWithFormat:@"SELECT * FROM FIELDS WHERE NUMBER = %d",search-1];
    
    //对上面sql语句的预编译结果
    sqlite3_stmt * statement;
    
    //对sql预编译
    if (sqlite3_prepare_v2(database, [searchStr UTF8String], -1, &statement, nil) == SQLITE_OK ) {
        
        //单步执行sql语句
        while (sqlite3_step(statement) == SQLITE_ROW ) {
            //取得返回行的第0列数据，整数类型。
            char * idNum = (char *)sqlite3_column_text(statement, 0);
            //取得返回行第一列，文本
            char * idClass = (char *)sqlite3_column_text(statement, 1);
            char * idName = (char *)sqlite3_column_text(statement, 2);
            char *num1 = (char *)sqlite3_column_text(statement, 3);

            //c字符串转为nsstring
            NSString * fieldValueID = [[NSString alloc]initWithUTF8String:idNum];
            NSString * fieldValueClass = [[NSString alloc]initWithUTF8String:idClass];
            NSString * fieldValueName = [[NSString alloc]initWithUTF8String:idName];
            NSString * Num = [[NSString alloc]initWithUTF8String:num1];
            

            //根据行号写文本框
            UITextField * theField1 = self.linesFields[0];
            theField1.text =fieldValueID;
            UITextField * theField2 = self.linesFields[1];
            theField2.text =fieldValueClass;
            UITextField * theField3 = self.linesFields[2];
            theField3.text =fieldValueName;
             self.num.text = Num;
        }
    }
    //清除statement
    sqlite3_finalize(statement);
    sqlite3_close(database);
    
    self.label.text=@"上一个";
    
    
    
    
    
    
    
}
- (IBAction)next:(id)sender {
    
    //数据库指针
    sqlite3 * database;
    //打开数据库
    if (sqlite3_open([[self dataFilePath]UTF8String], &database) != SQLITE_OK) {
        
        sqlite3_close(database);
        NSAssert(0, @"Failed to open database");
        
    }
    
    //读取三条记录写入三个文本框
    
    //查询表中的数据
    int search = self.num.text.intValue;

    
    NSString *searchStr=[NSString stringWithFormat:@"SELECT * FROM FIELDS WHERE NUMBER = %d",search+1];
    
    //对上面sql语句的预编译结果
    sqlite3_stmt * statement;
    
    //对sql预编译
    if (sqlite3_prepare_v2(database, [searchStr UTF8String], -1, &statement, nil) == SQLITE_OK ) {
        
        //单步执行sql语句
        while (sqlite3_step(statement) == SQLITE_ROW ) {
            //取得返回行的第0列数据，整数类型。
            char * idNum = (char *)sqlite3_column_text(statement, 0);
            //取得返回行第一列，文本
            char * idClass = (char *)sqlite3_column_text(statement, 1);
            char * idName = (char *)sqlite3_column_text(statement, 2);
            char *num1 = (char *)sqlite3_column_text(statement, 3);

            //c字符串转为nsstring
            NSString * fieldValueID = [[NSString alloc]initWithUTF8String:idNum];
            NSString * fieldValueClass = [[NSString alloc]initWithUTF8String:idClass];
            NSString * fieldValueName = [[NSString alloc]initWithUTF8String:idName];
             NSString * Num = [[NSString alloc]initWithUTF8String:num1];
            //根据行号写文本框
            UITextField * theField1 = self.linesFields[0];
            theField1.text =fieldValueID;
            UITextField * theField2 = self.linesFields[1];
            theField2.text =fieldValueClass;
            UITextField * theField3 = self.linesFields[2];
            theField3.text =fieldValueName;
             self.num.text = Num;
        }
    }
    //清除statement
    sqlite3_finalize(statement);
    sqlite3_close(database);
    self.label.text=@"下一个";
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
