# Toolmax

A game with the following properties:

- real-time multiplayer
- a physics-based world
- cross-platform (iOS, Android, Web)

## How it works

This project has two parts that communicate using Socket.io:

1. `server` using Matter.js (intended for deployment to Replit)
2. `toolmax`, a Flutter client (intended for deployment to iOS, Android, and Web)

## Notes

- `server` is written in JavaScript (because Matter.js does not have the best support for TypeScript). However, `server` may eventually be upgraded to use Deno or something else. Matter.js and Socket.io were chosen for their ease-of-use.

- `toolmax` is the Flutter client. During a match, Flame is used to render world state from the server as "components" on a "canvas". The client has "controls" that send input signals to the server to influence the world state.
