open Tea.App
open Tea.Html

type msg =
  | Increment // (* This will be our message to increment the counter *)
  | Decrement // (* This will be our message to decrement the counter *)
  | Reset // (* This will be our message to reset the counter to 0 *)
  | Set(int) // (* This will be out message to set the counter to a specific value *)

type model = int

let init = () => 42

let update = (model, msg) => {
  switch msg {
  | Increment => model + 1
  | Decrement => model - 1
  | Reset => init()
  | Set(x) => x
  }
}

let viewButton = (~title, ~disabled=false, ~msg, ()) =>
  button(list{Events.onClick(msg), Attributes.disabled(disabled)}, list{text(title)})

let empty = list{}

let view = model =>
  div(
    empty,
    list{
      span(list{Attributes.class("count")}, list{text(string_of_int(model))}),
      div(
        list{Attributes.class("button-list")},
        list{
          viewButton(~title="Increment", ~msg=Increment, ()),
          viewButton(~title="Decrement", ~msg=Decrement, ()),
          viewButton(~title="Set to 42", ~disabled=model == 42, ~msg=Set(42), ()),
          model != 42 ? viewButton(~title="Reset", ~msg=Reset, ()) : noNode,
        },
      ),
    },
  )

let main = beginnerProgram({
  model: init(),
  update,
  view,
})
