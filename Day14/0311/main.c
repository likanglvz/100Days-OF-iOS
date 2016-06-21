//
//#include <stdio.h>
//int main() {
//    struct day{
//        int year;
//        int month;
//        int day;
//    };
//    
//    struct Person{
//        char *name;
//        struct day bir;
//        double height;
//        char sex;
//    }per;
//    per.name="jack";
//    struct day bir={1993,12,12};
////    per.bir.year=1998;
////    per.bir.month=10;
////    per.bir.day=12;
//    
//    per.height=1.78;
//    per.sex='M';
//    //int i=sizeof(per);
//    printf("name=%s,height=%f,sex=%c,%d\n",per.name,per.height,per.sex,per.bir);
//    //printf("%d",i);
//    return 0;
//}

#include<stdio.h>
#include<string.h>
struct stu{
    char *name;
    int age;
};
void shuchu(struct stu str[]);
void agepaixu(struct stu str[]);
void namepaixu(struct stu str[]);
int main(){
    struct stu str[5]={{"yi",20},{"er",21},{"san",24},{"si",23},{"wu",22}};
    agepaixu(str);
    shuchu(str);
    namepaixu(str);
    shuchu(str);
    
    return 0;
}
void shuchu(struct stu str[]){
    for (int i=0; i<5; i++) {
        printf("%s,%d\n",str[i].name,str[i].age);
    }
    printf("\n");
    return;
}
    
    


void agepaixu(struct stu str[]){

for (int i=0; i<5; i++) {
    for (int j=0; j<5-i-1; j++) {
        if (str[j].age>str[j+1].age) {
            struct stu temp;
            temp=str[j];
            str[j]=str[j+1];
            str[j+1]=temp;
            
        }
    }
}
    return;
}


void namepaixu(struct stu str[]){
    
    for (int i=0; i<5; i++) {
        for (int j=0; j<5-i-1; j++) {
            if(strcmp(str[j].name,str[j+1].name)>0){
                struct stu temp;
                temp=str[j];
                str[j]=str[j+1];
                str[j+1]=temp;
                
            }
        }
    }
    return;
}


int camAge(struct )
















