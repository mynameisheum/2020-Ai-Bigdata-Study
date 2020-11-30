data <- c(1:8)
data
m1 <- matrix(data=data, nrow=2,ncol=4)
m1
colnames(m1) <- paste(c('c'), 1:4 , sep = '')
ml
rownames(m1) <- c('r1','r2')
m1
dimnames(m1) <- list(c('row1','row2'),
                     c('col1','col2','col3','col4'))
m1
m2 <- matrix(11:18,2,4,byrow=T,
             dimnames = list(c('row1','row2'),
                             c('col1','col2','col3','col4')))
m2
m1
m1[1,1]
m1[1,]
m1[2,]
m1[2,c(1:2)]
m1[2,c(2:4)]
m2['row1','col2']
m2['row1',]
m2['row2', c('col1','col3')]

x <- matrix(1:4,nrow=2)
y <- matrix(5:8, nrow=2)
x
y
x+y
x-y
x%*%y
t(x)
x
aperm(x)
det(x)

rbind(x,y)
cbind(x,y)


d1 <- array(1:36,dim =c(6,3,2))
d1
d1[2,2,2]
d1[2,2,]
d1[,2,2]
d1[2,,]
d1[,,2]
d1[2,,2]
d1[,2,2]

dim(d1)# 이미 생성된 배열의 차원 확인
x <- 1:12
dim(x) <- c(3,4)# 3행 4열짜리 2차원으로 만들어줄게
x
apply(x,1,sum)#1이면 행방향,2면 열방향향
apply(x,2,sum)


blood.type <- c('a','a','b','ab','b','o')
blood.type
class(blood.type)
mode(blood.type)
blood.type <- factor(blood.type)#group화할때의 기준,축설정중복x?
blood.type
class(blood.type)
mode(blood.type)

grade <- ordered(c('advanced'), levels = c('beginner','intermediate','advanced','expert'))
grade
class(grade)
size <- factor(c('large','large','small'),
               level = c('small','medium','large','x-large'),
               ordered = T)
size
class(size)

nlevels(grade)
levels(grade)
is.factor(grade)
is.ordered(grade)
is.ordered(blood.type)

#data.frame만드는법
no <- c(1:5)
name <- c('apple','banana','carrot','peach','potato')
kind <- factor(c('fr','fr','ve','fr','ve'))#level1,2자동생성
qty <- c(10,5,7,3,12)
price <- c(1000,2000,500,2500,800)
store <- data.frame(No=no, Name = name, Kind = kind, Price = price, Qty = qty)
store
class(store)
str(store)

#dataframe 직접생성하는 법
student<- data.frame(name = c('kate','andy','alice','he'),
                     gender=c('f','m','f','m'),
                     grade = c(2,3,1,4))
student
#절대 경로로, 직접 가져온거고 csv로 가져올게
df_ch <- read.csv('C:/Rstart/1st_Rproject/박성흠 - Rbasic_datafile/character-deaths.csv')
df_ch
head(df_ch)

class(df_ch)
str(df_ch)

#상대경로로 table로 가져올게
#header에 T넣으니까 column을 제목으로 안읽게 만드네
df_car <- read.table('박성흠 - Rbasic_datafile/cars.txt',header = T)
df_car
str(df_car)

df_cars <- read.csv('박성흠 - Rbasic_datafile/cars.csv', header = T)
df_cars
head(df_cars)
str(df_cars)


# header가 없는 data이기에 자동으로 v1,v2생성
fr1 <- read.table('박성흠 - Rbasic_datafile/fruits.txt',skip = 3)# 주석제외 위에서 3개 생략
fr1

fr2 <- read.table('박성흠 - Rbasic_datafile/fruits.txt', nrows = 3)#주석제외 위에서 3개
fr2
data()
cars <- mtcars
head(cars)
str(cars)
cars
cars[1,2]
cars[c(1:5),1]
cars[c(1:5),1, drop = F]# dataframe으로 출력 가느

mean(cars$mpg)# 백터형태
mean(cars[['mpg']])
mean(cars['mpg'])# 백터형이 아닌 dataframe형이라 함수를 쓰지못함함


cars[1,1]
cars[1,1] <- 20# 값 변경 가능,응용해서 class 변경도 가능
class(cars$cy)
cars$cyl <- as.factor(cars$cyl)# categorical느낌이니까 factor로 바꿔보자자
cars$cyl
cars$am<- as.factor(cars$am)
cars$am
str(cars)# am, cyl이 factor로 바뀌엿구만

cars$plus <- cars$ mpg * 100
head(cars)
cars$plus <- NULL
cars$plus
head(cars)# plus 라인이 사라졌구만

cars[,c('cyl','gear','hp')]
cars[,-c(2,4)]# 2,4번 제외
cars[,-c('cyl','hp')]# int만 가능
cars[c('cyl','gear','hp')]# 이먼엔 row 지울거야
cars[-c(2,4)]

cars[1:5,]
cars[c(10:20),]

# 조건문
cars[cars$cyl == 6,]
cars[cars$cyl ==4 | cars$cyl == 6, c('mpg','hp','cyl')]# | 이용
cars[cars$cyl %in% c(4,6), c('mpg','hp','cyl')]# %in% 이용해서 or 표현
