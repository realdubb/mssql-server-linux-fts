FROM microsoft/mssql-server-linux:2017-CU12

#Install curl since it is needed to get repo config
# Get official Microsoft repository configuration
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y curl  && \
    curl https://packages.microsoft.com/config/ubuntu/16.04/mssql-server-2017.list | tee /etc/apt/sources.list.d/mssql-server-2017.list && \
    curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | tee /etc/apt/sources.list.d/prod.list && \
    apt-get update

# Install optional packages.  Comment out the ones you don't need
# RUN apt-get install -y mssql-server-agent
# RUN apt-get install -y mssql-server-ha
RUN apt-get install -y mssql-server-fts


CMD /opt/mssql/bin/sqlservr
