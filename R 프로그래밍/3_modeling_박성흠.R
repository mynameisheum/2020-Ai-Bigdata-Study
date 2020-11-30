x <- c(3.0, 6.0, 9.0, 12.0)
y <- c(3.0, 4.0, 5.5, 6.5)
x;y

m <- lm(y~x)
m# y절편,x 기울기

# 매개변수 확인
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
newx<- data.frame(x = c(1.2,2.0,20.65))
newx
predict(m,newdata = newx)










