# Karate

## Environments

Check JDK version.

```sh
java --version
```

```text
openjdk 21.0.10 2026-01-20 LTS
OpenJDK Runtime Environment Microsoft-13106412 (build 21.0.10+7-LTS)
OpenJDK 64-Bit Server VM Microsoft-13106412 (build 21.0.10+7-LTS, mixed mode, sharing)
```

Check Maven version.

```sh
mvn -v
```

```text
Apache Maven 3.9.14 (996c630dbc656c76214ce58821dcc58be960875b)
Maven home: /usr/local/sdkman/candidates/maven/current
Java version: 21.0.10, vendor: Microsoft, runtime: /usr/lib/jvm/msopenjdk-current
Default locale: en_US, platform encoding: UTF-8
OS name: "linux", version: "5.14.0-687.el9.x86_64", arch: "amd64", family: "unix"
```

## Create

Create testing project.

```sh
mvn archetype:generate \
    -DarchetypeGroupId=io.karatelabs \
    -DarchetypeArtifactId=karate-archetype \
    -DarchetypeVersion=1.5.1 \
    -DgroupId=local.home \
    -DartifactId=testing
```

## Run

Prepare mock HTTP server.

```sh
podman run --rm -p 8080:80 docker.io/kennethreitz/httpbin
```

Run all tests in directory that exist pom.xml.

```sh
mvn test -DbaseUrl=http://httpbin:8080
```

Run the feature's test.

```sh
mvn test \
    -DbaseUrl=http://httpbin:8080 \
    -Dkarate.options="classpath:samples/roots/01-basic.feature"
```

Run one scenario (specific line number).

```sh
mvn test \
    -DbaseUrl=http://httpbin:8080 \
    -Dkarate.options="classpath:samples/roots/01-basic.feature:3"
```

Run specified tag test in the feature.

```sh
mvn test \
    -DbaseUrl=http://httpbin:8080 \
    -Dkarate.options="classpath:samples/roots/01-basic.feature@readonly"
```

Run exclude tag test in the feature.

```sh
mvn test \
    -DbaseUrl=http://httpbin:8080 \
    -Dkarate.options="classpath:samples/roots/01-basic.feature --tags ~@readwrite"
```

## References

- [API Testing made simple for modern teams.](https://docs.karatelabs.io/)
- [demo](https://github.com/karatelabs/karate/tree/master/karate-demo/src/test/java/demo)
