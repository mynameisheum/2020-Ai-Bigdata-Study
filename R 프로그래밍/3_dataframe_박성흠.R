#데이터프레임집계
exam <- read.csv('박성흠 - Rbasic_datafile/exam.csv')
str(exam)
mean(exam$korean)
mean(exam$english)
mean(exam$math)
mean(exam$science)

data.frame(kor=mean(exam$korean),
           eng=mean(exam$english),
           mat=mean(exam$math),
           sci=mean(exam$science))
apply(exam[c(3:6)],2,mean)
exam

str(exam)
str(cars)
attributes(exam)
attributes(cars)

dim(exam)
dim(cars)

ncol(exam); nrow(exam)
ncol(cars);nrow(cars)

names(exam); colnames(exam)
rownames(cars); row.names(cars)

summary(exam)
summary(cars)

head(cars)
tail(cars,3)

sum(exam$korean)
attach(exam)
sum(korean)
mean(english)
detach(exam)

mean(exam$english)
with(exam, mean(english))
with(exam, mean(math))
#부분데이터조회 like 조건문
subset(exam, korean >= 80, select = c(name,korean,english))

# 수학평균보다 낮은 학생들 번호빼고 다 불러
mean(exam$math)
subset(exam, math <mean(math), select = -c(std_no))

#영어점수 제일 높은 학생
subset(exam ,english == max(english))

d1 <- data.frame(kids = c('jack','jane','jone','rely'),
                 states = c('ca','ny','nv','tx'))
d1

d2 <- data.frame(kids = c('jane','jack','kevin'),
                 age = c(10,12,8))
d2

d3 <- data.frame(
                 age = c(10,12,8),
                 name=c('jane','jack','kevin'))
d3

merge(d1,d2)# 이름이 같은 것들이 있는것만 merge함
merge(d1,d2,by='kids')

merge(d1,d3)# 컬럼에 같은게 아무것도 없지?
            # 모든 가능한 조합에 대해서 다 쓴거지
merge(d1,d3, by.x='kids',by.y = 'name')
merge(d1,d3, by.x='kids',by.y = 'name',all='T')# 값이 존재하지않는건 NA로 표현
merge(d1,d3, by.x='kids',by.y = 'name',all.x = T) #d1기준으로 다 표현 like left join

x <- array(1:9, c(3,3))
x

is.data.frame(x)# dataframe인가 물어보는거
is.data.frame(exam)
x<- as.data.frame(x)

is.data.frame(x)
names(x) <- paste('col',1:3)# 변수에 이름 붙이기
x

write.csv(exam,'박성흠 - Rbasic_datafile/exam.csv')
# view file로 보니까 한글이 다 깨져있구만
write.csv(exam,'박성흠 - Rbasic_datafile/exam.csv',
          quote = F,
          row.names=F,
          fileEncoding='utf-8')# 행 인덱스지우고 ,한글깨지는것도 고치고/이렇게 저장하게다

lst <- list(name = 'fred',wife = 'amy',no.children=3, child.age = c(4,7,9))
lst# 데이터의 형태도,길이도 다 다르네
lst$wife
lst[2]
lst[[2]]

class(lst$wife)
lst['wife']
lst[2]

class(lst['wife'])
class(lst[[2]])

lst$child.age[2]#백터니까 인덱스로 접근하면 되겠네

lst$country <- c('canada')
lst

lst$child.age <- lst$child.age +1# 내용 변경 가능
lst

names(lst)# 리스트의 변수이름을 확인할수있고

names(lst)[1] <- 'family'
names(lst)

lst[1]

lst['country'] <- NULL # 리스트의 항목,변수 삭제제
lst

new_list <- c(lst, list(country = 'canada'))# 새로운 list 합체체
new_list

length(new_list) # python의 len()과 같은 역할이네

# 백터의 특징= 모든 데이터형이 같게됨,다르더라도 같도록 변하게 되는거지


unlst <- unlist(new_list)
unlst# 백터로 만든거, int=>문자형, child.age 1,2,3이 자동생성
unlst$family
unlst[2]# list를 풀면 vertor가 되니까 index로 접근해야해
unlst['family']
x <- list(a = 1:3, b = 4:6)
x
lapply(x,mean)

head(iris,5)
res_l<-lapply(iris[1:4], mean)# list로 반환

res_s<-sapply(iris[1:4],mean)# vertor의 형태로 반환

class(res_l)
class(res_s)

lapply(iris[1:2],mean)
head(iris,5)

     