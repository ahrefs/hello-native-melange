(** Example of a module with a fixed interface and different
    implentation per platform. *)

let yesterday () =
  let t = Date.now () in
  t -. 86_400.
