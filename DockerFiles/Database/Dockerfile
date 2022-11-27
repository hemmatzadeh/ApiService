FROM mcr.microsoft.com/mssql/server:2017-latest

# Accept End User Licensing Aggreement
ENV ACCEPT_EULA='Y'
# Set System Admin password
ENV SA_PASSWORD='0B&VC5*c35!x'

# Copy databases
COPY ./Query/FlowardMsSQLSchema.sql ./Floward.sql

# Install dos2unix to remove windows file system line endings
RUN apt-get update && apt-get install -y dos2unix

# Copy setup script
COPY ./setup.sh ./setup.sh

# Remove windows line endings from estup.sh
RUN dos2unix /setup.sh && apt-get --purge remove -y dos2unix && rm -rf /var/lib/apt/lists/*

RUN chmod 755 ./setup.sh

CMD ["./setup.sh"]
