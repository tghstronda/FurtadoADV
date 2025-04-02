# Etapa 1: Build da aplicação
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copia os arquivos do projeto e restaura as dependências
COPY . ./
RUN dotnet restore
RUN dotnet publish -c Release -o /publish

# Etapa 2: Configuração do ambiente de execução
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app

# Copia os arquivos publicados da etapa de build
COPY --from=build /publish .

# Expõe a porta 8080
EXPOSE 8080

# Comando de inicialização do contêiner
ENTRYPOINT ["dotnet", "BlazorHybridSPA.Web.dll"]
