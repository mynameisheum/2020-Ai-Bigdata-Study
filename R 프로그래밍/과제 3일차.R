data <- read.csv('C:/Rstart/1st_Rproject/박성흠 - Rbasic_datafile/박성흠 - titanic_data.csv')
str(data)

dim(data)[1]
idx <-sample(1:dim(data)[1], size = 100)# 100개 가져오겟노라
data[idx,]# 이건 갯수고

idx <- sample(2,nrow(data), replace = T,prob = c(0.8,0.2))# 복원도 하고,데이터 행의갯수 가져올게 80% 20%로
trData<- data[idx == 1, ]
teData <- data[idx == 2, ]


trData

nrow(trData)
nrow(teData)

###1번
data1 <- read.csv('C:/Rstart/1st_Rproject/박성흠 - Rbasic_datafile/박성흠 - titanic_data.csv')
data1
sample(data1)
str(data1)
t<-sample_by(data1,formula = ~1, frac = 0.8, systematic = T)
str(t)

###2번
data2<- data.frame(data$Pclass,data$Survived)# 분할표
table(data2)

data22<-table(data2)
prop.table(data22,1)#비율분할표

###3번
xtabs(~Pclass+Survived , data = data)
chisq.test(xtabs(~Pclass+Survived , data = data))

###4번
data3<-data.frame(t$Fare,t$Survived)
head(data3)
str(data3)

m <- lm(t$Fare~t$Survived)
coef(m)

# 훈련 집합의 예측값
fitted(m)

# 오차(잔차)
residuals(m)

# 평균제곱오차, 편차제곱합 : deviance
deviance(m)
deviance(m)/ length(x)# 평균제곱오차

#모델 자세히 살펴보기 : summary
summary(m)

# 보통 귀무가설을 ~와 관련이 없다로 두는데
# 0.05보다 작은값이 나오면 이 귀무가설이 기각되니까  있다가 되는거지

#모델을 이용한 예측 predict
#새로운 데이터
newx<- data.frame(data$Survived[714:891])
newx
predict(m,newdata = newx)

head(data$Fare)
data$Fare[1:15]
891-713
