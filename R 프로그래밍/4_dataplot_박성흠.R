df <- as.data.frame(ggplot2::mpg)
head(df)
str(df)

df$drv <- as.factor(df$drv)
df$cyl <- as.factor(df$cyl)
plot(df$hwy)#int
plot(df$drv)#factor형 변수

attach(df)

# 2변수 plot
plot(cty,hwy)
plot(hwy~cty)# 2개다 같은 방법

plot(drv,hwy)#x축 factor, y축 수치형int형
plot(drv,cyl)#x,,y 모두 factor 형

#데이터프레임 전체
plot(df)

# bar plot
t_cyl <- table(cyl)
t_cyl
barplot(t_cyl)
t_class <- table(class)
t_class
barplot(t_class)

plot(cyl)
plot(class)# int형은안되니까 factor로 바꾸자
plot(as.factor(class))

#평균막대
mean_bar <- tapply(hwy,drv,mean)
mean_bar

barplot(mean_bar, ylim = c(0,40))# y축 최대최소 설정 가능

#boxplot
boxplot(cty)
boxplot(cty~drv)

#histogram
hist(cty)
hist(cty, breaks = seq(0,40,5))# 나누는 구간,linspace를 breaks를 통해 표현,grid


#저수준 차트 그리기
plot(cty~hwy, ann = F)# 디폴트로 주어지는
title(main='도시연비와 도로연비의 관계', xlab='도로연비', ylab = '도시연비')
grid()

h_mean <- mean(hwy)
h_mean
abline(v=h_mean, col='red')


#line chart, 겹쳐서 나타내기
runif(30)# f랜덤으로 실수형으로 30개 만들어주는 함수
ts1<- sort(round(runif(30) * 100))
ts1

ts2<- sort(round(runif(30) * 100))
ts2

plot(ts1, type = 'l')
lines(ts2, lty = 'dashed', col = 'red')# lty= line type

detach(df)
