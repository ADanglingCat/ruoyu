FROM openjdk:17-jdk-slim
MAINTAINER npc
WORKDIR /app
EXPOSE 8858
ENV TZ=Asia/Shanghai JAVA_OPTS="-Xms128m -Xmx256m -Dserver.port=8858  -Dcsp.sentinel.dashboard.server=localhost:8858 -Dproject.name=sentinel-dashboard"
CMD java $JAVA_OPTS -jar sentinel-dashboard.jar
