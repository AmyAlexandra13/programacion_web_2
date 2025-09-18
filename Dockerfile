FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src
COPY ["PrimeraPractica/MiPrimeraApp.csproj", "PrimeraPractica/"]
RUN dotnet restore "PrimeraPractica/MiPrimeraApp.csproj"
COPY . .
RUN dotnet publish "PrimeraPractica/MiPrimeraApp.csproj" -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "MiPrimeraApp.dll"]