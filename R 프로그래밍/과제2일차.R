df <- read.csv('C:/Rstart/1st_Rproject/박성흠 - Rbasic_datafile/전국휴양림표준데이터.csv',na.strings = NA)
df  
df[is.na(df)]
table(is.na(df))
m_df<-mean(df$수용인원수, na.rm=T)
m_df
df$수용인원수[is.na(df$수용인원수)] <- m_df
table(is.na(df))

##########################################
df %>% 
  filter(숙박가능여부 == 'Y') %>% 
  group_by(시도명,수용인원수) %>% 
  summarise(count=n()) %>% 
  arrange(desc(count)) %>% 
  head(20)
df


df2<-df %>% 
  filter(숙박가능여부 == 'Y')
table(df$시도명)
table(df2$시도명)

df %>% 
  filter(숙박가능여부 == 'Y') %>%
  summarise(group_by(df,시도명),sum(수용인원수))

dfdf<-df %>% 
  filter(숙박가능여부 == 'Y') %>%
  select(시도명,수용인원수)

m<-summarise(group_by(dfdf,시도명),sum = sum(수용인원수))
n<-table(df2$시도명)
mm<-data.frame(a=m)
nn<-data.frame(a=n)
left_join(mm,nn)


# 종하고 성별 받아서 키하고 몸무게받 select해서 평균볼게
df %>% 
  group_by(species, sex) %>% 
  select(height, mass) %>% 
  summarise(
    height = mean(height, na.rm = T),
    mass = mean(mass, na.rm = T)
  )

##
df %>% 
  filter(숙박가능여부 == 'Y') %>% 
  group_by(시도명) %>% 
  summarise(n =n(),
            total = 수용인원수+n) %>% 
  arrange(desc(total)) %>% 
  head(5)



head(df)

  mutate(total=) %>% 
  summarise(sum_total = sum(total)) %>% 
  arrange(desc(sum_total)) %>% 
  head(5)


df %>% 
  filter(시도명 == '경기도') %>% 
  group_by(수용인원수) %>% 
  summarise(count=n()) %>% 
  arrange(desc(count)) %>% 
  head(20)
##############################
df1<-df %>% 
  mutate(밀집도 = 수용인원수/휴양림면적) %>% 
  arrange(밀집도) %>% 
  select(휴양림명,시도명,밀집도,휴양림전화번호) %>% 
  arrange(밀집도)
df1  
df_low<-df1[2:4,]
df_low
df_high<-df1 %>% 
          tail(3)
df_high

df3<-bind_rows(df_low,df_high)
df3


a <- data.frame(휴양림명 =  c('강씨봉자연휴양림','축령산자연휴양림','국망봉자연휴양림','금산산림문화타운','유치자연휴양림','서대산약용자연휴양림'),
                    밀집표현 = c('LD','LD','LD','HD','HD','HD'))  

left_join(df3,a)
