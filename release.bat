call mvn clean install -Psamples
pause
call mvn versions:set -Dversions -DnewVersion=%1
pause
call mvn versions:commit -Dversions
pause
call mvn clean install -Psamples
pause
call mvn clean install -Psamples,sonatype-oss-release
pause
call mvn scm:checkin -Dmessage="Version %1"
pause
call mvn scm:tag -Dtag=%1
pause
call mvn clean deploy -Psamples,sonatype-oss-release
pause
call mvn versions:set -Dversions -DnewVersion=%2
pause
call mvn versions:commit -Dversions 
pause
call mvn scm:checkin -Dmessage="Version %2"
pause
