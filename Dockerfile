# Step 1: Use an official Python image as the base
FROM python:3.9

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy the application files to the container
COPY . .

# Step 4: Install the required dependencies
RUN pip install -r requirements.txt

# Step 5: Expose the port Flask runs on (5000)
EXPOSE 5001

# Step 6: Define the command to run the application
CMD ["python", "app.py"]
