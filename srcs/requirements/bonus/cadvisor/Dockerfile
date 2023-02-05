FROM debian:buster

RUN apt -y update && apt install -y wget
RUN wget https://github.com/google/cadvisor/releases/download/v0.36.0/cadvisor
RUN chmod +x cadvisor
EXPOSE 8080

CMD ["./cadvisor"]