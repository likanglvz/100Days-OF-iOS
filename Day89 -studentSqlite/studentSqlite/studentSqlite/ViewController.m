//
//  ViewController.m
//  studentSqlite
//
//  Created by 李康 on 16/5/16.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>




@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *num;
@property (weak, nonatomic) IBOutlet UITextField *classname;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UILabel *status;

@end

@implementation ViewController

{
    sqlite3 *dataBase;
    NSString * databasePath;
    int currentID;
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = dirPaths[0];
    
    databasePath = [docsDir stringByAppendingPathComponent:@"info.sqlite3"];
    
    NSFileManager *filemanager = [NSFileManager defaultManager];
    //判断如果数据库文件不存在，则创建
    if ([filemanager fileExistsAtPath:databasePath]==NO) {
        const char * dbpath = [databasePath UTF8String];
        if (sqlite3_open(dbpath, &dataBase)== SQLITE_OK) {
            
            char *errmsg;
            const char * createsql = "CREATE TABLE IF NOT EXISTS INFO(ID INTEGER PRIMARY KEY AUTOINCREMENT, NUM TEXT, CLASSNAME TEXT, NAME TEXT)";
            //调用sqlite api 执行sql语句
            if (sqlite3_exec(dataBase, createsql, NULL, NULL, &errmsg) != SQLITE_OK ) {
                self.status.text = @"创建失败";
                sqlite3_close(dataBase);
                NSAssert(0, @"error creating table: %s ",errmsg);
            }
            
            
        }else{
            self.status.text = @"打开数据库失败";
            //
            
            
        }
        
 
    }else{
        //info.sqlite3存在，则打开它
        if (sqlite3_open([databasePath UTF8String], &dataBase)!=SQLITE_OK) {
            
            self.status.text = @"数据库文件存在，但打开数据库失败";
            sqlite3_close(dataBase);

        }
    }
    
    
    //数据库打开了，表也存在了
    //查询sql
    NSString *query = @"SELECT ID,NUM,CLASSNAME,NAME FROM INFO ORDER BY ID";
    
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(dataBase, [query UTF8String], -1, &statement, NULL) == SQLITE_OK ) {
        while (sqlite3_step(statement)==SQLITE_ROW) {
            //int idd = sqlite3_column_int(statement,0);//取得第0列的数据
            currentID =sqlite3_column_int(statement,0);
            
            
            char * num = (char *)sqlite3_column_text(statement,1);
            char * classname = (char *)sqlite3_column_text(statement,2);
            char * name = (char *)sqlite3_column_text(statement,3);

            //写各个文本框
            NSString *fieldValue = [[NSString alloc]initWithUTF8String:num];
            self.num.text = fieldValue;
            
            fieldValue = [[NSString alloc]initWithUTF8String:classname];
            self.classname.text = fieldValue;
            
            fieldValue = [[NSString alloc]initWithUTF8String:name];
            self.name.text = fieldValue;

        }
        
        sqlite3_finalize(statement);
        
    }
    
    sqlite3_close(dataBase);

}
- (IBAction)save:(id)sender {
    //保存数据
    sqlite3_stmt * statement;
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &dataBase)== SQLITE_OK) {
        if ([self.num.text isEqualToString:@""]) {
            //学号不能为空
            NSLog(@"学号不能为空");
            
        }else{
            //插入数据的sql语句
            NSString *insertSql = [NSString stringWithFormat:@"INSERT INTO INFO (num,classname,name) VALUES('%@','%@','%@')",self.num.text,self.classname.text,self.num.text];
            //预编译sql  结果放入stmt
            sqlite3_prepare_v2(dataBase, [insertSql UTF8String], -1, &statement, NULL);
            if (sqlite3_step(statement)==SQLITE_DONE) {
                //保存成功 清空文本框
                self.status.text=@"保存成功";
                self.num.text = @"";
                self.classname.text = @"";
                self.name.text = @"";
                
                
                
            }else{
                
                self.status.text=@"保存失败";
            }
            
        }
        
        sqlite3_finalize(statement);
        sqlite3_close(dataBase);
        
    }
    
}
- (IBAction)last:(id)sender {
    if (sqlite3_open( [databasePath UTF8String], &dataBase) != SQLITE_OK) {
        NSAssert(0, @"Failed to open database");
        return;
        
    }
    NSString *query = @"SELECT ID,NUM,CLASSNAME,NAME FROM INFO ORDER BY ID";
    
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(dataBase, [query UTF8String], -1, &statement, NULL) == SQLITE_OK ) {
        while (sqlite3_step(statement)==SQLITE_ROW) {
            int idd = sqlite3_column_int(statement,0);
            if (idd == currentID-1) {
                char * num = (char *)sqlite3_column_text(statement,1);
                char * classname = (char *)sqlite3_column_text(statement,2);
                char * name = (char *)sqlite3_column_text(statement,3);

                //写各个文本框
                NSString *fieldValue = [[NSString alloc]initWithUTF8String:num];
                self.num.text = fieldValue;
                
                fieldValue = [[NSString alloc]initWithUTF8String:classname];
                self.classname.text = fieldValue;
                
                fieldValue = [[NSString alloc]initWithUTF8String:name];
                self.name.text = fieldValue;

                currentID-=1;
                
                break;
                
            }
            
        }

    }
    
    sqlite3_finalize(statement);
    sqlite3_close(dataBase);

    
}
- (IBAction)next:(id)sender {
    if (sqlite3_open( [databasePath UTF8String], &dataBase) != SQLITE_OK) {
        NSAssert(0, @"Failed to open database");
        return;
        
    }
    NSString *query = @"SELECT ID,NUM,CLASSNAME,NAME FROM INFO ORDER BY ID";
    
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(dataBase, [query UTF8String], -1, &statement, NULL) == SQLITE_OK ) {
        while (sqlite3_step(statement)==SQLITE_ROW) {
            int idd = sqlite3_column_int(statement,0);
            if (idd == currentID+1) {
                char * num = (char *)sqlite3_column_text(statement,1);
                char * classname = (char *)sqlite3_column_text(statement,2);
                char * name = (char *)sqlite3_column_text(statement,3);
                
                //写各个文本框
                NSString *fieldValue = [[NSString alloc]initWithUTF8String:num];
                self.num.text = fieldValue;
                
                fieldValue = [[NSString alloc]initWithUTF8String:classname];
                self.classname.text = fieldValue;
                
                fieldValue = [[NSString alloc]initWithUTF8String:name];
                self.name.text = fieldValue;
                
                currentID+=1;
                
                break;
                
            }
            
        }
        
    }
    
    sqlite3_finalize(statement);
    sqlite3_close(dataBase);

    
}
- (IBAction)search:(id)sender {
    
    sqlite3_stmt *statement;
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &dataBase)== SQLITE_OK) {
        NSString *querySql = [NSString stringWithFormat:@"SELECT CLASSNAME,NAME FROM INFO WHERE NUM = '%@'",self.num.text];
        if (sqlite3_prepare_v2(dataBase, [querySql UTF8String], -1, &statement, NULL) == SQLITE_OK ) {
        //执行查询语句 返回结果
            if (sqlite3_step(statement)==SQLITE_ROW) {
                
                char * classname = (char *)sqlite3_column_text(statement,0);
                char * name = (char *)sqlite3_column_text(statement,1);
                
                //写各个文本框
                NSString *fieldValue = [[NSString alloc]initWithUTF8String:classname];
                self.classname.text = fieldValue;
                
                fieldValue = [[NSString alloc]initWithUTF8String:name];
                self.name.text = fieldValue;

                self.status.text=@"查询成功";
                
            }else{
                self.status.text=@"查询失败";

            }
        
        }
    
    }
    
    sqlite3_finalize(statement);
    sqlite3_close(dataBase);
    
}
- (IBAction)clear:(id)sender {
    self.num.text = @"";
    self.classname.text = @"";
    self.name.text = @"";
    self.status.text = @"";
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
