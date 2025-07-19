# Usa la imagen oficial de Chatwoot como base
FROM chatwoot/chatwoot:latest

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia archivos personalizados de tu aplicación (si tienes)
# COPY ./config /app/config
# COPY ./custom /app/custom

# Si necesitas instalar paquetes extra del sistema, descomenta:
# RUN apt-get update && apt-get install -y <paquetes>

# Si necesitas instalar gems adicionales
# COPY Gemfile Gemfile.lock ./
# RUN bundle install --without development test

# Si tienes assets o JavaScript personalizado:
# COPY package.json yarn.lock ./
# RUN yarn install && yarn build

# Puerto expuesto por Rails
EXPOSE 3000

# Punto de entrada por defecto (ya definido en docker-compose.production.yaml)
ENTRYPOINT ["docker/entrypoints/rails.sh"]
CMD ["bundle", "exec", "rails", "s", "-p", "3000", "-b", "0.0.0.0"]
