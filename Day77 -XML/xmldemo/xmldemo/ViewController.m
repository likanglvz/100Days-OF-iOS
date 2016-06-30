//
//  ViewController.m
//  xmldemo
//
//  Created by 李康 on 16/5/24.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"
#import "TBXML.h"
#import "TBXML+HTTP.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *toLabel;
@property (weak, nonatomic) IBOutlet UITextView *contentLabel;

@property (weak, nonatomic) IBOutlet UILabel *fromLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UITextField *inputUrlField;
//当前标签的名字
@property(strong,nonatomic) NSString *currentTagName;




@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)prase:(id)sender {
    
    if ([self.inputUrlField.text isEqualToString:@""]) {
        NSString *path;
        NSURL *url;
        
        //本地文件
        path = [[NSBundle mainBundle]pathForResource:@"note" ofType:@"xml"];
        //将路径转成url
        url = [NSURL fileURLWithPath:path];
        // 创建xml解析器
        NSXMLParser *parser = [[NSXMLParser alloc]initWithContentsOfURL:url];
        parser.delegate = self;
        
        //开始解析
        [parser parse];
    }
    
    else{
        NSURL *url;
        url = [NSURL URLWithString:self.inputUrlField.text];
        
        NSXMLParser *parser = [[NSXMLParser alloc]initWithContentsOfURL:url];
        parser.delegate = self;
        
        //开始解析
        [parser parse];

    }
    
  
}
#pragma mark - nsxml parse
-(void)parserDidStartDocument:(NSXMLParser *)parser{//文档开始的时候触发,调用一次

    NSLog(@"start document");
   
}

