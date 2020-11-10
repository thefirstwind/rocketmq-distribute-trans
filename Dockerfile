FROM fabric8/java-alpine-openjdk8-jre
ADD ["target/spring-rocketmq-mysql-transaction-integration.jar", "app.jar"]
EXPOSE 18181 18787
ENV JAVA_OPTS="-Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=18787,suspend=n"
RUN sh -c 'touch /app.jar'
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -Dspring.profiles.active=docker -jar /app.jar" ]
