# Load standard libraries
data("Churn")

install.packages("fst")

churn_data<-read_fst(
  '/Users/leechenhsin/Desktop/study@USA/07_UW_School/IMT573/churn.fst',
  columns = NULL,
  from = 1,
  to = NULL,
  as.data.table = FALSE,
  old_format = FALSE
)

#churn : churn (yes/no)
#gender : gender of the customer (male = 1)
#Social_Class_Score : social class of the customer
#lor : length of relationship with the customer
#recency : number of days since last purchase
#time_since_first_purchase : the standardization of time since first purchase
#time_since_last_purchase : the standardization of time since last purchase

#churn is the response variable of interest


model1 <- glm(churn ~ gender, data =Churn,family=binomial)
summary(model1)

model2 <- glm(churn ~ Social_Class_Score, data =Churn,family=binomial)
summary(model2)


#since its p-value is 0.765, which is larger than 0.05,
#so it means that the Social_Class_Score does not have a strong regression
#with churn

model3 <- glm(churn ~ lor, data =Churn,family=binomial)
summary(model3)

#since its p-value is 0.00139, which is smaller than 0.05,
#so it means that the lor,length of relationship with the customer
#has a strong regression with churn
model4 <- glm(churn ~ recency, data =Churn,family=binomial)
summary(model4)

#since its p-value is 0.00607, which is smaller than 0.05,
#so it means that the recency has a strong regression with churn
#lor,length of relationship and recency are the most important ones to
#describe customer churn