-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError{//解析出错时触发
    
    NSLog(@"%@",parseError);
    
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{//遇到开始标签时触发
    //保存一下当前标签名
    _currentTagName = elementName;
    
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{//遇到字符串时触发
    
    if ([_currentTagName isEqualToString:@"to"]) {
        self.toLabel.text = string;
    }
    if ([_currentTagName isEqualToString:@"content"]) {
        self.contentLabel.text = string;
    }
    if ([_currentTagName isEqualToString:@"from"]) {
        self.fromLabel.text = string;
    }
    if ([_currentTagName isEqualToString:@"date"]) {
        self.dateLabel.text = string;
    }
}
- (IBAction)jsonPrase:(id)sender {
    
    
    //解析json文档
    if ([self.inputUrlField.text isEqualToString:@""]) {
   
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    NSString *path = [[NSBundle mainBundle]pathForResource:@"note" ofType:@"json"];
    //读入json的文件 到nsdata
    NSData *jsondata = [[NSData alloc]initWithContentsOfFile:path];
    
    NSError *error ;
    //从文档解析出oc对象  (由json数据返回foundation对象) option选项3个  分为：1，返回可变字典或数组，2，可变字符串（叶子） 3， 允许最外层不是字典或数组
        NSDictionary *dict1 = @{@"key":@"value"};
        //将foundation写成json格式
        NSData *data = [NSJSONSerialization dataWithJSONObject:dict1 options:0 error:nil];
        //
        //        NSString *string = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        //从json格式读入解析为oc对象
        NSDictionary *dict2 = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        
        NSMutableString *ms = [dict2 objectForKey:@"key"];
        ms = [[NSMutableString alloc]initWithString:@"sss"];
        

    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsondata options:NSJSONReadingMutableContainers error:&error];
    
    if (error) {
        NSLog(@"解析失败 %@",error);
        return;
        
    }
    dict = jsonObj;
    self.toLabel.text = dict[@"to"];
    self.contentLabel.text = dict[@"content"];
    self.fromLabel.text = dict[@"from"];
    self.dateLabel.text = dict[@"date"];
    
    }else{
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        NSURL *url;
        url = [NSURL URLWithString:self.inputUrlField.text];

        NSData *jsondata = [[NSData alloc]initWithContentsOfURL:url];
        
        NSError *error ;
        //从文档解析出oc对象  (由json数据返回foundation对象) option选项3个  分为：1，返回可变字典或数组，2，可变字符串（叶子） 3， 允许最外层不是字典或数组
        
        
        id jsonObj = [NSJSONSerialization JSONObjectWithData:jsondata options:NSJSONReadingMutableContainers error:&error];
        
        if (error) {
            NSLog(@"解析失败 %@",error);
            return;
            
        }
        dict = jsonObj;
        self.toLabel.text = dict[@"to"];
        self.contentLabel.text = dict[@"content"];
        self.fromLabel.text = dict[@"from"];
        self.dateLabel.text = dict[@"date"];
        
        
        
    }
    
    
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{//遇到结束标签时触发
    
    _currentTagName = nil;
    
}

-(void)parserDidEndDocument:(NSXMLParser *)parser{//文档结束时触发
    
    NSLog(@"解析完毕");
    
}
- (IBAction)TBXML:(id)sender {
    
    //解析本地的
    /*
    //创建xml对象
    TBXML *tbxml = [[TBXML alloc]initWithXMLFile:@"note.xml" error:nil];
    //根元素
    TBXMLElement *root = tbxml.rootXMLElement;
    if (root) {
        //得到子元素
        TBXMLElement *toElement = [TBXML childElementNamed:@"to" parentElement:root];
        
        if (toElement!=nil) {
            //取文本
            self.toLabel.text = [TBXML textForElement:toElement];
            
        }
        
        TBXMLElement *contentElement = [TBXML childElementNamed:@"content" parentElement:root];
        
        if (contentElement!=nil) {
            
            self.contentLabel.text = [TBXML textForElement:contentElement];
            
        }
        
        TBXMLElement *fromElement = [TBXML childElementNamed:@"from" parentElement:root];
        
        if (fromElement!=nil) {
            
            self.fromLabel.text = [TBXML textForElement:fromElement];
            
        }
        
        TBXMLElement *dateElement = [TBXML childElementNamed:@"date" parentElement:root];
        
        if (dateElement!=nil) {
            
            self.dateLabel.text = [TBXML textForElement:dateElement];
            
        }
        
        
        
        
    }
    
    */
    

    
    TBXMLSuccessBlock s = ^(TBXML *tbxml){
        
        TBXMLElement *root = tbxml.rootXMLElement;
        if (root) {
            //得到子元素
            TBXMLElement *toElement = [TBXML childElementNamed:@"to" parentElement:root];
            
            if (toElement!=nil) {
                //取文本
                dispatch_sync(dispatch_get_main_queue(), ^{
                  
                    self.toLabel.text = [TBXML textForElement:toElement];

                });
                
                toElement=nil;
                
            }
            
            TBXMLElement *contentElement = [TBXML childElementNamed:@"content" parentElement:root];
            
            if (contentElement!=nil) {
                
            
                dispatch_sync(dispatch_get_main_queue(), ^{
                    
                   self.contentLabel.text =[TBXML textForElement:contentElement];
                    
                });
                
                contentElement=nil;
                
            }
            
            TBXMLElement *fromElement = [TBXML childElementNamed:@"from" parentElement:root];
            
            if (fromElement!=nil) {
                dispatch_sync(dispatch_get_main_queue(), ^{
                    
                  self.fromLabel.text = [TBXML textForElement:fromElement];
                });
                
                fromElement=nil;
                
            }
            
            TBXMLElement *dateElement = [TBXML childElementNamed:@"date" parentElement:root];
            
            if (dateElement!=nil) {
                dispatch_sync(dispatch_get_main_queue(), ^{
                    
                     self.dateLabel.text = [TBXML textForElement:dateElement];
                    
                });
               
                dateElement=nil;
                
            }
 
        }
        
    };
    
    TBXMLFailureBlock f = ^(TBXML *tbxml,NSError *error){
        
        
        NSLog(@"error");
        
        
    };
    
    
    
    //通过url创建tbxml对象
    TBXML *tbxml = [[TBXML alloc]initWithURL:[NSURL URLWithString:@"http://127.0.0.1/note.xml"] success:s failure:f];
    
    
    
    
    
    
    
    
    
    
}























@end
