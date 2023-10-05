let timestamp_string timestamp =
  let t = Unix.gmtime timestamp in
  Printf.sprintf "%04d-%02d-%02d, %02d%02d" (1900 + t.tm_year) (t.tm_mon + 1)
    t.tm_mday t.tm_hour t.tm_min

let () =
  print_endline
    ("yesterday was " ^ timestamp_string (Date_native.Yesterday.yesterday ()))

let user : Date_native.User_t.t =
  { name = "Joe"; added = Date_native.Yesterday.yesterday () }

let () = print_endline ("user is " ^ Date_native.User_j.string_of_t user)
