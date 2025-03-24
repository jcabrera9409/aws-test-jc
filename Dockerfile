FROM eclipse-temurin:21-jre

ENV HOST_BD=
ENV PORT_BD=
ENV NAME_BD=
ENV USER_BD=
ENV PASSWORD_BD=

WORKDIR /app

COPY target/*.jar application.jar

EXPOSE 8080

CMD ["java", "-jar", "application.jar"]