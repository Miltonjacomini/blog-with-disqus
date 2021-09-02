# Imagem de Origem
FROM 280917728158.dkr.ecr.us-east-1.amazonaws.com/ci/node:14.16.1-alpine


ARG codeartifact_token
ENV CODEARTIFACT_AUTH_TOKEN=$codeartifact_token

# Diretório de trabalho(é onde a aplicação ficará dentro do container).
WORKDIR /usr/src/app

# Adicionando `/app/node_modules/.bin` para o $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH

# Instalando dependências da aplicação e armazenando em cache.
COPY package.json /app/package.json

RUN npm install --silent
RUN npm install react-scripts@4.0.3 -g --silent

# Inicializa a aplicação
CMD ["npm", "start"]