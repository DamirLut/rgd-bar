const ws = require('ws');

const server = new ws.Server({ port: 9000 });

const discordGateway = 'wss://gateway.discord.gg/?v=10&encoding=json';

server.on('connection', (socket) => {
  const gateway = new ws(discordGateway);

  const stack = [];

  gateway.on('open', () => {
    console.log('GATEWAY ready');

    gateway.on('message', (data) => {
      console.log('GATEWAY => CLIENT');
      socket.send(data);
    });

    setInterval(() => {
      const value = stack.shift();
      if (value) {
        console.log('CLIENT => GATEWAY');
        gateway.send(value);
      }
    }, 1);
  });

  socket.on('message', (data) => stack.push(data));

  gateway.on('close', () => {
    console.log('GATEWAY CLOSED');
    socket.close();
  });
  socket.on('close', () => {
    console.log('CLIENT CLOSED');
    gateway.close();
  });

  console.log('connected');
});

console.log('Server started...');
