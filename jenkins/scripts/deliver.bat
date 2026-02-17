@echo off
echo The following Maven command installs your Maven-built Java application
echo into the local Maven repository, which will ultimately be stored in
echo Jenkins's local Maven repository.
echo.

echo Running Maven install and extracting project name...
mvn jar:jar install:install help:evaluate -Dexpression=project.name

echo.
echo Extracting project name from pom.xml...
for /f "delims=" %%i in ('mvn -q -DforceStdout help:evaluate -Dexpression=project.name') do set NAME=%%i

echo Extracting project version from pom.xml...
for /f "delims=" %%i in ('mvn -q -DforceStdout help:evaluate -Dexpression=project.version') do set VERSION=%%i

echo.
echo Project Name: %NAME%
echo Project Version: %VERSION%

echo.
echo Running the built Java application...
java -jar target\%NAME%-%VERSION%.jar
