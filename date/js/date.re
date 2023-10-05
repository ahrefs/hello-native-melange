/** Bucklescript implementation of the library */

type t = Js.Date.t;

let now = () => {
  Js.Date.make();
};

let tomorrow = () => {
  let t = now();
  let timestamp = Js.Date.getTime(t);
  let tomorrow = Tomorrow.tomorrow(timestamp);
  Js.Date.fromFloat(tomorrow);
};

let wrap = x => Js.Date.fromString(x);

let unwrap = x => Js.Date.toISOString(x);
