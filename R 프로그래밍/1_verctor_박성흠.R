x <- c(10.4,5.6,3.1,6.4,21.7)
c(10.4,5.6,3.1,6.4,21.7) -> x
x

lg <- c(TRUE,FALSE,FALSE)
lg

y <- c(x,0,x)
y
assign('z',c(10.4,5.6,3.1,6.4,21.7))
z
# <-c나 assign으로 정의해줄수잇음

s1 <- seq(lengh =51, from =-5,by=.2)
# range(5-,51,0.2)
s2 <- rep(1:5, times = 5)
s2
# 반복 5번
s3 <- rep(1:5, each = 5)
s3
# 각자 5번씩 반복
labs <- paste(c('x','y'), 1:10,sep = '-')
labs
#백터 순서정의?
#이름이나 index 정의할때
fruit <- c(5,10,1,20)
names(fruit) <- c('orange','banana',"apple",'peach')

fruit['apple']
fruit[c('orange','apple')]

#인덱스
x <- c(11:15)
x
x[2]
x[c(1,3,5)]
# 그 위치의 요소를 제거하고 출력
x[-2]
x[2:4]
x[-c(2,4)]
x[x>12]
x[x>=12 & x <= 14]
x[2] <- 20
x
x[c(3,4)] <- 30;x
x[x < 30] <- 10;x
x[-2] <- 100; x
#데이터형 확인

z <- 0:9
z
mode(z)

d_chr <- as.character(z)
d_chr

mode(d_chr)
d <- as.integer(d_chr)
d
mode(d)

10+3
10-3
10^3
10**3
10%%3
10%/%3
10 < 3
10>3
10==3
10!=3

TRUE | TRUE
TRUE | FALSE
TRUE & TRUE
TRUE & FALSE

!TRUE
!FALSE
isTRUE(TRUE)
isTRUE(FALSE)

x <- c(1,2,3)
y <-c(3,4,5)
z <-c(3,1,2)

x
y
z
union(x,y)
intersect(x,y)
setdiff(x,y)
intersect(x,y,z)
setdiff(y,x)

setequal(x,y) # 다른요소인지
setequal(x,z)

w <- c(1,2,3,4)
x<-c(5,6,7,8)
y<-c(3,4)
z<-c(5,6,7)

w;x;y;z;
w+y#배수관계(브로드캐스팅)
w+z
w+x

x<- 10:20
x
any(x > 15)# 존재하는가
all(x>15) # 15보다 작은값이 존재하기에 false
which(x>15)# 인덱스값으로 위치 확인
subset(x,x>15)# 부분백터로 다시만듬 /15보다 큰것만

x<- c(32,1,NA,46,8)
y <- c(32,1,NULL,46,8)
x;y;

mean(x) # 알수없는값이 잇어서 안됨
mean(x, na.rm = T) # 알수업슨값을 제거할게
mean(y)

c(1,'a')# 숫자<문자 
c(1,1.1)# 정수<실수
c(1,1.1,'a')#정수<실수<문자

ch<- c('a','b','c')
num <- c(1,2,3)
ch+num#문자+숫자 불가능

