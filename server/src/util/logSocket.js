const socketIds = new Set();

function logSocket(socket) {
  let type;

  if (socketIds.has(socket.id)) {
    socketIds.delete(socket.id);
    type = 'disconnect';
  } else {
    socketIds.add(socket.id);
    type = 'connect';
  }

  const colorIndex = socket.id.charCodeAt(0) % 7;
  const formatString = `\x1b[3${colorIndex}m%s\x1b[0m`;
  console.log(formatString, `${socketIds.size} ${type} ${socket.id}`);
}

module.exports = logSocket;
