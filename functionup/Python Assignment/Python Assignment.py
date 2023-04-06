#!/usr/bin/env python
# coding: utf-8

# In[1]:


#1.	Write a program to demonstrate different number types in Python
#integer
a=10
print(a)
#Float
b=11.2
print(b)
# Complex
c=2+1j
print(c)
print('\n')
#type function
print(type(a))
print(type(b))
print(type(c))


# In[2]:


#2.	Write a program to perform different arithmetic operations on numbers
x=10
y=5
# Addition
print(x+y)
# Subraction
print(x-y)
# Multiplication
print(x*y)
# Divison but we got dicimal value
print(x/y)
# Division but we got number only
print(x//y)
# Modulu we got Quotient
print(x%y)


# In[3]:


#3.	Write a program to create, concatenate and print a string and accessing sub-string from a given string
first_name="Python"
Last_name="world"
full_name=first_name+" "+Last_name
sub_string=full_name[6:]
print(full_name)
print(sub_string)


# In[4]:


# 4.	Write a python script to print the current date in the following format – “Sun Jan 15 18:30:30 IST 2023”
import datetime
current=datetime.datetime.now()
formatted=current.strftime("%a %b %d %H:%M:%S IST %Y")
print(formatted)


# In[5]:


#5.	Write a program to create, append and remove elements from the list
# create list
l=[1,2,3]
print(l)
#append the list
print('\n')
l.append(4)
print(l)
#remove
print('\n')
l.remove(1)
print(l)


# In[6]:


#6.	Write a program to demonstrate working with Tuples – All operations possible with Tuple
# create tuple
t=(1,2,3)
#but we need to perform the operations then convert the tuple into list
li=list(t)
#performing operations
#append
li.append(4)
print(li)
# remove
li.remove(1)
print(li)
# again convert the list into tuple then we got the tuple
t=tuple(li)
print(t)


# In[7]:


# 7.	Write a program to demonstrate working with Dictionary – All operations possible with Dictionary
# create dictionary
d={'A':"Apple","B":"Ball"}
# Update dict
d["C"]='Cat'
print(d)
#keys
print(d.keys())
#Values
print(d.values())
# delete
del d['C']
print(d)


# In[8]:


# 8.	Write a Python program to convert a string to a list.
name =input("Enter the name : ")
for names in name:
    print(names.split(","),end='\n')


# In[9]:


#9.	Write a Python program to remove words from a given list of strings containing a character or string.
#Original list:
#New list:
#['Red', '', 'Green', 'Orange', 'White']

list1=['Red color', 'Orange#', 'Green', 'Orange @', 'White']
char_list=["#","color","@"]
new_list=[]
for li in list1:
    for char in char_list:
        li=li.replace(char,"")
    new_list.append(li.strip())
print(new_list)


# In[30]:


# 10.	Write a Python program to check whether an alphabet is a vowel or consonant Expected Output:
# Input a letter of the alphabet: k 
# k is a consonant.
word=input("Enter name the word : ")
for words in word:
    if words in ['a','i','e','o','u']:
        print(f'Given {words} are vowels')
    else:
        print(f'Given {words} are consonant')


# In[11]:


# 11.	Concat two components in Python, take two user input and concat the two elements using 7 in between
fist_name=input("Enter the first name :")
lst_name=input("Enter the last name :")
fu_name=fist_name+str(7)+lst_name
print(f'full_name :  {fu_name}')


# In[12]:


# 12.	Taking the output from the above question, separate the string into two separate elements
fist_name=input("Enter the first name :")
lst_name=input("Enter the last name :")
fu_name=fist_name+str(7)+lst_name
seprate=fu_name.split('7')
print(f'full_name :  {fu_name}')
print(f'separate_name : {seprate}')


# In[34]:


# 13.	Create a list having 10 elements, use user input to build the list.
# •	Output 2nd element to 8th element
# •	Ouput all even elements
# •	Output all odd elements
# •	Output reverse of the list
my_list=[]
for i in range(1,11):
    element=int(input("Enter the Element : "))
    my_list.append(element)
print(my_list)
print("----------------------------------------------------")
print("the output 2 nd element to 8 th element",my_list[1:8])
print("All even elements",my_list[1:10:2])
print("All odd elements",my_list[::2])
print("All reverse of the list",my_list[::-1])


# In[16]:


# 14.	Create a dictionary with any 5 states of India, States as Key and top 5 city as values
city={"Maharashtra":"Mumbai","UP":"Delhi","Telangana":"Hyderabad","Karnataka":"Bangalore","Tamil Nadu":"Chennai"}
print(city)


# In[18]:


# 15.	Use Output from 14, to add a new state key along with cities associated with it
city["Gujarat"]='Ahmedabad'
print(city)


# In[19]:


# 16.	Create a list using first 5 Alphabets (A,B,C,D,E); repeat the each elements 5 times. Do not create 2D list
alphabets=['A','B','C','D']
print(alphabets*5)


# In[28]:


# 17.	Using the output from 16, remove duplicates from the list
s=set(alphabets)
Alpha=list(s)
Alpha.sort()
print(Alpha)


# In[23]:


# 18.	What is 2D list? Demonstrate with a example
#A 2D list, also known as a two-dimensional list, is a list of lists in Python. It is a collection of items which are arranged in a grid, with rows and columns. Each element in a 2D list is itself a list.
# example
num1=[1,2,3]
num2=[1,2,3]
num=[num1,num2]
print(num)


# In[ ]:




