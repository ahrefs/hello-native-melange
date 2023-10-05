/** Example of a module with a fixed interface and different
implentation per platform. */

let yesterday = () => {
  let t = Date.now();
  let d = Js.Date.getDate(t);
  let y = Js.Date.setDate(t, d -. 1.);
  Js.Date.fromFloat(y);
};
