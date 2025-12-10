#!/usr/bin/env python
# coding: utf-8

# ## Worldwide Earthquake Events API - Bronze Layer Processing
# 
# This notebook focuses on ingesting raw earthquake data from the USGS API. It performs minimal processing to store data in its original format, serving as the foundational layer for further refinement.

# **Worldwide Earthquake Events AI - Bronze Layer Processing**

# In[1]:


from datetime import date, timedelta

start_date=date.today()- timedelta(7)
end_date=date.today()- timedelta(1)

url=f"https://earthquakeusgs.gov/fdsnws/event/1/query?format=geojson&starttime={start_date}&endtime={end_date}"
print(url)


# In[2]:


import requests
import json

# Construct the API URL with start and end dates provided by Data Factory, formatted for geojson output.
url = f"https://earthquakeusgs.gov/fdsnws/event/1/query?format=geojson&starttime={start_date}&endtime={end_date}"

# Make the GET request to fetch data.
response = requests.get(url)

# Check if the request was successful
if response.status_code == 200:
    # Get the JSON response
    data = response.json()
    data = data['features']
    
    # Specify the file name (and path if needed)
    file_path = f'/lakehouse/default/Files/{start_date}_earthquake_data.json'
    
    # Open the file in write mode ('w') and save the JSON data
    with open(file_path, 'w') as file:
        # The `json.dump` method serializes `data` as a JSON formatted stream to `file`
        # `indent=4` makes the file human-readable by adding whitespace
        json.dump(data, file, indent=4)
        
    print(f"Data successfully saved to {file_path}")
else:
    print("Failed to fetch data. Status code:", response.status_code)
     

