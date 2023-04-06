#!/usr/bin/env python
# coding: utf-8

# In[2]:


# 1)Write a python program to print your respective names 10 times using for loop and while loop
word='python'
for i in range(10):
    print(word)
count =0 
while count<10:
    print(word)
    count+=1


# In[4]:


# 2)Take user input for a natural number, calculate the sum of all number from 1 to user given number
n=int(input("Enter the number : "))
for i in range(1,11):
    sum=n*(n+1)/2
print(sum)


# In[18]:


# 3)Take user input and display the reverse range of that number, the program should stop if we enter any even number. Display the messages accordingly
n=int(input("Enter the number :"))
for i in range(n,0,-1):
    if n%2==0:
        print(f'we found the even number {n} so,we terminate the programe')
        break


# In[23]:


# 4)Take input from the user for grocery shopping and divide the items into 3 buckets -> Fresh Items (vegetables, fruits, dairy), home essentials and others simple way 
grocery=input("Enter the items : ")
grocery_list=grocery.split(',')
fresh_items=[]
home_essentials=[]
other_items=[]
for items in grocery_list:
    item_lower = items.strip()
    if item_lower in ['vegetables', 'fruits', 'dairy']:
        fresh_items.append(item)
    elif item_lower in ['cleaning supplies', 'toiletries', 'household items']:
        home_essentials.append(item)
    else:
        others.append(item)
print("Fresh Items (vegetables, fruits, dairy): ", fresh_items)
print("Home Essentials (cleaning supplies, toiletries, household items): ", home_essentials)
print("Others: ", others)


# In[33]:


# 5)Write a program to check if the number entered by the user is a *Prime number or not
n=int(input("Enter the number : "))
flag=0
for i in range(2,n):
    if n%i==0:
        flag=1
    if flag==1:
        print(f"Given number {n} is not prime")
        break
    else:
        print(f"Given number {n} is prime")
        break


# In[43]:


# 6)Write a program to check if the number entered by the user is an *Armstrong number or not
n=int(input("Enter the number : "))
sum=0
temp=n
while temp>0:
    digit=temp%10
    sum+=digit**3
    temp//=10
if n==sum:
    print("Given number is armstrong number")
else:
    print("Given number is not armstrong number")


# In[50]:


# 7)Write a program to check if the number entered by the user is *Palindrome number or not
num=int(input("Enter the number : "))
num_str=str(num)
num_reversed=num_str[::-1]
if num_str==num_reversed:
    print(f'Given number {num} is palindrome number')
else:
    print(f'Given number {num} is not a palindrome number')


# In[60]:


# 8)Write a program to calculate factorial of the number entered by the user, program should stop if the user enters a Palindrome number
def is_palindrome(n):
    num_str=str(n)
    num_reversed=num_str[::-1]
    return num_str==num_reversed
num=int(input("Enter the number : "))
if is_palindrome(num):
    print(num,"is a palindrome number ")
    print("stop the program")
else:
    fact=1
    for i in range(1,num+1):
        fact=fact*i
    print(f'the factorial of the number {fact}')


# In[61]:


# 9)Write a program to display the *Fibonacci series for the first 10 natural numbers
def feb(n):
    a=0
    b=1
    if (n==1):
        print(a)
    print(a)
    print(b)
    for i in range(0,n):
        c=a+b
        a=b
        b=c
        print(c,end=" ")
feb(10)


# In[69]:


# Write a program to display the below pattern
# *
# **
# ***
n=int(input("Enter the number : "))
for i in range(0,n):
    print("*"*i)


# In[76]:


# 11)Write a program to display the below pattern
# a
# b c
# d e f
# g h i j
# k l m n o
for i in range(65,80):
    for j in range(65,i+1):
        print(chr(i),end='')
    print()


# In[126]:


# 12)Write a program to convert a time converter,
# • if the user enters 12-hour format for a time convert it to 24-format
# • If user enters 24-hour format for a time convert it to 12-hour format
# Example -> 7:00PM (12-hour format) => 19:00 (24-hour format)
# 18:30 (24-hour format) => 6:30PM (12-hour format)
# 2:00 (24-hour format) => 2:00 AM (12-hour format)
from datetime import datetime
time=input("Enter the time ")
if 'AM' in time or 'PM' in time:
    time_format='%I%M%P'
else:
    time_format='%H:%M'
time_obj=datetime.strptime(time,time_format)
if 'AM' in time:
    time_24h=time_obj.strftime("%H:%M")
    print(time)
    print(time_24h)
elif 'PM' in time:
    tim_24h=time_obj.strftime("%H:%M")
    print(time)
    print(time_24h)
else:
    time_12hr=time_obj.strftime('%I:%M%p')
    print(time)
    print(time_12hr)


# In[84]:


# 13)Write a program to convert temperature from Celsius to Fahrenheit or vice-versa
c=float(input("Enter the number : "))
f=(c*(9/5))+32
print(f"the temperature of the fahrenheit is {f} f")


# In[91]:


# 14)Write a program to take a string input from user, calculates the number of digits, letters and special characters
alpha,name=0,"python19"
for i in name:
    if (i.isalpha()):
        alpha+=1
print(len(name)-alpha)
print(alpha)


# In[113]:


# 15)Write a program to create strong password, with following conditions • At least 1 letter between [a-z] and 1 letter between [A-Z]. • At least 1 number between [0-9]. • At least 1 character from [$#@]. • Minimum length 6 characters. • Maximum length 16 characters
import random
import string
lower_letters=string.ascii_lowercase
upper_letters=string.ascii_uppercase
digits=string.digits
special_char="@#$"
min_length=6
max_length=16
password=[]
char_all=random.choice(lower_letters)+random.choice(upper_letters)+random.choice(digits)+random.choice(special_char)
remaing=max_length-len(password)
for i in char_all:
    password.append(random.choice(char_all))
    random.shuffle(password)
print(password)


# In[ ]:




