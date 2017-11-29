function start_server() {
  cd ../ep-server
  npm run start:prod
}

function start_client() {
  cd ../ep-client
  npm run start:prod
}

start_server & start_client
