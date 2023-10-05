Js.log ("yesterday was " ^ Js.Date.toISOString (Date_js.Yesterday.yesterday ()))

let user : Date_js.User_t.t =
  { name = "Joe"; added = Date_js.Yesterday.yesterday () }

let () = Js.log ("user is " ^ Json.stringify (Date_js.User_bs.write_t user))
