#!/usr/bin/env python
# coding: utf-8

# In[2]:


import pandas as pd


# In[3]:


df=pd.read_csv(r'Aemf1.csv', encoding='unicode_escape')


# In[4]:


df


# # Create a function that takes a list of cities as input, and returns asummary table that shows the average price, minimum price,and maximum price for each city, broken down by room type.The function should also display a scatter plot that shows therelationship between the number of listings and the averageprice for each room type in each city

# In[ ]:





# In[ ]:





# # . Calculate the average price for each day of the week, and foreach city in the dataset. Display the results in a heatmap, wherethe x-axis corresponds to the day of the week, the y-axiscorresponds to the city, and the color of each cell correspondsto the average price.
# 

# In[36]:


a=df.groupby(['Day','City']).agg({'Price':'mean'}).reset_index()
a


# In[43]:


c=a[['Price']]
c


# In[33]:


import matplotlib.pyplot as plt


# In[34]:


plt.plot(day,City,'Price')


# In[44]:


plt.imshow(c,cmap='autumn',interpolation='nearest')
plt.show()


# In[ ]:





# # Q 7. For each combination of city and room type in the dataset,calculate the median price and the 25th and 75th percentiles of the price.
# Display the results in a table with multi-level row and column headers

# In[26]:


a=df.groupby(['City','Room Type']).agg({'Price':'median'}).quantile([.25,.75]).reset_index()
a
b=a.quantile([.25,.75]).reset_index()


# In[30]:


pd.merge(a,b,on='Price', how='left')


# In[28]:


b=a.quantile([.25,.75]).reset_index()
b


# In[24]:


a['percent_25']=a.quantile(.25)
a


# In[ ]:





# In[ ]:





# In[6]:


df['Room Type'].unique()


# #  6 .For each city in the dataset, calculate the top 5 most common
# room types and their corresponding average prices.
# Additionally, for each room type, calculate the percentage of
# listings in the dataset that have that room type, and display this
# information alongside the corresponding average price.

# In[7]:


a=df.groupby(['City','Room Type']).agg({'Price':'mean'}).reset_index()
a


# In[8]:


b=df['percentage']=(df['Room Type'].value_counts()/df['Room Type'].count())*100
b.reset_index()



# In[9]:


pd.merge(a,b, on ='Room Type', how='left')


# # 5. Which city has the highest percentage of listings that are marked as "Business"?

# In[10]:


d=df[df['Business']==True].groupby(['City']).agg({'Business': 'count'})
d['Percentage']=(d['Business']/d['Business'].sum())*100
d.sort_values(by='Percentage', ascending=False)


# # 4.How many listings have a person capacity greater than or equal to 4, and what is their average price?

# In[11]:


c=df[df['Person Capacity']>=4]
print('Total -',len(c))
print('Average -',c['Price'].mean())


# # 3. Which superhost has the most listings with multiple rooms?

# In[12]:


a=df[(df['Superhost']==True) & (df['Multiple Rooms']==True)].groupby(['City']).agg({'City':'count'})
a.rename(columns={'City':'TOTAL'}, inplace=True)
a.sort_values(by='TOTAL',ascending=False)





# # 2. What is the total number of shared rooms available in the dataset?
# 
# 

# In[13]:


r=df[df['Shared Room']== True]
r['Shared Room'].value_counts()


# In[14]:


df['Shared Room'].sum()


# # 1. Which city has the highest average price for private rooms?

# In[15]:


z=df[df['Room Type']=='Private room'].groupby(['City']).agg({'Price': 'mean'})
z[z['Price']==z['Price'].max()]


# In[16]:


a=df[df['Room Type']=='Private room'].groupby(['City', 'Room Type']).agg({'Price':'mean'}).sort_values(by='Price', ascending = False)
a[a['Price']==a['Price'].max()]



# In[17]:


a[a['Price']==a['Price'].max()]


# ## 2. What is the total number of shared rooms available in the dataset?

# In[18]:


r=df[df['Shared Room']== True]
r['Shared Room'].value_counts()

# other method r=df['Shared Room'].sum()


# In[19]:


## . Which superhost has the most listings with multiple rooms?


# In[20]:


s=df[df['Superhost']== True].groupby(['City']).agg({'Multiple Rooms':'count'}).
sort_values('Multiple Rooms', ascending=False).reset_index()
s

