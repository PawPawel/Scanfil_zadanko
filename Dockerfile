#build stage
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /source
COPY . .
RUN dotnet restore "./NET6APIInDocker/NET6APIInDocker.csproj"
RUN dotnet publish "./NET6APIInDocker/NET6APIInDocker.csproj" -c release -o /app --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /app ./

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["dotnet", "NET6APIInDocker.dll"]
