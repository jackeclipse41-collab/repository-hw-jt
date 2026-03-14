FROM python:3.9-slim
WORKDIR /app
RUN echo "Homework 3 Docker Image" > hello.txt
CMD ["tail", "-f", "/dev/null"]
