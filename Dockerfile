FROM dhaks/mule4.3.0

COPY /location-system-api/target/*.jar /opt/mule/apps/

EXPOSE 8081

CMD [ "/opt/mule/bin/mule"]
