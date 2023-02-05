all: compose

list:
	docker ps -a
	docker images
	docker network ls

compose:
	docker compose --project-directory ./srcs up -d --build 

clean:
	-@docker rm -f $$(docker ps -aq) 2>/dev/null
	-@docker rmi -f $$(docker images -qa) 2>/dev/null
	-@docker volume rm $$(docker volume ls -q) 2>/dev/null
	-@docker network rm $$(docker network ls -q) 2>/dev/null
	rm -rf /home/ataleb/data/wp/*
	rm -rf /home/ataleb/data/db/*

down:
	docker compose --project-directory ./srcs down -v

prune:
	docker system prune -af

re: clean all