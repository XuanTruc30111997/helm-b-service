# Getting Started
* **Build package** mvn package -Dmaven.test.skip
* **Build Docker** docker build -t practice-helm/b-service:1.1.1 .
* **Tag Image** docker tag practice-helm/b-service:1.1.1 <repo>/helm-b-service:1.1.1
* **Push Image** docker push <repo>/helm-b-service:1.1.1
### Reference Documentation
For further reference, please consider the following sections:

* [Official Apache Maven documentation](https://maven.apache.org/guides/index.html)
* [Spring Boot Maven Plugin Reference Guide](https://docs.spring.io/spring-boot/docs/2.7.3/maven-plugin/reference/html/)
* [Create an OCI image](https://docs.spring.io/spring-boot/docs/2.7.3/maven-plugin/reference/html/#build-image)

