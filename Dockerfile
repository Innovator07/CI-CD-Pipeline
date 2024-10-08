#FROM node as builder
#COPY ./ ./
#RUN npm install
#RUN npm run build


#FROM nginx
#COPY --from=builder ./build /usr/share/nginx/html

# Builder stage
FROM node:16 AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Production stage
FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html
EXPOSE 80


