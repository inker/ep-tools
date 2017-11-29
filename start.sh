function start_server() {
  cd ../ep-server
  npm i
  npm run start:prod
}

function start_client() {
  cd ../ep-client
  npm i
  npm run start:prod
}

start_server & start_client
