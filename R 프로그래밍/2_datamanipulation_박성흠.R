#dplyr 패키지 -> dataframe에만 사용 가능
#설치해야 가능
install.packages('dplyr')
library(dplyr)

starwars
df<- as.data.frame(starwars)
head(df)

df %>% head(3)
df %>% tail(3)

#filter:조건으로 일부 행 추출

df %>% 
  filter(species == 'Droid')# 조건넣고
df %>% 
  filter(skin_color == 'light', eye_color=='brown')

#slice:위치기반으로 일부 행 추출
df %>% 
  slice(5:10)

#slice_sample : 임의행 추출
df %>% 
  slice_sample(n=5)# 5개를 임의로추출

df %>% 
  slice_sample(prop = 0.1)# 비율로..전체중 0.1=10%만추출

str(df)

dim(df)

#행 추출
#slice_max, slice_min: 상위or 하위 데이터 추출, 단, NA 제거 하고 실행해야함

df %>% 
  filter(!is.na(height)) %>% # height에 NA 아닌것들만 가져오고
  slice_max(height, n=3)# 만들어진 것들 중에서 MAX 3개 가져올거야


#select : 열추출
df %>% 
  select(hair_color,skin_color,eye_color)

df %>% 
  select(hair_color:eye_color)

df %>% 
  select(!(hair_color:eye_color)) # column에 hair~ eye까지 제외하고 표현

df %>% 
  select(name,ends_with('color'))# 변수의 이름이 color로 끝나는 것들


## select를 이용한 변수 이름 변경 가능
a<-df %>% 
  select(home_world = homeworld)
a
# rename :변수명 변경
df %>% 
  rename(home_world = homeworld)

#mutate: 변수 추가
df %>% 
  mutate(height_m = height / 100)# 기존의 변수를 이용해아함

df %>% 
  mutate(height_m = height / 100) %>% 
  select(height_m,height,everything())# height_m의 순서서

df %>% 
  mutate(
    height_m = height / 100,
    bmi = mass/(height_m ^ 2)# 기존의 변수명 이용해 새로운 열 만들고
  ) %>%                     # 그 열을 다시 이용해서 새롱누 변수 만들수 있고
  select (name,height_m,mass,bmi)# 보고싶은것만 골라볼수이슴



#transmute : 새로 추가한 변수만 확인
df %>% 
  transmute(
    height_m = height / 100,
    bmi = mass/(height_m ^ 2))

#arrange : 정렬

df %>% 
  arrange(mass)# 기준이 되는 변수의 이름 넣어주기/ 작은거부터 큰거/오름차순

df %>% 
  arrange(desc(mass))# 내림차순


#summarize:요약 통계
df %>% 
  summarise(height = mean(height, na.rm = T))# NA를 제외한 평군군



# groupby: 그룹핑 (여기서 summarize가 활용됨)
df %>% 
  group_by(species) %>% 
  summarise(
    n = n(),# 종의 개수
    height = mean(height, na.rm=T)# 종의 평균 키
  ) %>% 
  filter(n>1)

# %>%  질의 연결
# 종하고 성별 받아서 키하고 몸무게받 select해서 평균볼게
df %>% 
  group_by(species, sex) %>% 
  select(height, mass) %>% 
  summarise(
    height = mean(height, na.rm = T),
    mass = mean(mass, na.rm = T)
  )


# join: 2개의 dataframe 합치기/병함

d1 <- data.frame(kids = c('jack','jane','jahn','lily'),
                 states = c('ca','ny','nv','tx'))
d2 <- data.frame(kids = c('jane','jack','kevin'),
                 age = c(10,12,8))
d3 <- data.frame(name = c('jane','jack','kevin'),
                 age = c(10,12,8))

d1;d2;d3


inner_join(d1,d2,by = 'kids')# inner_join할거고 기준은 kids라는 변수로..
left_join(d1,d2)# d1기준으로 다 나열하고 d2를 d1에 없는걸 추가
right_join(d1,d2,by='kids')

# 변수의 이름이 서로다른 걸 join하려할때
inner_join(d1,d3,by = c('kids' = 'name'))#  =기준으로 왼쪽 오른쪽의 비슷한속성을 병함


#bind_rows: 두 dataframe 합치기(위아래방향으로)
t1<-data.frame(id = c(1:5),
               test = seq(10,50,by=10))
t2 <- data.frame(id = c(6:8),
                 test = seq(60,80,by = 10))
bind_rows(t1,t2)
