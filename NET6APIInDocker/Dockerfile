#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["NET6APIInDocker/NET6APIInDocker.csproj", "NET6APIInDocker/"]
RUN dotnet restore "NET6APIInDocker/NET6APIInDocker.csproj"
COPY . .
WORKDIR "/src/NET6APIInDocker"
RUN dotnet build "NET6APIInDocker.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "NET6APIInDocker.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "NET6APIInDocker.dll"]