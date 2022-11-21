(** Native implementation of the library *)

type t = float
(** In native we use a timestamp to represent a date *)

(** Returns the current time. *)
let now () = Unix.time ()

let tomorrow () =
  let t = now () in
  Tomorrow.tomorrow t
