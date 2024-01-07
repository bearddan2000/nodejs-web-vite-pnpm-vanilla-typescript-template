FROM alpine

WORKDIR /workspace

RUN apk update

RUN apk add npm

RUN wget -qO- https://get.pnpm.io/install.sh | ENV="$HOME/.shrc" SHELL="$(which sh)" sh -

RUN source /root/.shrc

WORKDIR /code

COPY bin .

RUN npm i vite

# For doc purpose only
# RUN pnpm create vite <app_name> --template vanilla-ts

CMD "pnpm run dev"